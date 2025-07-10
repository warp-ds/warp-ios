import SwiftUI
import Warp
import FirebaseCore

@main
struct Wrap_iosVend: App {

    init() {
        Warp.Theme = .vend
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
