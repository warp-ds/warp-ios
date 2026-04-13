import SwiftUI
import Warp
import FirebaseCore

@main
struct Wrap_iosBlocket: App {

    init() {
        // Register fonts for the Blocket theme
        try? Warp.Typography.registerFonts(for: .blocket)
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .warpTheme(.blocket)
        }
    }
}
