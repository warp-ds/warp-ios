import Testing
import SwiftUI
@testable import Warp

@Suite
struct ToastTests {

    @available(iOS 16.0, *)
    @Test @MainActor
    func testToastShouldAutomaticallyDisappear() async throws {
        let dissapearAfterTime: TimeInterval = 0.3
        let waitingTime: TimeInterval = dissapearAfterTime + 0.2

        var isPresented = true
        let toast = EmptyView()
            .warpToast(
                style: .success,
                title: "This is a toast message",
                edge: .top,
                duration: .custom(interval: dissapearAfterTime),
                isPresented: Binding<Bool>(
                    get: { isPresented },
                    set: { isPresented = $0 }
                )
            )
        let window = viewShouldAppearOnScreen(toast)
        defer {
            window.windowScene = nil // clean up the window
        }

        #expect(isPresented == true, "Toast should be presented initially")
        try await Task.sleep(timeInterval: waitingTime)
        #expect(isPresented == false, "Toast should disappear after \(dissapearAfterTime) seconds")
    }

    private func viewShouldAppearOnScreen(_ view: some View) -> UIWindow {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let hostingVC = UIHostingController(rootView: view)
        window.rootViewController = hostingVC
        window.makeKeyAndVisible()
        return window
    }
}

extension Task where Success == Never, Failure == Never {
    
    static func sleep(timeInterval: TimeInterval) async throws {
        let nanoseconds = UInt64(timeInterval * 1_000_000_000)
        try await Task.sleep(nanoseconds: nanoseconds)
    }
}
