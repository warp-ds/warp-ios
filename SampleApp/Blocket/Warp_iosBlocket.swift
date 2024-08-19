import SwiftUI
import Warp
import FirebaseCore

@main
struct Wrap_iosBlocket: App {

    init() {
        Warp.Theme = .blocket
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
