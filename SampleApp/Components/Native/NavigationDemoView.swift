import SwiftUI
import Warp

@available(iOS 26.0, *)
struct NavigationDemoView: View {

    struct ButtonConfig: Identifiable {
        let id = UUID()
        var style: Warp.NavigationBarButtonStyle = .default
        var display: ButtonDisplay = .icon
        var text: String = "Button"
        var icon: Warp.Icon = .shareIOS
        var group: Int = 0
    }

    enum ButtonDisplay: String, CaseIterable {
        case icon = "Icon"
        case text = "Text"
    }

    @State private var buttons: [ButtonConfig] = []
    @State private var navigationTitle: String = "Custom View"
    @State private var navigationSubtitle: String = ""
    @State private var showLargeTitle: Bool = true

    private var uniqueGroups: Int {
        Set(buttons.map { $0.group }).count
    }

    private func iconMenuButton(icon: Binding<Warp.Icon>) -> some View {
        Menu {
            ForEach(Warp.Icon.allCases, id: \.self) { iconOption in
                Button(action: {
                    icon.wrappedValue = iconOption
                }) {
                    HStack {
                        Image(uiImage: iconOption.uiImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                        Text(String(describing: iconOption))
                            .lineLimit(1)
                    }
                }
            }
        } label: {
            HStack {
                Image(uiImage: icon.wrappedValue.uiImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                Text(String(describing: icon.wrappedValue))
                    .lineLimit(1)
                    .truncationMode(.middle)
            }
        }
    }

    var body: some View {
        Form {
            Section("Demo") {
                Button("Go to Custom Navigation View") {
                    navigateToCustomView()
                }
            }

            Section("Navigation Title & Subtitle") {
                TextFieldWithClear(label: "Title:", text: $navigationTitle)
                TextFieldWithClear(label: "Subtitle:", text: $navigationSubtitle)
                Toggle("Show Large Title", isOn: $showLargeTitle)
            }

            Section {
                ForEach($buttons) { $button in
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text("Group:")
                                .foregroundColor(.secondary)
                            Picker("Group", selection: $button.group) {
                                ForEach(0..<5) { groupNumber in
                                    Text("\(groupNumber)").tag(groupNumber)
                                }
                            }
                            .pickerStyle(.segmented)
                            .labelsHidden()
                        }

                        Picker("Style", selection: $button.style) {
                            Text("Default").tag(Warp.NavigationBarButtonStyle.default)
                            Text("Primary").tag(Warp.NavigationBarButtonStyle.primary)
                        }
                        .pickerStyle(.segmented)

                        Picker("Display", selection: $button.display) {
                            ForEach(ButtonDisplay.allCases, id: \.self) { option in
                                Text(option.rawValue).tag(option)
                            }
                        }
                        .pickerStyle(.segmented)

                        if button.display == .text {
                            HStack {
                                TextFieldWithClear(label: "Edit:", text: $button.text)
                            }
                            .transition(.opacity.combined(with: .move(edge: .top)))
                        } else {
                            HStack {
                                Text("Icon")
                                Spacer()
                                iconMenuButton(icon: $button.icon)
                            }
                            .transition(.opacity.combined(with: .move(edge: .top)))
                        }
                    }
                    .animation(.easeInOut(duration: 0.2), value: button.display)
                    .padding(.vertical, 4)
                }
                .onMove { buttons.move(fromOffsets: $0, toOffset: $1) }
                .onDelete { buttons.remove(atOffsets: $0) }
            } header: {
                HStack {
                    Text("Buttons: \(buttons.count) | Groups: \(uniqueGroups)")
                    Spacer()
                    EditButton()
                }
            }

            Section {
                Button("Add navbar button") {
                    withAnimation {
                        buttons.append(ButtonConfig())
                    }
                }
            }
        }
        .navigationTitle("Navigation setup")
    }

    private func navigateToCustomView() {
        let customView = CustomNavigationView()
        let hostingController = UIHostingController(rootView: customView)
        hostingController.navigationItem.title = navigationTitle
        hostingController.navigationItem.largeTitleDisplayMode = showLargeTitle ? .always : .never
        if !navigationSubtitle.isEmpty {
            hostingController.navigationItem.subtitle = navigationSubtitle
        }

        let navigationController = UINavigationController(rootViewController: hostingController)
        navigationController.navigationBar.prefersLargeTitles = showLargeTitle
        navigationController.warpLiquidGlassStyle()
        navigationController.modalPresentationStyle = .fullScreen

        let items = createBarButtonItems()
        if !items.isEmpty {
            hostingController.navigationItem.rightBarButtonItems = items
        }

        if let window = UIApplication.shared.windows.first,
           let rootViewController = window.rootViewController {
            rootViewController.present(navigationController, animated: true)
        }
    }

    private func createBarButtonItems() -> [UIBarButtonItem] {
        var items: [UIBarButtonItem] = []
        var lastGroup: Int? = nil

        for config in buttons {
            // Add group spacing when group changes
            if let previousGroup = lastGroup, previousGroup != config.group {
                // Add fixed spaces for visual group separation
                items.append(UIBarButtonItem.fixedSpace())
            }

            let item = createBarButtonItem(style: config.style, config: config)
            items.append(item)
            lastGroup = config.group
        }
        return items
    }

    private func createBarButtonItem(style: Warp.NavigationBarButtonStyle, config: ButtonConfig) -> UIBarButtonItem {
        switch config.display {
        case .icon:
            return UIBarButtonItem(
                image: config.icon.uiImage,
                style: .plain,
                target: self,
                action: nil
            )
            .warpNavigationBarButton(style: style)

        case .text:
            return UIBarButtonItem(
                title: config.text,
                style: .plain,
                target: self,
                action: nil
            )
            .warpNavigationBarButton(style: style)
        }
    }
}

@available(iOS 26.0, *)
struct CustomNavigationView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(1...25, id: \.self) { index in
                    Text("Lorem ipsum row \(index)")
                      .font(.body)
                      .padding()
                      .frame(maxWidth: .infinity, alignment: .leading)
                      .background(Color(UIColor.black))
                      .cornerRadius(8)
                }
            }
            .padding()
        }
        .navigationBarItems(leading: Button(action: {
            UIApplication.shared.windows.first?.rootViewController?.dismiss(animated: true)
        }) {
            Image(systemName: "xmark")
        }
        .warpNavigationBarButton())
    }
}

private struct TextFieldWithClear: View {
    let label: String
    @Binding var text: String

    var body: some View {
        HStack {
            Text(label)
              .foregroundColor(.secondary)
            TextField("", text: $text)
            if !text.isEmpty {
                Button(action: { text = "" }) {
                    Image(systemName: "xmark.circle.fill")
                      .foregroundColor(.secondary)
                }
            }
        }
    }
}
