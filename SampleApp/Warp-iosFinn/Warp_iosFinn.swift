import SwiftUI
import Warp

@main
struct Wrap_iosFinn: App {
    
    init() {
        Config.warpTheme = .finn
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
