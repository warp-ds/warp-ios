import SwiftUI
import Warp_ios

@main
struct Wrap_iosTori: App {
    
    init() {
        Warp_ios.Config.colorProvider = ToriColorProvider()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
