import SwiftUI
import Warp

private let allowedTextFieldStates: [Warp.TextFieldState] = [.normal(.none), .disabled, .readOnly]

struct TextFieldView: View {
    @State private var state = Warp.TextFieldState.normal(.none)

    private let colorProvider = Warp.Color

    @State private var textFieldText = ""
    
    @State private var textFieldPlaceholder = "Warp"

    @State private var textFieldTitle = "WarpTextField"

    @State private var textFieldAdditionalInformation = "Optional"

    @State private var hasInfoToolTipView = true
    
    @State private var hasLeftView = true

    @State private var hasRightView = true

    @State private var informationState: Warp.TextField.InformationState = .none

    @State private var isSecured = false
    @State private var isTextSecured = true

    @FocusState private var isFocused: Bool

    private static let defaultConfiguration = Warp.TextFieldConfiguration.default

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack (alignment: .leading) {
                createView()
                    .padding(.vertical)

                Divider()

                HStack {
                    Warp.Text("Type", style: .bodyStrong)

                    Picker("", selection: $state.animation(.smooth)) {
                        ForEach(allowedTextFieldStates, id: \.self) { state in
                            Text(state.title)
                        }
                    }
                    .pickerStyle(.wheel)
                }

                Divider()

                HStack {
                    Warp.Text("Placeholder", style: .bodyStrong)

                    Spacer()

                    Warp.TextField(text: $textFieldPlaceholder)
                }

                Divider()

                HStack {
                    Warp.Text("Title", style: .bodyStrong)

                    Spacer()

                    Warp.TextField(text: $textFieldTitle)
                }

                Divider()

                HStack {
                    Warp.Text("Additional Information", style: .bodyStrong)

                    Spacer()

                    Warp.TextField(text: $textFieldAdditionalInformation)
                }

                createToggle(binding: $hasInfoToolTipView, text: ("Hide info tool tip view", "Show info tool tip view"))

                Divider()

                createToggle(binding: $hasLeftView, text: ("Hide left view", "Show left view"))

                Divider()

                createToggle(binding: $hasRightView, text: ("Hide right view", "Show right view"))

                Divider()

                HStack {
                    Warp.Text("Information state", style: .bodyStrong)

                    Picker("", selection: $informationState.animation(.smooth)) {
                        ForEach(Warp.TextField.InformationState.allCases, id: \.self) { state in
                            Text(state.title)
                        }
                    }
                    .pickerStyle(.wheel)
                }

                Divider()

                createToggle(binding: $isSecured, text: ("Secured", "Unsecured"))
            }
            .padding(.horizontal)
            .onChange(of: informationState) { newInformationState in
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                
                switch newInformationState {
                    case .error:
                        state = .normal(.error("Error message"))

                    case .helper:
                        state = .normal(.helper("Helper message"))

                    case .none:
                        break
                }
            }
        }
        .navigationTitle("Text Field")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func createToggle(binding: Binding<Bool>, text: (true: String, false: String)) -> some View {
        Toggle(isOn: binding.animation(.smooth)) {
            Warp.Text(binding.wrappedValue ? text.true: text.false, style: .bodyStrong)
        }
        .padding(.trailing, 4)
    }

    @ViewBuilder
    private func createView() -> some View {
        let infoToolTipView = hasInfoToolTipView ? AnyView(Image(systemName: "exclamationmark.circle")): nil
        let leftView = hasLeftView ? AnyView(Image(systemName: "magnifyingglass")): nil
        let rightView = hasRightView ? AnyView(Image(systemName: "xmark")): nil

        if isSecured {
            Warp.TextField.createSecureTextField(
                configuration: Warp.TextFieldConfiguration(
                    placeholder: textFieldPlaceholder,
                    title: textFieldTitle,
                    additionalInformation: textFieldAdditionalInformation,
                    infoToolTipView: infoToolTipView,
                    leftView: leftView,
                    rightView: rightView,
                    informationState: informationState
                ),
                text: $textFieldText,
                state: $state,
                isSecured: $isTextSecured
            )
            .padding()
        } else {
            Warp.TextField(
                placeholder: textFieldPlaceholder,
                title: textFieldTitle,
                additionalInformation: textFieldAdditionalInformation,
                infoToolTipView: infoToolTipView,
                leftView: leftView,
                rightView: rightView,
                informationState: informationState,
                text: $textFieldText,
                state: $state
            )
            .padding()
        }
    }
}

#Preview {
    TextFieldView()
}

extension Warp.TextField.InformationState: CaseIterable {
    public static var allCases: [Warp.TextField.InformationState] {
        [
            .none,
            .error("Error message"),
            .helper("Helper message")
        ]
    }

    fileprivate var title: String {
        switch self {
            case .none:
                return "None"

            case let .error(error):
                return error

            case let .helper(helpText):
                return helpText
        }
    }
}

extension Warp.TextFieldState {
    fileprivate var title: String {
        switch self {
            case .normal:
                return "Normal"

            case .active:
                return "Active"

            case .disabled:
                return "Disabled"

            case .readOnly:
                return "Read only"
        }
    }
}
