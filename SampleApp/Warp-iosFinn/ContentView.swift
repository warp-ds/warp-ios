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
            .navigationTitle(Bundle.main.applicationName)
        }
    }
}

#Preview {
    ContentView()
}

extension Bundle {
    // Name of the app - title under the icon.
    fileprivate var applicationName: String {
        return object(forInfoDictionaryKey: "CFBundleDisplayName") as? String ??
        object(forInfoDictionaryKey: "CFBundleName") as? String ?? ""
    }
}
