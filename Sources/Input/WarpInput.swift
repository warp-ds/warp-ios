import SwiftUI

extension Warp {
    /// <#Description#>
    public struct InputConfig {
        /// <#Description#>
        public let placeholder: String

        /// <#Description#>
        public let title: String?

        /// <#Description#>
        public let additionalInformation: String?

        /// <#Description#>
        public let infoToolTip: Image?

        /// <#Description#>
        public let iconLeft: Image?

        /// <#Description#>
        public let iconRight: Image?

        /// <#Description#>
        public let prefix: String?

        /// <#Description#>
        public let suffix: String?

        public let isAnimated: Bool

        init(
            placeholder: String,
            title: String? = nil,
            additionalInformation: String? = nil,
            infoToolTip: Image? = nil,
            iconLeft: Image? = nil,
            iconRight: Image? = nil,
            prefix: String? = nil,
            suffix: String? = nil,
            isAnimated: Bool = false
        ) {
            self.placeholder = placeholder
            self.title = title
            self.additionalInformation = additionalInformation
            self.infoToolTip = infoToolTip
            self.iconLeft = iconLeft
            self.iconRight = iconRight
            self.prefix = prefix
            self.suffix = suffix
            self.isAnimated = isAnimated
        }

    }
}

extension Warp {
    public struct Input: View {
        /// <#Description#>
        public static let inputDefaultInactiveState = Warp.InputState.normal

        private let title: String
        
        /// <#Description#>
        public var text: Binding<String>
        
//        private var _state: Binding<Warp.InputState>
        /// <#Description#>
        @Binding private var state: Warp.InputState

        private let colorProvider = Config.colorProvider

        public init(
            title: String,
            text: Binding<String>,
            state: Binding<Warp.InputState>
        ) {
            self.title = title
            self.text = text
            self._state = state
        }

        init(
            title: String,
            text: String = "",
            state: Warp.InputState = inputDefaultInactiveState
        ) {
            self.title = title
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
            HStack {
                titleView

                optionalLabelView

                rightImageView
            }
        }

        private var titleView: some View {
            Text(title)
                .font(.footnote)
                .foregroundColor(colorProvider.inputTextFilled)
        }

        private var optionalLabelView: some View {
            Text("Optional")
                .font(.caption)
                .fontWeight(.thin)
                .foregroundColor(FinnColors.gray500)
        }

        private var rightImageView: some View {
            Image(systemName: "exclamationmark.circle")
                .foregroundColor(FinnColors.gray300)
        }

        // MARK: TopView -

        private var textFieldView: some View {
            TextField(
                "Hint",
                text: text,
                onEditingChanged: { startedEditing in
                    withAnimation {
                        if startedEditing {
                            _state.wrappedValue = .active
                        } else {
                            _state.wrappedValue = .normal
                        }
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
            Text(_state.wrappedValue == .error ? "Error text" : "Help text")
                .foregroundColor(helpTextForegroundColor)
                .font(.caption)
                .fontWeight(.thin)
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
    case normal, active, disabled, error, readOnly
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
