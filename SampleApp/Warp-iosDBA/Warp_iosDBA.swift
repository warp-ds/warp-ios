import SwiftUI
import Warp
import FirebaseCore

@main
struct Wrap_iosDBA: App {

    init() {
        Warp.Config.warpTheme = .dba
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
