import SwiftUI
import Warp_ios

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
            .navigationTitle("Warp Components")
        }
    }
}

#Preview {
    ContentView()
}
