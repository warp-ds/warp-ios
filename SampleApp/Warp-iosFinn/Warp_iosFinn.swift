import SwiftUI
import Warp
import FirebaseCore

@main
struct Wrap_iosFinn: App {
    
    init() {
        Warp.Config.warpTheme = .finn
        try! Warp.Typography.registerFonts()
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
