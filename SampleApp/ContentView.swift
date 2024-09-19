import SwiftUI
import Warp

struct ContentView: View {
    @State private var isShowingButtonView = false
    @State private var selectedTheme = Warp.Brand.finn

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
                LazyVStack (alignment: .leading) {
                    Text("Brand Specific Items")
                        .font(.title2)
                    Divider()
                    switch Warp.Theme {
                    case .finn:
                        NavigationLink(destination: FinnColorsView()) {
                            Text("Colors")
                                .padding()
                        }
                    case .tori:
                        NavigationLink(destination: ToriColorsView()) {
                            Text("Colors")
                                .padding()
                        }
                    case .dba:
                        NavigationLink(destination: DBAColorsView()) {
                            Text("BrandColors")
                                .padding()
                        }
                    case .blocket:
                        NavigationLink(destination: BlocketColorsView()) {
                            Text("BrandColors")
                                .padding()
                        }
                    }
                    Divider()

                    NavigationLink(destination: IconsView()) {
                        Text("Icons")
                            .padding()
                    }
                    Divider()
                    
                    NavigationLink(destination: BrandTokensView()) {
                        Text("Tokens")
                            .padding()
                    }
                    Divider()

                    NavigationLink(destination: TypographyView()) {
                        Text("Typography")
                            .padding()
                    }

                    Divider()

                    Text("Warp Components")
                        .font(.title2)

                    Divider()

                    NavigationLink(destination: AlertView()) {
                        Text("Alert")
                            .padding()
                    }
                    Divider()

                    NavigationLink(destination: BadgeView()) {
                        Text("Badge")
                            .padding()
                    }
                    Divider()

                    NavigationLink(destination: BoxView()) {
                        Text("Box")
                            .padding()
                    }
                    
                    Divider()

                    NavigationLink(destination: BroadcastView()) {
                        Text("Broadcast")
                            .padding()
                    }

                    Divider()

                    NavigationLink(destination: ButtonView()) {
                        Text("Button")
                            .padding()
                    }

                    Divider()

                    NavigationLink(destination: CalloutView()) {
                        Text("Callout")
                            .padding()
                    }

                    Divider()

                    NavigationLink(destination: ExpandableView()) {
                        Text("Expandable")
                            .padding()
                    }

                    Divider()
                    
                    NavigationLink(destination: ModalView()) {
                        Text("Modal")
                            .padding()
                    }
                    Divider()

                    NavigationLink(destination: ModalView()) {
                        Text("Modal")
                            .padding()
                    }

                    Divider()

                    NavigationLink(destination: PillView()) {
                        Text("Pill")
                            .padding()
                    }
                    
                    Divider()

                    NavigationLink(destination: RadioView()) {
                        Text("Radio")
                            .padding()
                    }

                    Divider()

                    NavigationLink(destination: ShadowView()) {
                        Text("Shadow")
                            .padding()
                    }
                    
                    Divider()
                    
                    NavigationLink(destination: ShadowUIView()) {
                        Text("ShadowUI")
                            .padding()
                    }

                    Divider()

                    NavigationLink(destination: SpinnerView()) {
                        Text("Spinner")
                            .padding()
                    }

                    Divider()

                    NavigationLink(destination: StepIndicatorView()) {
                        Text("StepIndicator")
                            .padding()
                    }

                    Divider()

                    NavigationLink(destination: TextView()) {
                        Text("Text")
                            .padding()
                    }

                    Divider()

                    NavigationLink(destination: TextFieldView()) {
                        Text("TextField")
                            .padding()
                    }

                    Divider()

                    NavigationLink(destination: ToastView()) {
                        Text("Toast")
                            .padding()
                    }

                    Divider()

                    NavigationLink(destination: TooltipView()) {
                        Text("Tooltip")
                            .padding()
                    }

                    Divider()

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
