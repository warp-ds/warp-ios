import SwiftUI
import Warp
import FirebaseCore

@main
struct Wrap_iosTori: App {

    init() {
        // Register fonts for the Tori theme
        try! Warp.Typography.registerFonts(for: .tori)
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .warpTheme(.tori)
        }
    }
}
