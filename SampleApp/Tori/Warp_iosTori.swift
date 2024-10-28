import SwiftUI
import Warp

@main
struct Wrap_iosTori: App {
    
    init() {
        Warp.Theme = .tori
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
