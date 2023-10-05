import SwiftUI
import Combine

extension Warp {
    /// Inactive state of input.
    public static let inputDefaultInactiveState = InputState.normal

    public struct Input: View {
        /// Input configurations.
        private let configuration: InputConfiguration

        /// One-way binding TextField text.
        public var text: Binding<String>

        /// Two-way binding input state.
        @Binding private var state: InputState
        
        /// Two-way binding flag indicating input is first responder (focused).
        @FocusState private var isFocused: Bool

        /// Object responsible for providing needed colors.
        private let colorProvider: ColorProvider

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
            state: Binding<InputState>,
            colorProvider: ColorProvider = Config.colorProvider
        ) {
            self.configuration = InputConfiguration(
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
            self.colorProvider = colorProvider
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
            state: InputState = Warp.inputDefaultInactiveState,
            colorProvider: ColorProvider = Config.colorProvider
        ) {
            self.configuration = InputConfiguration(
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

            self.colorProvider = colorProvider
        }

        public init(
            config: InputConfiguration,
            text: Binding<String>,
            state: Binding<InputState>,
            colorProvider: ColorProvider = Config.colorProvider
        ) {
            self.configuration = config
            self.text = text
            self._state = state
            self.colorProvider = colorProvider
        }

        public var body: some View {
            TextField(
                configuration.placeholder,
                text: text
            )
            .textFieldStyle(
                .warp(
                    configuration: configuration,
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
        rightSymbol: String? = nil,
        colorProvider: ColorProvider = Config.colorProvider
    ) -> some View {
        let configuration: Warp.InputConfiguration = .decimal(
            leftSymbol: leftSymbol,
            rightSymbol: rightSymbol
        )
        let constantState: Warp.InputState = .normal

        return Warp.Input(
            config: configuration,
            text: text,
            state: .constant(constantState),
            colorProvider: colorProvider
        )
        .keyboardType(.decimalPad)
    }

    /// <#Description#>
    public static func createSearchTextField(
        text: Binding<String>,
        colorProvider: ColorProvider = Config.colorProvider
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
        isSecured: Binding<Bool>,
        colorProvider: ColorProvider = Config.colorProvider
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
                            colorProvider: colorProvider
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
                    state: state,
                    colorProvider: colorProvider
                )
            }
        }
    }
    
    /// <#Description#>
    public static func createWithDiscardButton(
        configuration: Warp.InputConfiguration,
        text: Binding<String>,
        state: Binding<Warp.InputState>,
        colorProvider: ColorProvider = Config.colorProvider
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
            state: state,
            colorProvider: colorProvider
        )
    }
}

private struct WarpInputPreview: PreviewProvider {
    private static let colorProvider = Config.colorProvider

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
                Warp.Input(text: bindingText, state: bindingState, colorProvider: colorProvider)
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
