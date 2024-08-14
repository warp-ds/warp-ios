import SwiftUI
import Warp
import FirebaseCore

@main
struct Wrap_iosTori: App {
    
    init() {
        Warp.Theme = .tori
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
