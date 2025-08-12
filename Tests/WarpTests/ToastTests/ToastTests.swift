import Testing
import SwiftUI
import ViewInspector
@testable import Warp

@Suite
struct ToastTests {

    @available(iOS 16.0, *)
    @Test @MainActor
    func testToastShouldAutomaticallyDisappear() async throws {
        let dissapearAfterTime: TimeInterval = 0.3
        let waitingTime: TimeInterval = dissapearAfterTime + 0.1

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
        try await Task.sleep(timeInterval: waitingTime)
        #expect(isPresented.wrappedValue == false, "Toast should disappear after \(dissapearAfterTime) seconds")
    }
}

extension Task where Success == Never, Failure == Never {
    
    static func sleep(timeInterval: TimeInterval) async throws {
        let nanoseconds = UInt64(timeInterval * 1_000_000_000)
        try await Task.sleep(nanoseconds: nanoseconds)
    }
}
