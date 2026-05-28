import SwiftUI
import Warp

struct NavigationDemoView: View {

    struct ButtonConfig: Identifiable {
        let id = UUID()
        var style: UIBarButtonItem.WarpBarButtonStyle = .default
        var display: ButtonDisplay = .icon
        var text: String = "Button"
        var icon: Warp.Icon = .shareIOS
    }

    enum ButtonDisplay: String, CaseIterable {
        case icon = "Icon"
        case text = "Text"
    }

    @State private var buttons: [ButtonConfig] = []

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

            Section {
                ForEach($buttons) { $button in
                    VStack(alignment: .leading, spacing: 8) {
                        Picker("Style", selection: $button.style) {
                            Text("Default").tag(UIBarButtonItem.WarpBarButtonStyle.default)
                            Text("Primary").tag(UIBarButtonItem.WarpBarButtonStyle.primary)
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
                                Text("Edit:")
                                    .foregroundColor(.secondary)
                                TextField("Button text", text: $button.text)
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
                    Text("Navigation bar buttons: (\(buttons.count))")
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

        let navigationController = UINavigationController(rootViewController: hostingController)
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
        for (index, config) in buttons.enumerated() {
            let item = createBarButtonItem(style: config.style, config: config)
            items.append(item)

            if #available(iOS 26.0, *) {
                if config.style != .primary {
                    let nextIndex = index + 1
                    if nextIndex < buttons.count && buttons[nextIndex].style != .primary {
                        items.append(UIBarButtonItem.fixedSpace())
                    }
                }
            }
        }
        return items
    }

    private func createBarButtonItem(style: UIBarButtonItem.WarpBarButtonStyle, config: ButtonConfig) -> UIBarButtonItem {
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
        .navigationTitle("Custom View")
        .navigationBarItems(leading: Button(action: {
            UIApplication.shared.windows.first?.rootViewController?.dismiss(animated: true)
        }) {
            Image(systemName: "xmark")
        }
        .warpNavigationBarButton())
    }
}
