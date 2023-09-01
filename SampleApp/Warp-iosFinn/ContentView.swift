import SwiftUI
import Warp_ios

struct ContentView: View {
    @State private var isShowingButtonView = false
    @State private var selectedTheme = WarpTheme.finn

    var body: some View {
        NavigationView {
            ScrollView {
                #if WARP
                Picker("Select a Theme", selection: $selectedTheme) {
                    ForEach(WarpTheme.allCases, id: \.self) { theme in
                        Text(theme.rawValue)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                .onChange(of: selectedTheme) { newValue in
                    Warp_ios.Config.warpTheme = selectedTheme
                }
                #endif
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
                    NavigationLink(destination: TypographyView()) {
                        Text("WarpTypography")
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
