import SwiftUI
import Warp

@main
struct Wrap_iosTori: App {
    
    init() {
        Warp.Config.warpTheme = .tori
        try! Warp.Typography.registerFonts()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
