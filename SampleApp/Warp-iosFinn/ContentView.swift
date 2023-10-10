import SwiftUI
import Warp

struct ContentView: View {
    @State private var isShowingButtonView = false

    var body: some View {
        NavigationView {
            ScrollView {
                VStack (alignment: .leading) {
                    Divider()
                    NavigationLink(destination: ButtonView()) {
                        Text("WarpButton")
                            .padding()
                    }
                    Divider()
                    NavigationLink(destination: InputView()) {
                        Text("WarpInput")
                            .padding()
                    }
                    Divider()
                }
                .padding()
            }
            .navigationTitle( Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as! String)
        }
    }
}

#Preview {
    ContentView()
}
