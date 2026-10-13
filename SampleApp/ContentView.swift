import SwiftUI
import Warp

struct ContentView: View {
    @State private var isShowingButtonView = false
    @AppStorage(selectedBrandKey) private var selectedBrandName = Warp.Brand.finn.description
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

    private var nativeItems: [(String, any View)] {
        var items: [(String, any View)] = [
            ("Alert (Native)", AlertDialogView()),
            ("Bottom nav / Tab Bar", TabBarDemoView()),
            ("Confirmation Dialog", ConfirmationDialogView()),
            ("Menu / Context Menu", MenuDemoView()),
            ("Segmented Control", SegmentedControlDemoView())
        ]
        if #available(iOS 26.0, *) {
            items += [
                ("NavigationView (UIKit)", NavigationDemoView()),
                ("NavigationView (SwiftUI)", ToolbarDemoView())
            ]
        }
        return items.sorted { $0.0 < $1.0 }
    }

    private var patternItems: [(String, any View)] {
        [
            ("Colour variant scoping", ColorVariantDemo()),
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
            ("DatePicker", DatePickerView()),
            ("Divider", DividerView()),
            ("Expandable", ExpandableView()),
            ("Icon", IconView()),
            ("Logo", LogoView()),
            ("Modal", ModalView()),
            ("Notification badge", NotificationBadgeView()),
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

    private var selectedTheme: Warp.Brand {
        Warp.Brand(storedName: selectedBrandName)
    }

    private func matches(_ title: String) -> Bool {
        searchText.isEmpty || title.localizedCaseInsensitiveContains(searchText)
    }

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(alignment: .leading) {
                    let filteredBrandItems = brandItems.filter { matches($0.0) }
                    let filteredNativeItems = nativeItems.filter { matches($0.0) }
                    let filteredPatternItems = patternItems.filter { matches($0.0) }
                    let filteredComponentItems = componentItems.filter { matches($0.0) }

                    if !filteredBrandItems.isEmpty {
                        Warp.Text("Brand Specific Items", style: .title3)
                        Divider()

                        ForEach(filteredBrandItems, id: \.0) { title, destination in
                            row(title, destination: destination)
                        }
                    }

                    if !filteredNativeItems.isEmpty {
                        Warp.Text("Native Components", style: .title3)
                        Divider()

                        ForEach(filteredNativeItems, id: \.0) { title, destination in
                            row(title, destination: destination)
                        }
                    }
                    row("Sheet", destination: SheetDemoView())

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
            #if WARP
            .safeAreaInset(edge: .top) {
                BrandPicker(selection: $selectedBrandName)
                    .pickerStyle(.segmented)
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    .background(.bar, ignoresSafeAreaEdges: [])
            }
            #endif
            .navigationTitle(Bundle.main.applicationName)
            .searchable(text: $searchText, prompt: "Search components")
            .onAppear {
                #if WARP
                Warp.Theme = selectedTheme
                #endif
                UINavigationBar.warpStyle()
            }
        }
        #if WARP
        .onChange(of: selectedBrandName) {
            Warp.Theme = selectedTheme
            UINavigationBar.warpStyle()
        }
        #endif
        .warpTheme(selectedTheme)
    }

    private func row(_ title: String, destination: any View) -> some View {
        RowView(title: title, destination: AnyView(destination), updatesLive: !Self.nonLiveDemos.contains(title))
    }

    /// Demos that don't fully re-theme while open (UIKit-hosted, or built from the global
    /// `Warp.Theme` / `Warp.Token`). Found by switching brand on each screen and comparing
    /// with the same screen opened fresh in that brand.
    private static let nonLiveDemos: Set<String> = [
        "PrimitiveColors", "SemanticTokens", "ComponentColors", "Typography", "TypographyUI",
        "Bottom nav / Tab Bar", "Segmented Control", "Checkbox", "Radio"
    ]
}

/// Individual row view for navigation links with theme-aware styling
private struct RowView: View {
    let title: String
    let destination: AnyView
    let updatesLive: Bool
    @Environment(\.warpTheme) private var theme

    var body: some View {
        NavigationLink(destination: destination.modifier(ThemeMenuModifier(updatesLive: updatesLive))) {
            VStack(alignment: .leading) {
                Warp.Text(title, style: .title4)
                    .foregroundColor(Warp.Token.textLink)
                    .padding()
                Divider()
            }
        }
    }
}

private let selectedBrandKey = "sampleApp.selectedBrand"

private extension Warp.Brand {
    /// `Warp.Brand` isn't `RawRepresentable`, so the brand is stored by its description.
    init(storedName: String) {
        self = Warp.Brand.allCases.first { $0.description == storedName } ?? .finn
    }
}

/// Picker over all brands, bound to the stored brand name.
private struct BrandPicker: View {
    @Binding var selection: String

    var body: some View {
        Picker("Brand", selection: $selection) {
            ForEach(Warp.Brand.allCases, id: \.self) { brand in
                Text(brand.description).tag(brand.description)
            }
        }
    }
}

/// Adds the brand menu to a demo's toolbar, plus a note on demos that don't re-theme live.
private struct ThemeMenuModifier: ViewModifier {
    let updatesLive: Bool
    @AppStorage(selectedBrandKey) private var selectedBrandName = Warp.Brand.finn.description

    func body(content: Content) -> some View {
        #if WARP
        content
            .safeAreaInset(edge: .top) {
                if !updatesLive {
                    Warp.Text(
                        "This demo doesn't update live when you change the brand. Go back and reopen it to see the new brand.",
                        style: .caption
                    )
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    .background(.bar, ignoresSafeAreaEdges: [])
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        BrandPicker(selection: $selectedBrandName)
                    } label: {
                        HStack(spacing: 4) {
                            Image(systemName: "paintbrush")
                            Text(selectedBrandName)
                        }
                    }
                    .accessibilityLabel("Brand: \(selectedBrandName)")
                }
            }
        #else
        content
        #endif
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
