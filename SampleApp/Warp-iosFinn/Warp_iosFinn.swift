import SwiftUI
import Warp
import FirebaseCore

@main
struct Wrap_iosFinn: App {
    
    init() {
        Warp.Config.warpTheme = .finn
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
