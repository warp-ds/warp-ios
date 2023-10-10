import SwiftUI
import Warp

@main
struct Wrap_iosTori: App {
    
    init() {
        Config.warpTheme = .tori
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
