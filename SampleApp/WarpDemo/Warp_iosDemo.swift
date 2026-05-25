import SwiftUI
import Warp
import FirebaseCore

@main
struct Wrap_iosDemo: App {

    init() {
        // Register all brand fonts for dynamic theme switching
        for theme in Warp.Brand.allCases {
            try! Warp.Typography.registerFonts(for: theme)
        }
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .warpTheme(.finn) // Set default theme to Finn, but can be switched dynamically in the app
        }
    }
}
