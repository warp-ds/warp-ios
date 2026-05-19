import Testing
import SwiftUI
import ViewInspector
@testable import Warp

@Suite
struct SnackbarTests {

    @available(iOS 16.0, *)
    @Test @MainActor
    func testSnackbarShouldAutomaticallyDisappear() async throws {
        let dissapearAfterTime: TimeInterval = 0.3
        let waitingTime: TimeInterval = dissapearAfterTime + 0.1

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
        try await Task.sleep(timeInterval: waitingTime)
        #expect(isPresented.wrappedValue == false, "Snackbar should disappear after \(dissapearAfterTime) seconds")
    }
}
