import SwiftUI
import Warp
import FirebaseCore

@main
struct Wrap_iosVend: App {

    init() {
        // Register fonts for the Vend theme
        try? Warp.Typography.registerFonts(for: .vend)
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .warpTheme(.vend)
        }
    }
}
