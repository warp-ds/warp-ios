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
                        row("Colors", destination: FinnColorsView())
                    case .tori:
                        row("Colors", destination: ToriColorsView())
                    case .dba:
                        row("Colors", destination: DbaColorsView())
                    case .blocket:
                        row("Colors", destination: BlocketColorsView())
                    case .oikotie:
                        row("Colors", destination: OikotieColorsView())
                    }
                    row("Icons", destination: IconsView())
                    row("Taxonomy Icons", destination: TaxonomyIconsView())
                    row("Brand Icons", destination: BrandIconsView())
                    row("Tokens", destination: TokensView())
                    row("Typography", destination: TypographyView())
                    
                    Text("Warp Components")
                        .font(.title2)
                    Divider()
                    
                    row("Alert", destination: AlertView())
                    row("Badge", destination: BadgeView())
                    row("Box", destination: BoxView())
                    row("Broadcast", destination: BroadcastView())
                    row("Button", destination: ButtonView())
                    row("Callout", destination: CalloutView())
                    row("Checkbox", destination: CheckboxView())
                    row("Expandable", destination: ExpandableView())
                    row("HelpText", destination: HelpTextView())
                    row("Icon", destination: IconView())
                    row("Label", destination: LabelView())
                    row("Modal", destination: ModalView())
                    row("PageIndicator", destination: PageIndicatorView())
                    row("Pill", destination: PillView())
                    row("Radio", destination: RadioView())
                    row("Shadow", destination: ShadowView())
                    row("ShadowUI", destination: ShadowUIView())
                    row("Slider", destination: SliderView())
                    row("Spinner", destination: SpinnerView())
                    row("StepIndicator", destination: StepIndicatorView())
                    row("Switch", destination: SwitchView())
                    row("Text", destination: TextView())
                    row("TextArea", destination: TextAreaView())
                    row("TextField", destination: TextFieldView())
                    row("Toast", destination: ToastView())
                    row("Tooltip", destination: TooltipView())

                    Text("\(Bundle.main.releaseVersionNumber) (\(Bundle.main.buildVersionNumber))")
                        .font(.caption2)
                }
                .padding()
            }
            .navigationTitle(Bundle.main.applicationName)
        }
    }
    
    private func row(_ title: String, destination: some View) -> some View {
        NavigationLink(destination: destination) {
            VStack(alignment: .leading) {
                Text(title)
                    .padding()
                Divider()
            }
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
