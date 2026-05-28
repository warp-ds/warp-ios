import SwiftUI
import Warp

struct NavigationDemoView: View {

    struct ButtonStyleState {
        var counter: UInt = 0
        var display: ButtonDisplay = .icon
        var text: String = ""
        var icon: Warp.Icon = .shareIOS
    }

    enum ButtonDisplay: String, CaseIterable {
        case icon = "Icon"
        case text = "Text"
    }

    @State var primary = ButtonStyleState(counter: 0, display: .icon, text: "Primary", icon: .shareIOS)
    @State var `default` = ButtonStyleState(counter: 0, display: .icon, text: "Default", icon: .arrowRight)
    @State var defaultTitle = ButtonStyleState(counter: 0, display: .text, text: "Save", icon: .shareIOS)

    private func counterControl(counter: Binding<UInt>) -> some View {
        HStack {
            Button(action: {
                guard counter.wrappedValue > 0 else { return }
                counter.wrappedValue -= 1
            }) {
                Image(systemName: "minus.circle")
            }
            .disabled(counter.wrappedValue == 0)

            Stepper("", value: counter)
                .labelsHidden()

            Button(action: {
                counter.wrappedValue += 1
            }) {
                Image(systemName: "plus.circle")
            }

            Spacer()

            Text("\(counter.wrappedValue)")
                .font(.body)
                .fontWeight(.semibold)
                .frame(width: 30, alignment: .center)
        }
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

            Section("Primary Style Button") {
                counterControl(counter: $primary.counter)

                Picker("Display", selection: $primary.display) {
                    ForEach(ButtonDisplay.allCases, id: \.self) { displayOption in
                        Text(displayOption.rawValue).tag(displayOption)
                    }
                }
                .pickerStyle(.segmented)

                if primary.display == .text {
                    HStack {
                        Text("Edit:")
                            .foregroundColor(.secondary)
                        TextField("Button text", text: $primary.text)
                    }
                    .transition(.opacity.combined(with: .move(edge: .top)))
                } else {
                    HStack {
                        Text("Icon")
                        Spacer()
                        iconMenuButton(icon: $primary.icon)
                    }
                    .transition(.opacity.combined(with: .move(edge: .top)))
                }
            }
            .animation(.easeInOut(duration: 0.2), value: primary.display)

            Section("Default Style Button") {
                counterControl(counter: $default.counter)

                Picker("Display", selection: $default.display) {
                    ForEach(ButtonDisplay.allCases, id: \.self) { displayOption in
                        Text(displayOption.rawValue).tag(displayOption)
                    }
                }
                .pickerStyle(.segmented)

                if `default`.display == .text {
                    HStack {
                        Text("Edit:")
                            .foregroundColor(.secondary)
                        TextField("Button text", text: $default.text)
                    }
                    .transition(.opacity.combined(with: .move(edge: .top)))
                } else {
                    HStack {
                        Text("Icon")
                        Spacer()
                        iconMenuButton(icon: $default.icon)
                    }
                    .transition(.opacity.combined(with: .move(edge: .top)))
                }
            }
            .animation(.easeInOut(duration: 0.2), value: `default`.display)

            Section("Default with Title Style") {
                counterControl(counter: $defaultTitle.counter)

                Picker("Display", selection: $defaultTitle.display) {
                    ForEach(ButtonDisplay.allCases, id: \.self) { displayOption in
                        Text(displayOption.rawValue).tag(displayOption)
                    }
                }
                .pickerStyle(.segmented)

                if defaultTitle.display == .text {
                    HStack {
                        Text("Edit:")
                            .foregroundColor(.secondary)
                        TextField("Button text", text: $defaultTitle.text)
                    }
                    .transition(.opacity.combined(with: .move(edge: .top)))
                } else {
                    HStack {
                        Text("Icon")
                        Spacer()
                        iconMenuButton(icon: $defaultTitle.icon)
                    }
                    .transition(.opacity.combined(with: .move(edge: .top)))
                }
            }
            .animation(.easeInOut(duration: 0.2), value: defaultTitle.display)
        }
        .navigationTitle("Navigation setup")
    }

    private func navigateToCustomView() {
        let customView = CustomNavigationView()
        let hostingController = UIHostingController(rootView: customView)

        let navigationController = UINavigationController(rootViewController: hostingController)
        navigationController.warpLiquidGlassStyle()
        navigationController.modalPresentationStyle = .fullScreen

        let items = createPrimaryBarButtonItems()
        if !items.isEmpty {
            hostingController.navigationItem.rightBarButtonItems = items
        }

        if let window = UIApplication.shared.windows.first,
           let rootViewController = window.rootViewController {
            rootViewController.present(navigationController, animated: true)
        }
    }

    private func createPrimaryBarButtonItems() -> [UIBarButtonItem] {
        let primaryButtons = (0..<primary.counter).map { _ in
            createBarButtonItem(style: .primary, state: primary)
        }
        let defaultCounter = `default`.counter
        let defaultButtons = (0..<defaultCounter).flatMap { _ -> [UIBarButtonItem] in
            if #available(iOS 26.0, *) {
                [createBarButtonItem(style: .default, state: `default`),
                 UIBarButtonItem.fixedSpace()
                ]
            } else {
                []
            }
        }
        let defaultTitleButtons = (0..<defaultTitle.counter).flatMap { _ -> [UIBarButtonItem] in
            if #available(iOS 26.0, *) {
                [createBarButtonItem(style: .default, state: defaultTitle),
                 UIBarButtonItem.fixedSpace()
                ]
            } else {
                []
            }
        }

        return primaryButtons + defaultButtons + defaultTitleButtons
    }

    private func createBarButtonItem(style: UIBarButtonItem.WarpBarButtonStyle, state: ButtonStyleState) -> UIBarButtonItem {
        switch state.display {
        case .icon:
            return UIBarButtonItem(
                image: state.icon.uiImage,
                style: .plain,
                target: self,
                action: nil
            )
            .warpNavigationBarButton(style: style)

        case .text:
            return UIBarButtonItem(
                title: state.text,
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
