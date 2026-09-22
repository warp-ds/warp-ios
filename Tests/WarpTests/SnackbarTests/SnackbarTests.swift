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
        // Very generous, for the reasons spelled out in `ToastTests`: view hosting dominates the
        // dismissal being measured and has been seen to take 6.5s on the iOS 26 CI runner, so
        // this asserts that the snackbar dismisses rather than that it honoured the duration.
        let waitingTime: TimeInterval = dissapearAfterTime + 15

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

        let dismissed = await waitUntilDismissed(isPresented, timeout: waitingTime)

        #expect(dismissed, "Snackbar should disappear after \(dissapearAfterTime) seconds")
    }
}
