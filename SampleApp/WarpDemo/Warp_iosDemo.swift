import SwiftUI
import Warp
import FirebaseCore

@main
struct Wrap_iosDemo: App {

    init() {
        // Register fonts for the demo theme (using Finn by default)
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
