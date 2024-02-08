import SwiftUI
import Warp

struct ContentView: View {
    @State private var isShowingButtonView = false
    @State private var selectedTheme = Warp.Theme.finn

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
                    Config.warpTheme = selectedTheme
                }
                #endif
                VStack (alignment: .leading) {
                    Divider()
                    switch Warp.Config.warpTheme {
                    case .finn:
                        NavigationLink(destination: FinnColorsView()) {
                            Text("BrandColors")
                                .padding()
                        }
                    case .tori:
                        NavigationLink(destination: ToriColorsView()) {
                            Text("BrandColors")
                                .padding()
                        }
                    }
                    Divider()
                    NavigationLink(destination: BrandTokensView()) {
                        Text("BrandTokens")
                            .padding()
                    }
                    Divider()
                    NavigationLink(destination: TypographyView()) {
                        Text("WarpTypography")
                            .padding()
                    }
                    Divider()
                    NavigationLink(destination: ButtonView()) {
                        Text("WarpButton")
                            .padding()
                    }
                    Divider()
                    NavigationLink(destination: TextFieldView()) {
                        Text("WarpTextField")
                            .padding()
                    }
                    Divider()
                    NavigationLink(destination: BadgeView()) {
                        Text("WarpBadge")
                            .padding()
                    }
                    Divider()
                    NavigationLink(destination: PillView()) {
                        Text("WarpPill")
                            .padding()
                    }
                    Divider()
                    NavigationLink(destination: AlertView()) {
                        Text("WarpAlert")
                            .padding()
                    }
                    Divider()
                    NavigationLink(destination: ToastView()) {
                        Text("WarpToast")
                            .padding()
                    }
                    Divider()
                    NavigationLink(destination: CalloutView()) {
                        Text("WarpCallout")
                            .padding()
                    }
                    Text("\(Bundle.main.releaseVersionNumber) (\(Bundle.main.buildVersionNumber))")
                        .font(.caption2)
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
    fileprivate var releaseVersionNumber: String {
        return infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
    }
    fileprivate var buildVersionNumber: String {
        return infoDictionary?["CFBundleVersion"] as? String ?? ""
    }
}
