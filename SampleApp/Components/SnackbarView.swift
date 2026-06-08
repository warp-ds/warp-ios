import SwiftUI
import Warp

struct SnackbarView: View {
    @State var snackbarIsPresented: Bool = false
    @State var snackbarType: Warp.SnackbarType = .positive
    @State var neutralIconCustom: Warp.Icon = .info
    @State var snackbarDuration: Warp.Snackbar.Duration = .short
    @State var showCloseButton: Bool = true
    @State var actionMode: ActionMode = .none
    @State var actionMessage: String = ""
    @State var customText: String = ""

    enum ActionMode: String, CaseIterable {
        case none = "None"
        case inline = "Inline Action"
        case long = "Long Action"
    }

    var body: some View {
        ScrollView(showsIndicators: false) {

            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Text("Snackbar View Demo")
                        .font(.title)

                    Spacer()
                }

                Text("Playground")
                    .font(.title2)
                Text("Experiment with Snackbar Style and Snackbar Edge to see the variants")

                VStack(alignment: .leading) {
                    HStack {
                        Text("Right now the snackbar is ") +
                        Text(snackbarStatus)
                            .bold()

                        Spacer()
                    }

                    if(snackbarIsPresented) {
                        Text("You can tap the snackbar to dismiss it")
                    } else {
                        Button(action: {
                            snackbarIsPresented = true
                        }, label: {
                            Text("Tap me to show the snackbar again")
                                .frame(maxWidth: .infinity)
                        })
                        .buttonStyle(.borderedProminent)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.secondary)
                .cornerRadius(8)

                Text("Snackbar Type")
                    .font(.headline)
                Picker("Snackbar Type:", selection: $snackbarType) {
                    ForEach(Warp.SnackbarType.allCases, id: \.self) { currentType in
                        Text(currentType.description)
                    }
                }
                .pickerStyle(.segmented)
                .onChange(of: snackbarType) { oldValue, newValue in
                    if case .neutralIcon = newValue {
                        snackbarType = .neutralIcon(neutralIconCustom)
                    }
                }

                if case .neutralIcon = snackbarType {
                    HStack {
                        Text("Icon")
                        Spacer()
                        iconMenuButton(icon: $neutralIconCustom)
                    }
                    .transition(.opacity.combined(with: .move(edge: .top)))
                }

                Divider()

                Text("Snackbar duration")
                        .font(.headline)

                Picker("Snackbar duration:", selection: $snackbarDuration) {
                    ForEach(Warp.Snackbar.Duration.demoCases, id: \.self) { currentDuration in
                        Text(currentDuration.description)
                    }
                }
                .pickerStyle(.segmented)

                Divider()

                Text("Show close button")
                    .font(.headline)

                Toggle(isOn: $showCloseButton) {
                    Text("Show close button on snackbar")
                }
                  .padding()

                Divider()

                Text("Action Button Mode")
                    .font(.headline)

                Picker("Action Mode:", selection: $actionMode) {
                    ForEach(ActionMode.allCases, id: \.self) { mode in
                        Text(mode.rawValue).tag(mode)
                    }
                }
                .pickerStyle(.segmented)

                Divider()

                Text("Custom Text")
                    .font(.headline)

                TextField("Enter custom snackbar text", text: $customText)
                    .textFieldStyle(.roundedBorder)
                    .padding()

                Spacer()
            }
        }
        .padding()
        .modifier(
            SnackbarConditionalModifier(
                type: snackbarType,
                title: snackbarTitle,
                actionMode: actionMode,
                action: snackbarAction,
                duration: snackbarDuration,
                showCloseButton: showCloseButton,
                isPresented: $snackbarIsPresented
            )
        )
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Snackbar")
    }

    private var snackbarStatus: String {
        snackbarIsPresented ? "visible" : "not visible"
    }

    private var snackbarTitle: String {
        customText.isEmpty ? "Here's a snackbar of type \(snackbarType.description)" : customText
    }

    private var snackbarAction: Warp.Snackbar.Action? {
        guard actionMode != .none else { return nil }
        let actionTitle = actionMode == .long ? "Long action" : "Action"
        return Warp.Snackbar.Action(title: actionTitle) {
            actionMessage = "Action button tapped!"
        }
    }

    private func iconMenuButton(icon: Binding<Warp.Icon>) -> some View {
        Menu {
            ForEach(Warp.Icon.allCases, id: \.self) { iconOption in
                Button(action: {
                    icon.wrappedValue = iconOption
                    snackbarType = .neutralIcon(iconOption)
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
}

struct SnackbarConditionalModifier: ViewModifier {
    let type: Warp.SnackbarType
    let title: String
    let actionMode: SnackbarView.ActionMode
    let action: Warp.Snackbar.Action?
    let duration: Warp.Snackbar.Duration
    let showCloseButton: Bool
    @Binding var isPresented: Bool

    func body(content: Content) -> some View {
        switch actionMode {
        case .none:
            content.warpSnackbar(
                type: type,
                title: title,
                duration: duration,
                showCloseButton: showCloseButton,
                isPresented: $isPresented
            )
        case .inline:
            content.warpSnackbar(
                type: type,
                title: title,
                action: action,
                duration: duration,
                showCloseButton: showCloseButton,
                isPresented: $isPresented
            )
        case .long:
            content.warpSnackbar(
                type: type,
                title: title,
                longAction: action,
                duration: duration,
                showCloseButton: showCloseButton,
                isPresented: $isPresented
            )
        }
    }
}

fileprivate extension Warp.SnackbarType {
    var description: String {
        switch self {
        case .positive:
            "positive"
        case .warning:
            "warning"
        case .negative:
            "negative"
        case .info:
            "info"
        case .neutral:
            "neutral"
        case .neutralIcon(let icon):
            "neutralIcon(\(icon))"
        }
    }
}


fileprivate extension Warp.Snackbar.Duration {
    static var demoCases: [Warp.Snackbar.Duration] {
        [.short, .long, .infinite]
    }

    var description: String {
        switch self {
        case .short:
            "Short (4 seconds)"
        case .long:
            "Long (10 seconds)"
        case .infinite:
            "Infinite"
        case .custom(let interval):
            "custom (\(interval) seconds)"
        }
    }
}

#Preview {
    SnackbarView()
}
