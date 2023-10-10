import SwiftUI
import warp_ios

@main
struct Wrap_iosTori: App {
    
    init() {
        warp_ios.Config.warpTheme = .tori
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
