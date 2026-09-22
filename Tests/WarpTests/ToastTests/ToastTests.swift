import Testing
import SwiftUI
import ViewInspector
@testable import Warp

/// The time limit is the inner bound the CI job timeout cannot give: this suite waits on a timer,
/// so it is where a hang would land, and xcodebuild's `-default-test-execution-time-allowance`
/// only reaches XCTest. One minute is the finest granularity the trait offers - far above the
/// ~0.3s this should take, but enough to fail by name instead of wedging the run.
@Suite(.timeLimit(.minutes(1)))
struct ToastTests {

    @Test @MainActor
    func testToastShouldAutomaticallyDisappear() async throws {
        let dissapearAfterTime: TimeInterval = 0.3
        // Very generous, because it is an upper bound on a poll rather than a fixed wait, and
        // because hosting the view is far slower than the dismissal being measured. Locally that
        // costs ~0.5s warm and ~1.1s cold; on the iOS 26 CI runner it has been measured at 3.5s
        // and 6.5s in consecutive runs, which is the same one-time-initialisation slowness that
        // makes the first test case in the process look pathological.
        //
        // This test therefore asserts that the toast dismisses, not that it dismissed *on the
        // duration it was given*. Elapsed wall time cannot separate those here: the spread in
        // attachment cost is the same order as the gap between the 0.3s duration and the 5s
        // `Duration.short` fallback, so any threshold that catches a dropped `duration:` argument
        // also fails on a slow runner. Catching that regression needs a structural assertion on
        // the modifier rather than a stopwatch.
        let waitingTime: TimeInterval = dissapearAfterTime + 15

        let isPresented = Binding<Bool>(wrappedValue: true)
        
        let toast = EmptyView()
            .warpToast(
                style: .success,
                title: "This is a toast message",
                edge: .top,
                duration: .custom(interval: dissapearAfterTime),
                isPresented: isPresented
            )
        ViewHosting.host(view: toast)

        #expect(isPresented.wrappedValue == true, "Toast should be presented initially")

        let dismissed = await waitUntilDismissed(isPresented, timeout: waitingTime)

        #expect(dismissed, "Toast should disappear after \(dissapearAfterTime) seconds")
    }
}

extension Task where Success == Never, Failure == Never {

    static func sleep(timeInterval: TimeInterval) async throws {
        let nanoseconds = UInt64(timeInterval * 1_000_000_000)
        try await Task.sleep(nanoseconds: nanoseconds)
    }
}

/// Polls until the binding flips, rather than sleeping for a fixed margin and asserting once.
///
/// Dismissal is driven by a `.task` modifier, which only starts once SwiftUI has attached the
/// hosted view. On a slow machine that attachment alone can eat the margin, so a single sleep
/// races the runner rather than testing the component. Polling asserts the same thing, returns as
/// soon as the toast dismisses, and only spends the full timeout when something is genuinely wrong.
///
/// Cancellation ends the poll rather than being swallowed: this runs on the main actor, so a
/// discarded `CancellationError` would turn every remaining iteration into a spin once a
/// `.timeLimit` trait or an xcodebuild teardown cancels the task.
@MainActor
func waitUntilDismissed(
    _ isPresented: Binding<Bool>,
    timeout: TimeInterval,
    pollInterval: TimeInterval = 0.05
) async -> Bool {
    let deadline = Date().addingTimeInterval(timeout)
    while isPresented.wrappedValue, Date() < deadline {
        do {
            try await Task.sleep(timeInterval: pollInterval)
        } catch {
            break
        }
    }
    return !isPresented.wrappedValue
}
