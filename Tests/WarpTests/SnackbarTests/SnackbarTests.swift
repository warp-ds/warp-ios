import Testing
import SwiftUI
import ViewInspector
@testable import Warp

/// Time-limited for the same reason as `ToastTests`: this suite waits on a timer, and xcodebuild's
/// `-default-test-execution-time-allowance` only reaches XCTest.
@Suite(.timeLimit(.minutes(1)))
struct SnackbarTests {

    @Test @MainActor
    func testSnackbarShouldAutomaticallyDisappear() async throws {
        let dissapearAfterTime: TimeInterval = 0.3
        // Generous, because it is an upper bound on a poll rather than a fixed wait: hosting the
        // view costs about 0.7s before the `.task` dismissal even starts, so a tight deadline
        // races the runner. The deadline alone cannot prove the duration was honoured, though -
        // it is longer than `Duration.short` (4s), which is what `warpSnackbar` falls back to.
        // The elapsed-time assertion below is what catches a dropped `duration:` argument.
        let waitingTime: TimeInterval = dissapearAfterTime + 5
        // Comfortably above the ~1s a healthy dismissal takes, and comfortably below the 4s
        // fallback.
        let fallbackThreshold: TimeInterval = 3

        let isPresented = Binding<Bool>(wrappedValue: true)

        let snackbar = EmptyView()
            .warpSnackbar(
                type: .positive,
                title: "This is a snackbar message",
                action: nil,
                duration: .custom(interval: dissapearAfterTime),
                isPresented: isPresented
            )
        ViewHosting.host(view: snackbar)

        #expect(isPresented.wrappedValue == true, "Snackbar should be presented initially")

        let start = Date()
        let dismissed = await waitUntilDismissed(isPresented, timeout: waitingTime)
        let elapsed = Date().timeIntervalSince(start)

        #expect(dismissed, "Snackbar should disappear after \(dissapearAfterTime) seconds")
        #expect(
            elapsed < fallbackThreshold,
            "Snackbar took \(elapsed)s to dismiss, which suggests it fell back to Duration.short rather than honouring the \(dissapearAfterTime)s duration passed in"
        )
    }
}
