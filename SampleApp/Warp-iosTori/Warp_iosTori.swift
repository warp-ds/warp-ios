import SwiftUI
import Warp
import FirebaseCore

@main
struct Wrap_iosTori: App {
    
    init() {
        Warp.Config.warpTheme = .tori
        try! Warp.Typography.registerFonts()
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
