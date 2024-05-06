import SwiftUI
import Warp
import FirebaseCore

@main
struct Wrap_iosTori: App {
    
    init() {
        Warp.Config.warpTheme = .tori
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
