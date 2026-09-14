import Testing
import SwiftUI
import ViewInspector
@testable import Warp

@Suite
struct ToastTests {

    @Test @MainActor
    func testToastShouldAutomaticallyDisappear() async throws {
        let dissapearAfterTime: TimeInterval = 0.3
        // Generous, because it is an upper bound on a poll rather than a fixed wait: a healthy
        // toast returns in roughly `dissapearAfterTime` regardless.
        let waitingTime: TimeInterval = dissapearAfterTime + 5

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
@MainActor
func waitUntilDismissed(
    _ isPresented: Binding<Bool>,
    timeout: TimeInterval,
    pollInterval: TimeInterval = 0.05
) async -> Bool {
    let deadline = Date().addingTimeInterval(timeout)
    while isPresented.wrappedValue, Date() < deadline {
        try? await Task.sleep(timeInterval: pollInterval)
    }
    return !isPresented.wrappedValue
}
