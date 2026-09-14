import Testing
import SwiftUI
import ViewInspector
@testable import Warp

@Suite
struct SnackbarTests {

    @Test @MainActor
    func testSnackbarShouldAutomaticallyDisappear() async throws {
        let dissapearAfterTime: TimeInterval = 0.3
        // Generous, because it is an upper bound on a poll rather than a fixed wait: a healthy
        // snackbar returns in roughly `dissapearAfterTime` regardless.
        let waitingTime: TimeInterval = dissapearAfterTime + 5

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
