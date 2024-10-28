import SwiftUI
import Warp

@main
struct Wrap_iosBlocket: App {

    init() {
        Warp.Theme = .blocket
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
