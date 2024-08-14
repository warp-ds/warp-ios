import SwiftUI
import Warp
import FirebaseCore

@main
struct Wrap_iosFinn: App {
    
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
