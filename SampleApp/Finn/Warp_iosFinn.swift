import SwiftUI
import Warp
import FirebaseCore

@main
struct Wrap_iosFinn: App {

    init() {
        // Register fonts for the Finn theme
        try? Warp.Typography.registerFonts(for: .finn)
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .warpTheme(.finn)
        }
    }
}
