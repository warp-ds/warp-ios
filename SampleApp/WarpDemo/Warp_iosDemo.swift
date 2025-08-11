import SwiftUI
import Warp
import FirebaseCore

@main
struct Wrap_iosDemo: App {
    
    init() {
        Warp.Theme = .finn
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
