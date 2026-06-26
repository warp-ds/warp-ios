import SwiftUI
import Warp

struct ContentView: View {
    @State private var isShowingButtonView = false
    @State private var selectedTheme = Warp.Brand.finn
    @State private var searchText = ""

    private var brandItems: [(String, any View)] {
        [
            ("PrimitiveColors", PrimitiveColorsView()),
            ("SemanticTokens", SemanticTokensView()),
            ("ComponentColors", ComponentColorsView()),
            ("DatavizColors", DatavizSampleColorsView()),
            ("DatavizTokens", DatavizTokensView()),
            ("Typography", TypographyView()),
            ("TypographyUI", TypographyUIView()),
            ("Icons", IconsView()),
            ("Taxonomy Icons", TaxonomyIconsView()),
            ("Brand Icons", BrandIconsView()),
            ("Brand Logos", BrandLogosView())
        ]
    }

    private var patternItems: [(String, any View)] {
        [
            ("State views", StateViewDemo())
        ]
    }

    private var componentItems: [(String, any View)] {
        [
            ("Alert", AlertView()),
            ("Badge", BadgeView()),
            ("Box", BoxView()),
            ("Broadcast", BroadcastView()),
            ("Button", ButtonView()),
            ("ButtonGroup", ButtonGroupView()),
            ("ButtonPill", ButtonPillView()),
            ("Callout", CalloutView()),
            ("Checkbox", CheckboxView()),
            ("Confirmation Dialog", ConfirmationDialogView()),
            ("DatePicker", DatePickerView()),
            ("Divider", DividerView()),
            ("Expandable", ExpandableView()),
            ("Icon", IconView()),
            ("Logo", LogoView()),
            ("Modal", ModalView()),
            ("PageIndicator", PageIndicatorView()),
            ("Pill", PillView()),
            ("Radio", RadioView()),
            ("Shadow", ShadowView()),
            ("ShadowUI", ShadowUIView()),
            ("Slider", SliderView()),
            ("RangeSlider", RangeSliderView()),
            ("Select", SelectView()),
            ("Spinner", SpinnerView()),
            ("StepIndicator", StepIndicatorView()),
            ("Snackbar", SnackbarView()),
            ("Switch", SwitchView()),
            ("Tabs", TabsView()),
            ("Text", TextView()),
            ("TextArea", TextAreaView()),
            ("TextField", TextFieldView()),
            ("Toast", ToastView()),
            ("Tooltip", TooltipView())
        ]
    }

    private func matches(_ title: String) -> Bool {
        searchText.isEmpty || title.localizedCaseInsensitiveContains(searchText)
    }

    var body: some View {
        NavigationView {
            ScrollView {
                #if WARP
                Picker("Select a Theme", selection: $selectedTheme) {
                    ForEach(Warp.Brand.allCases, id: \.self) { theme in
                        Text(theme.description)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                .onChange(of: selectedTheme) { oldTheme, newTheme in
                    Warp.Theme = newTheme
                    UINavigationBar.warpLiquidGlassStyle()
                }
                #endif
                LazyVStack (alignment: .leading) {
                    let filteredBrandItems = brandItems.filter { matches($0.0) }
                    let filteredPatternItems = patternItems.filter { matches($0.0) }
                    let filteredComponentItems = componentItems.filter { matches($0.0) }

                    if !filteredBrandItems.isEmpty {
                        Warp.Text("Brand Specific Items", style: .title3)
                        Divider()

                        ForEach(filteredBrandItems, id: \.0) { title, destination in
                            row(title, destination: destination)
                        }
                    }

                    Warp.Text("Native Components", style: .title3)
                    Divider()

                    row("NavigationView (UIKit)", destination: NavigationDemoView())
                    row("NavigationView (SwiftUI)", destination: ToolbarDemoView())

                    if !filteredPatternItems.isEmpty {
                        Warp.Text("Warp Patterns", style: .title3)
                        Divider()

                        ForEach(filteredPatternItems, id: \.0) { title, destination in
                            row(title, destination: destination)
                        }
                    }

                    if !filteredComponentItems.isEmpty {
                        Warp.Text("Warp Components", style: .title3)
                        Divider()

                        ForEach(filteredComponentItems, id: \.0) { title, destination in
                            row(title, destination: destination)
                        }
                    }

                    Warp.Text("\(Bundle.main.releaseVersionNumber) (\(Bundle.main.buildVersionNumber))", style: .caption)
                }
                .padding()
            }
            .navigationTitle(Bundle.main.applicationName)
            .searchable(text: $searchText, prompt: "Search components")
            .onAppear {
                UINavigationBar.warpLiquidGlassStyle()
            }
        }
        .warpTheme(selectedTheme)
    }
    
    private func row(_ title: String, destination: any View) -> some View {
        RowView(title: title, destination: AnyView(destination))
    }
}

/// Individual row view for navigation links with theme-aware styling
private struct RowView: View {
    let title: String
    let destination: AnyView
    @Environment(\.warpTheme) private var theme

    var body: some View {
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
