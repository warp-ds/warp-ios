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
            isAnimated: Bool,
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
                isAnimated: isAnimated
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

        init(
            title: String,
            text: String = "",
            state: InputState = inputDefaultInactiveState
        ) {
            self.config = InputConfiguration()
            self.text = .constant(text)
            self._state = .constant(state)

            //            self._state = .init(
            //                get: {
            //                    state
            //                }, set: { newState in
            //                    _state.wrappedValue = newState
            //                }
            //            )
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
            isAnimated: Bool = true,
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
                    isAnimated: isAnimated
                ),
                text: text,
                state: state
            )
        }

        private var inputBorderColor: Color {
            state.inputBorderColor
        }

        private var backgroundColor: Color {
            state.backgroundColor
        }

        private var helpTextForegroundColor: Color {
            state.helpTextForegroundColor
        }

        private var inputBorderWidth: CGFloat {
            state.inputBorderWidth
        }

        private var shouldBeDisabled: Bool {
            state.shouldBeDisabled
        }

        private var horizontalPadding: CGFloat {
            state.horizontalPadding
        }

        public var body: some View {
            VStack(alignment: .leading) {
                topView

                textFieldView

                helperTextView
            }
            .padding()
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

        @ViewBuilder
        private var titleView: some View {
            if let title = config.title {
                Text(title)
                    .font(.footnote)
                    .foregroundColor(colorProvider.inputTextFilled)
            }
        }

        @ViewBuilder
        private var optionalLabelView: some View {
            if let additionalInformation = config.additionalInformation {
                Text(additionalInformation)
                    .font(.caption)
                    .fontWeight(.thin)
                    .foregroundColor(FinnColors.gray500)
            }
        }

        @ViewBuilder
        private var rightImageView: some View {
            if let infoToolTipImage = config.infoToolTip {
                infoToolTipImage
                    .foregroundColor(FinnColors.gray300)
                    .frame(width: 16, height: 16)
            }
        }

        // MARK: TopView -

        private var textFieldView: some View {
            TextField(
                config.placeholder,
                text: text,
                onEditingChanged: { startedEditing in
                    let updateState = {
                        if startedEditing {
                            _state.wrappedValue = .active
                        } else {
                            _state.wrappedValue = .normal
                        }
                    }

                    if config.isAnimated {
                        withAnimation {
                            updateState()
                        }
                    } else {
                        updateState()
                    }
                }
            )
            .font(.callout)
            .disabled(shouldBeDisabled)
            .padding(.vertical)
            .padding(.horizontal, horizontalPadding)
            .background(backgroundColor)
            .overlay(overlayView)
            .cornerRadius(4)
        }

        private var overlayView: some View {
            RoundedRectangle(cornerRadius: 4)
                .stroke(inputBorderColor, lineWidth: inputBorderWidth)
        }

        private var helperTextView: some View {
            HelperInformationView(
                state: state,
                errorMessage: config.errorMessage,
                helpMessage: config.helpMessage
            )
        }

        private var infoText: String {
            let stateInfoText = _state.wrappedValue == .error ? config.errorMessage: config.helpMessage
            let defaultText = ""

            return stateInfoText ?? defaultText
        }
    }
}

private struct ToolTipView: View {
    /// <#Description#>
    let title: String?
    
    /// <#Description#>
    let additionalInformation: String?
    
    /// <#Description#>
    let infoToolTipView: Image?

    let colorProvider: ColorProvider

    var body: some View {
        topView
    }

    private var topView: some View {
        HStack {
            titleView

            optionalLabelView

            rightImageView
        }
    }

    @ViewBuilder
    private var titleView: some View {
        if let title = title {
            Text(title)
                .font(.footnote)
                .foregroundColor(colorProvider.inputTextFilled)
        }
    }

    @ViewBuilder
    private var optionalLabelView: some View {
        if let additionalInformation = additionalInformation {
            Text(additionalInformation)
                .font(.caption)
                .fontWeight(.thin)
                .foregroundColor(FinnColors.gray500)
        }
    }

    @ViewBuilder
    private var rightImageView: some View {
        if let infoToolTipView = infoToolTipView {
            infoToolTipView
                .foregroundColor(FinnColors.gray300)
                .frame(width: 16, height: 16)
        }
    }
}

extension Warp {
    /// <#Description#>
    public enum InputState {
        case normal
        case active
        case disabled
        case error
        case readOnly
    }
}

extension Warp.InputState {
    /// <#Description#>
    fileprivate var inputBorderColor: Color {
        let colorProvider = Config.colorProvider

        switch self {
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

    private var isDisabled: Bool {
        return self == .disabled
    }

    /// <#Description#>
    fileprivate var backgroundColor: Color {
        let colorProvider = Config.colorProvider

        if self == .disabled {
            return colorProvider.inputBackgroundDisabled
        }

        return colorProvider.inputBackground
    }

    /// <#Description#>
    fileprivate var helpTextForegroundColor: Color {
        let colorProvider = Config.colorProvider

        if self == .error {
            return colorProvider.inputTextNegative
        }

        return colorProvider.inputTextHint
    }

    /// <#Description#>
    fileprivate var inputBorderWidth: CGFloat {
        switch self {
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

    fileprivate var shouldBeDisabled: Bool {
        let isDisabled = self == .disabled
        lazy var isReadOnly = self == .readOnly

        return isDisabled || isReadOnly
    }

    fileprivate var horizontalPadding: CGFloat {
        self == .readOnly ? 0 : 8
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
