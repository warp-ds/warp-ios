import SwiftUI

extension Warp {
    public struct Input: View {
        /// <#Description#>
        public static let inputDefaultInactiveState = InputState.normal

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
            placeholder: String,
            title: String?,
            additionalInformation: String?,
            infoToolTip: Image?,
            iconLeft: Image?,
            iconRight: Image?,
            prefix: String?,
            suffix: String?,
            errorMessage: String? = nil,
            helpMessage: String? = nil,
            isAnimated: Bool = true,
            lineLimit: ClosedRange<UInt8>,
            text: Binding<String>,
            state: Binding<InputState>
        ) {
            self.config = InputConfiguration(
                placeholder: placeholder,
                title: title,
                additionalInformation: additionalInformation,
                infoToolTip: infoToolTip,
                iconLeft: iconLeft,
                iconRight: iconRight,
                prefix: prefix,
                suffix: suffix,
                errorMessage: errorMessage,
                helpMessage: helpMessage,
                isAnimated: isAnimated,
                lineLimit: lineLimit
            )

            self.text = text
            self._state = state
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

        public static func create(
            placeholder: String = "",
            title: String? = nil,
            additionalInformation: String? = nil,
            infoToolTip: Image? = nil,
            iconLeft: Image? = nil,
            iconRight: Image? = nil,
            prefix: String? = nil,
            suffix: String? = nil,
            errorMessage: String? = nil,
            helpMessage: String? = nil,
            isAnimated: Bool = true,
            lineLimit: ClosedRange<UInt8> = .oneLineLimit,
            text: Binding<String> = .constant(""),
            state: Binding<InputState>
        ) -> Warp.Input {
            Warp.Input(
                config: InputConfiguration(
                    placeholder: placeholder,
                    title: title,
                    additionalInformation: additionalInformation,
                    infoToolTip: infoToolTip,
                    iconLeft: iconLeft,
                    iconRight: iconRight,
                    prefix: prefix,
                    suffix: suffix,
                    errorMessage: errorMessage,
                    helpMessage: helpMessage,
                    isAnimated: isAnimated,
                    lineLimit: lineLimit
                ),
                text: text,
                state: state
            )
        }

        public static func create(
            placeholder: String = "",
            title: String? = nil,
            additionalInformation: String? = nil,
            infoToolTip: Image? = nil,
            iconLeft: Image? = nil,
            iconRight: Image? = nil,
            prefix: String? = nil,
            suffix: String? = nil,
            errorMessage: String? = nil,
            helpMessage: String? = nil,
            isAnimated: Bool = true,
            lineLimit: ClosedRange<UInt8> = .oneLineLimit,
            text: Binding<String> = .constant("")
        ) -> Warp.Input {
            var tempState = inputDefaultInactiveState

            let stateBinding = Binding {
                return tempState
            } set: { newValue in
                tempState = newValue
            }

            return Warp.Input(
                config: InputConfiguration(
                    placeholder: placeholder,
                    title: title,
                    additionalInformation: additionalInformation,
                    infoToolTip: infoToolTip,
                    iconLeft: iconLeft,
                    iconRight: iconRight,
                    prefix: prefix,
                    suffix: suffix,
                    errorMessage: errorMessage,
                    helpMessage: helpMessage,
                    isAnimated: isAnimated,
                    lineLimit: lineLimit
                ),
                text: text,
                state: stateBinding
            )
        }

        public var body: some View {
            VStack(alignment: .leading) {
                topView

                textFieldView

                helperTextView
            }
            .onTapGesture {
                isFocused = true
            }
            .accessibilityElement(children: .combine)
            .accessibilityRepresentation {
                TextField(config.placeholder, text: text)
                    .accessibilityInputLabels(accessibilityInformation)
                    .accessibilityLabel(accessibilityInformation.joined(separator: ", "))
                    .accessibilityHint(config.placeholder)
            }
            .disabled(state.shouldBeDisabled)
        }

        /// Information that will be produced for Accessibility engine based on current configuration.
        private var accessibilityInformation: [String] {
            var inputLabels: [String] = []

            if let title = config.title {
                inputLabels.append(title)
            }

            if let additionalInformation = config.additionalInformation {
                inputLabels.append(additionalInformation)
            }

            return inputLabels
        }

        // MARK: - TopView

        private var topView: some View {
            ToolTipView(
                title: config.title,
                additionalInformation: config.additionalInformation,
                infoToolTipView: config.infoToolTip,
                colorProvider: colorProvider
            )
        }

        // MARK: TopView -

        private var textFieldView: some View {
            TextFieldView(
                placeholder: config.placeholder,
                text: text,
                isAnimated: config.isAnimated,
                lineLimit: config.lineLimit,
                isFocused: $isFocused,
                state: $state
            )
        }

        private var helperTextView: some View {
            HelperInformationView(
                state: state,
                errorMessage: config.errorMessage,
                helpMessage: config.helpMessage
            )
        }
    }
}

