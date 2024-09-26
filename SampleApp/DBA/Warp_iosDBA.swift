import SwiftUI
import Warp
import FirebaseCore

@main
struct Wrap_iosDBA: App {

    init() {
        Warp.Theme = .dba
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
