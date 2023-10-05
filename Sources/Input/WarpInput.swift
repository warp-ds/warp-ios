import SwiftUI
import Combine

extension Warp {
    public struct Input: View {
        /// <#Description#>
        private let config: InputConfiguration

        /// <#Description#>
        public var text: Binding<String>

        /// <#Description#>
        @Binding private var state: InputState
        
        /// <#Description#>
        @FocusState private var isFocused: Bool

        /// <#Description#>
        private let colorProvider = Config.colorProvider

        public init(
            placeholder: String = "",
            title: String? = nil,
            additionalInformation: String? = nil,
            infoToolTipView: AnyView? = nil,
            leftView: AnyView? = nil,
            rightView: AnyView? = nil,
            errorMessage: String? = nil,
            helpMessage: String? = nil,
            isAnimated: Bool = true,
            text: Binding<String>,
            state: Binding<InputState>
        ) {
            self.config = InputConfiguration(
                placeholder: placeholder,
                title: title,
                additionalInformation: additionalInformation,
                infoToolTipView: infoToolTipView,
                leftView: leftView,
                rightView: rightView,
                errorMessage: errorMessage,
                helpMessage: helpMessage,
                isAnimated: isAnimated
            )

            self.text = text
            self._state = state
        }

        public init(
            placeholder: String = "",
            title: String? = nil,
            additionalInformation: String? = nil,
            infoToolTipView: AnyView? = nil,
            leftView: AnyView? = nil,
            rightView: AnyView? = nil,
            errorMessage: String? = nil,
            helpMessage: String? = nil,
            isAnimated: Bool = true,
            text: Binding<String>,
            state: InputState = Warp.inputDefaultInactiveState
        ) {
            self.config = InputConfiguration(
                placeholder: placeholder,
                title: title,
                additionalInformation: additionalInformation,
                infoToolTipView: infoToolTipView,
                leftView: leftView,
                rightView: rightView,
                errorMessage: errorMessage,
                helpMessage: helpMessage,
                isAnimated: isAnimated
            )

            self.text = text

            var tempState = state

            self._state = Binding(
                get: {
                    tempState
                }, set: { newValue in
                    tempState = newValue
                }
            )
        }

        public init(
            config: InputConfiguration,
            text: Binding<String>,
            state: Binding<InputState>
        ) {
            self.config = config
            self.text = text
            self._state = state
        }

        public var body: some View {
            TextField(
                config.placeholder,
                text: text
            )
            .textFieldStyle(
                .warp(
                    configuration: config,
                    text: text,
                    state: $state,
                    colorProvider: colorProvider
                )
            )
        }
    }
}

// Input variants
extension Warp.Input {
    /// <#Description#>
    public static func createDecimalTextField(
        text: Binding<String>,
        leftSymbol: String? = nil,
        rightSymbol: String? = nil
    ) -> some View {
        let configuration: Warp.InputConfiguration = .decimal(
            leftSymbol: leftSymbol,
            rightSymbol: rightSymbol
        )
        let constantState: Warp.InputState = .normal

        return Warp.Input(
            config: configuration,
            text: text,
            state: .constant(constantState)
        )
        .keyboardType(.decimalPad)
    }

    /// <#Description#>
    public static func createSearchTextField(
        text: Binding<String>
    ) -> some View {
        let configuration: Warp.InputConfiguration = .searchTextField
        let constantState: Warp.InputState = .normal

        let textField = createWithDiscardButton(
            configuration: configuration,
            text: text,
            state: .constant(constantState)
        )

        return textField
            .submitLabel(.search)
            .accessibilityAddTraits(.isSearchField)
    }
    
    /// <#Description#>
    public static func createPasswordTextField(
        configuration: Warp.InputConfiguration,
        text: Binding<String>,
        state: Binding<Warp.InputState>,
        isSecured: Binding<Bool>
    ) -> some View {
        var configuration = configuration
        let constantState: Warp.InputState = .normal

        let showHideButton = SwiftUI.Button(
            action: {
                let toggle = {
                    isSecured.wrappedValue.toggle()
                }

                if configuration.isAnimated {
                    withAnimation(.easeInOut) {
                        toggle()
                    }
                } else {
                    toggle()
                }
            }, label: {
                let showImage = "eye"
                let hideImage = "eye.slash"

                Image(systemName: isSecured.wrappedValue ? showImage: hideImage)
                    .resizable()
                    .scaledToFit()
            }
        )

        configuration.rightView = AnyView(showHideButton)

        return Group {
            if isSecured.wrappedValue {
                SecureField(configuration.placeholder, text: text)
                    .textFieldStyle(
                        .warp(
                            configuration: configuration,
                            text: text,
                            state: constantState,
                            colorProvider: Config.colorProvider
                        )
                    )
                    .textContentType(.password)
                    .accessibilityRepresentation {
                        SecureField(configuration.placeholder, text: text)
                    }
            } else {
                Warp.Input(
                    config: configuration,
                    text: text,
                    state: state
                )
            }
        }
    }
    
    /// <#Description#>
    public static func createWithDiscardButton(
        configuration: Warp.InputConfiguration,
        text: Binding<String>,
        state: Binding<Warp.InputState>
    ) -> Warp.Input {
        var configuration = configuration

        let clearButton = SwiftUI.Button(
            action: {
                text.wrappedValue = ""
            }, label: {
                Image(systemName: "xmark.circle")
                    .resizable()
            }
        )

        if !text.wrappedValue.isEmpty {
            configuration.rightView = AnyView(clearButton)
        } else {
            configuration.rightView = nil
        }

        return Warp.Input(
            config: configuration,
            text: text,
            state: state
        )
    }
}

private struct WarpInputPreview: PreviewProvider {
    static var previews: some View {
        ScrollView(showsIndicators: false) {
            VStack (alignment: .leading) {
                ForEach(Warp.InputState.allCases, id: \.self) { state in
                    createView(for: state)
                }
            }
        }
    }

    private static func createView(for state: Warp.InputState) -> some View {
        var text = state.title

        let bindingText = Binding {
            text
        } set: { newValue in
            text = newValue
        }

        var state = state

        let bindingState = Binding {
            state
        } set: { newValue in
            state = newValue
        }

        return GroupBox(
            content: {
                Warp.Input(text: bindingText, state: bindingState)
            }, label: {
                Text(state.title)
            }
        )
    }
}

extension Warp.InputState {
    fileprivate static var allCases: [Warp.InputState] = [
        .normal,
        .active,
        .disabled,
        .error,
        .readOnly
    ]
}

extension Warp.InputState {
    fileprivate var title: String {
        String(describing: self).localizedCapitalized
    }
}
