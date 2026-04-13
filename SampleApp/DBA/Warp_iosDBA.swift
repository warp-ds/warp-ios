import SwiftUI
import Warp
import FirebaseCore

@main
struct Wrap_iosDBA: App {

    init() {
        // Register fonts for the DBA theme
        try? Warp.Typography.registerFonts(for: .dba)
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .warpTheme(.dba)
        }
    }
}
