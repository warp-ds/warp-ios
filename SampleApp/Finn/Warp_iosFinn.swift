import SwiftUI
import Warp

@main
struct Wrap_iosFinn: App {
    
    init() {
        Warp.Theme = .finn
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
