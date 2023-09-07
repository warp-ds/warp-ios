import SwiftUI
import Warp_ios

@main
struct WarpApp: App {
    init() {
        JBMono.registerFonts()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
