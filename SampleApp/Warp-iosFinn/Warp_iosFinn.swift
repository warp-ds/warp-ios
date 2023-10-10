import SwiftUI
import warp_ios

@main
struct Wrap_iosFinn: App {
    
    init() {
        warp_ios.Config.warpTheme = .finn
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
