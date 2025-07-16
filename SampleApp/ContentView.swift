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
                    Warp.Text("Brand Specific Items", style: .title3)
                    Divider()

                    row("PrimitiveColors", destination: PrimitiveColorsView())
                    row("SemanticTokens", destination: SemanticTokensView())
                    row("ComponentColors", destination: ComponentColorsView())
                    row("DatavizColors", destination: DatavizSampleColorsView())
                    row("DatavizTokens", destination: DatavizTokensView())
                    row("Typography", destination: TypographyView())
                    row("TypographyUI", destination: TypographyUIView())
                    row("Icons", destination: IconsView())
                    row("Taxonomy Icons", destination: TaxonomyIconsView())
                    row("Brand Icons", destination: BrandIconsView())
                    row("Brand Logos", destination: BrandLogosView())

                    Warp.Text("Warp Components", style: .title3)
                    Divider()

                    row("Alert", destination: AlertView())
                    row("Badge", destination: BadgeView())
                    row("Box", destination: BoxView())
                    row("Broadcast", destination: BroadcastView())
                    row("Button", destination: ButtonView())
                    row("ButtonGroup", destination: ButtonGroupView())
                    row("ButtonPill", destination: ButtonPillView())
                    row("Callout", destination: CalloutView())
                    row("Checkbox", destination: CheckboxView())
                    row("Expandable", destination: ExpandableView())
                    row("Icon", destination: IconView())
                    row("Logo", destination: LogoView())
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
                    row("Tabs", destination: TabsView())
                    row("Text", destination: TextView())
                    row("TextArea", destination: TextAreaView())
                    row("TextField", destination: TextFieldView())
                    row("Toast", destination: ToastView())
                    row("Tooltip", destination: TooltipView())

                    Warp.Text("\(Bundle.main.releaseVersionNumber) (\(Bundle.main.buildVersionNumber))", style: .caption)
                }
                .padding()
            }
            .navigationTitle(Bundle.main.applicationName)
        }
    }
    
    private func row(_ title: String, destination: some View) -> some View {
        NavigationLink(destination: destination) {
            VStack(alignment: .leading) {
                Warp.Text(title, style: .title4)
                    .foregroundColor(Warp.Token.textLink)
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