extension Warp.InputState {
    fileprivate var shouldBeDisabled: Bool {
        let isDisabled = self == .disabled
        lazy var isReadOnly = self == .readOnly

        return isDisabled || isReadOnly
    }
}

private struct DirectTouchAccessibilityViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        if #available(iOS 17.0, *) {
            content
                .accessibilityDirectTouch(true, options: .requiresActivation)
        }
    }
}

public struct WarpInput: View {
    let title: String
    @State var text: String = ""
    @State var state: WarpInputState
    let colorProvider = Config.colorProvider
    
    public init(title: String,
                text: String,
                state: WarpInputState = .normal) {
        self.title = title
        self._state = State(initialValue: state)
        self.text = text
    }
    
    var inputBorderColor: Color {
        switch state {
        case .normal:
            return colorProvider.inputBorder
        case .active:
            return colorProvider.inputBorderActive
        case .disabled:
            return colorProvider.inputBorderDisabled
        case .error:
            return colorProvider.inputBorderNegative
        case .readOnly:
            return colorProvider.inputBorder
        }
    }
    
    var backgroundColor: Color {
        state == .disabled ? colorProvider.inputBackgroundDisabled: colorProvider.inputBackground
    }
    
    var helpTextForegroundColor: Color {
        state == .error ? colorProvider.inputTextNegative : colorProvider.inputTextHint
    }
    
    var inputBorderWidth: CGFloat {
        switch state {
        case .normal:
            return 2
        case .active:
            return 4
        case .disabled:
            return 2
        case .error:
            return 2
        case .readOnly:
            return 0
        }
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                    .font(.footnote)
                    .foregroundColor(colorProvider.inputTextFilled)
                Text("Optional")
                    .font(.caption)
                    .fontWeight(.thin)
                    .foregroundColor(FinnColors.gray500)
                Image(systemName: "exclamationmark.circle")
                    .foregroundColor(FinnColors.gray300)
            }
            TextField("Hint", text: $text, onEditingChanged: { startedEditing in
                if startedEditing {
                    state = .active
                } else {
                    state = .normal
                }
            })
            .font(.callout)
            .disabled(state == .disabled || state == .readOnly)
                .padding(.vertical)
                .padding(.horizontal, state == .readOnly ? 0 : 8)
                .background(backgroundColor)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(inputBorderColor, lineWidth: inputBorderWidth))
                .cornerRadius(4)
            Text(state == .error ? "Error text" : "Help text")
                .foregroundColor(helpTextForegroundColor)
                .font(.caption)
                .fontWeight(.thin)
        }
        .padding()
    }
}

public enum WarpInputState {
    case normal
    case active
    case disabled
    case error
    case readOnly
}

private struct WarpInputPreview: PreviewProvider {
    static var previews: some View {
        VStack {
            WarpInput(title: "Label", text: "Text")
            WarpInput(title: "Label", text: "Text", state: .disabled)
            WarpInput(title: "Label", text: "Text", state: .error)
            WarpInput(title: "Label", text: "Text", state: .readOnly)
        }
    }
}
