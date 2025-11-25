import SwiftUI
import Warp

struct StateViewDemo: View {
    @State private var selectedVariant: StateViewVariant = .stateView
    @State private var showStateImage: Bool = false
    @State private var useIllustration: Bool = false
    @State private var selectedIcon: Warp.Icon = .activeAds
    @State private var title: String = "Default Title"
    @State private var description: String = "Default Description"
    @State private var showVendEndorsement: Bool = false
    @State private var primaryButtonTitle: String = "Primary Action"
    @State private var secondaryButtonTitle: String = "Secondary Action"
    @State private var showSecondaryButton: Bool = false
    @State private var isModalPresented: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                ScrollView(showsIndicators: false) {
                    Button("Show StateView Demo") {
                        isModalPresented = true
                    }
                    .buttonStyle(.borderedProminent)
                    .padding()
                    Divider()
                    GroupBox {
                        Picker("Select Variant", selection: $selectedVariant) {
                            ForEach(StateViewVariant.allCases, id: \.self) { variant in
                                Text(variant.rawValue.capitalized)
                            }
                        }
                        .pickerStyle(.wheel)
                        .padding(.vertical)
                        
                        Divider()
                        createToggle(binding: $showStateImage, text: "Show state image")
                        if showStateImage {
                            createToggle(binding: $useIllustration, text: "Use illustration")
                            if !useIllustration {
                                Picker("Select an icon", selection: $selectedIcon) {
                                    ForEach(Warp.Icon.allCases, id: \.self) { icon in
                                        Text(icon.rawValue) // Display icon names in picker
                                    }
                                }
                                  .pickerStyle(WheelPickerStyle()) // Wheel picker style for better UX
                            }
                        }
                        Divider()
                        VStack(alignment: .leading) {
                            Warp.Text("Title", style: .bodyStrong)
                            Warp.TextField(text: $title)
                        }
                        Divider()
                        VStack(alignment: .leading) {
                            Warp.Text("Description", style: .bodyStrong)
                            Warp.TextField(text: $description)
                        }

                        Divider()
                        VStack(alignment: .leading) {
                            Warp.Text("Primary Button Title", style: .bodyStrong)
                            Warp.TextField(text: $primaryButtonTitle)
                        }
                        Divider()
                        createToggle(binding: $showSecondaryButton, text: "Show Secondary Button")
                        if showSecondaryButton {
                            Divider()
                            VStack(alignment: .leading) {
                                Warp.Text("Secondary Button Title", style: .bodyStrong)
                                Warp.TextField(text: $secondaryButtonTitle)
                            }
                        }
                        Divider()
                        createToggle(binding: $showVendEndorsement, text: "Show Vend tagline")
                    } label: {
                        Text("Modify StateView")
                    }
                }
            }
              .navigationTitle("Demo Launcher")
              .sheet(isPresented: $isModalPresented) {
                      createStateView()
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationTitle("StateView Demo")
              }
        }
    }

    private func createToggle(binding: Binding<Bool>, text: String) -> some View {
        HStack {
            Warp.Text(text, style: .bodyStrong)
            Spacer()
            Warp.Switch(isOn: binding.animation(.smooth))
        }
    }

    @ViewBuilder
    private func createStateView() -> some View {
        switch selectedVariant {
        case .stateView:
            StateView(
                image: { () -> StateView.StateImage? in
                    guard showStateImage else { return nil }
                    if useIllustration {
                        return .illustration(Image("ExampleIllustration"))
                    } else  {
                        return .icon(selectedIcon)
                    }
                }(),
                title: title,
                description: description,
                actionButton: .init(title: primaryButtonTitle, action: {}),
                quietButton: showSecondaryButton ? .init(title: secondaryButtonTitle, action: {}) : nil,
                showLogo: showVendEndorsement
            )
        case .noNetwork:
            NoNetworkStateView(retryAction: {})
        case .failToLoad:
            FailToLoadStateView(retryAction: {})
        case .verifyIdentity:
            VerifyIdentityStateView(eidProvider: title, verifyAction: {})
        case .noSearchResults:
            NoSearchResultsStateView(saveSearchAction: {}, clearFiltersAction: {})
        case .login:
            LoginStateView(loginAction: {}, createAccountAction: {})
        case .loading:
            LoadingStateView()
        }
    }
}

enum StateViewVariant: String, CaseIterable {
    case stateView
    case noNetwork
    case failToLoad
    case verifyIdentity
    case noSearchResults
    case login
    case loading
}

#Preview {
    StateViewDemo()
}
