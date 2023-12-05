import SwiftUI
import Warp

@main
struct Wrap_iosFinn: App {
    
    init() {
        Warp.Config.warpTheme = .finn
        try! Warp.Typography.registerFonts()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
