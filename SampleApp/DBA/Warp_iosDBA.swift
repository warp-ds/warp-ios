import SwiftUI
import Warp

@main
struct Wrap_iosDBA: App {

    init() {
        Warp.Theme = .dba
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
