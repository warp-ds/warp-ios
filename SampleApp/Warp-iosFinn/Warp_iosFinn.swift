import SwiftUI
import Warp_ios

@main
struct Wrap_iosFinn: App {
    
    init() {
        Warp_ios.Config.warpTheme = .finn
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
