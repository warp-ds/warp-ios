import SwiftUI
import Warp

@main
struct Wrap_iosFinn: App {
    
    init() {
        Warp.Config.warpTheme = .finn
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
