import SwiftUI

extension Warp {
    /// A text field component used for capturing multi-line text input.
    ///
    /// The `Warp.TextField` component allows for longer text inputs compared to a standard text field. It supports multiple styles: `.default`, `.disabled`, `.error`, and `.readOnly`. You can also provide an optional label and help text to display alongside the text field, as well as specify the minimum height.
    ///
    /// **Usage:**
    /// ```swift
    /// Warp.TextField(
    ///     title: "Description",
    ///     text: .constant(""),
    ///     placeholder: "Enter your text here...",
    ///     style: .default,
    ///     helpText: "This is a required field."
    /// )
    /// ```
    ///
    /// - Parameters:
    ///   - title: The main title text to display.
    ///   - additionalInformation: Optional text to display after the title.
    ///   - tooltipContent: An optional view to display when the tooltip icon is tapped.
    ///   - leftIcon: An optional `Warp.Icon` displayed on the left side of the text field.
    ///   - prefix: An optional string displayed before the text input.
    ///   - text: Binding to the text content.
    ///   - placeholder: Text to display when the text field is empty.
    ///   - suffix: An optional string displayed after the text input.
    ///   - rightIcon: An optional `Warp.Icon` displayed on the right side of the text field.
    ///   - rightIconAction: An optional action for the right icon.
    ///   - style: The style of the text field. Options are `.default`, `.disabled`, `.error`, and `.readOnly`.
    ///   - helpText: Optional `String` to display below the text field.
    public struct TextField: View {

        // MARK: - Properties

        /// Object responsible for providing colors in different environments and variants.
        private let colorProvider: ColorProvider = Warp.Color

        /// The corner radius for the text field border.
        private let cornerRadius = Warp.Border.borderRadius50

        /// Tracks whether the text field is currently focused.
        @FocusState private var isFocused: Bool

        /// Binding to the text content.
        @Binding private var text: String

        /// The main title text to display.
        private let title: String

        /// Optional text to display after the title.
        private let additionalInformation: String?

        /// An optional view to display when the tooltip icon is tapped.
        private let tooltipContent: AnyView?

        /// Text to display when the text field is empty.
        private let placeholder: String

        /// An optional `Warp.Icon` displayed on the left side of the text field.
        private let leftIcon: Warp.Icon?

        /// An optional string displayed before the text input.
        private let prefix: String?

        /// An optional string displayed after the text input.
        private let suffix: String?

        /// An optional `Warp.Icon` displayed on the right side of the text field.
        private let rightIcon: Warp.Icon?

        /// An optional action for right icon
        private let rightIconAction: () -> Void?

        /// The style of the text field.
        private let style: Warp.TextFieldStyle

        /// Optional `String` to display below the text field.
        private let helpText: String?

        /// Determines whether editing is disabled.
        private var disableEditing: Bool = false

        // MARK: - Initialization

        /// Creates a new `TextField` instance.
        ///
        /// - Parameters:
        ///   - title: The main title text to display.
        ///   - additionalInformation: Optional text to display after the title.
        ///   - tooltipContent: An optional view to display when the tooltip icon is tapped.
        ///   - leftIcon: An optional `Warp.Icon` displayed on the left side of the text field.
        ///   - prefix: An optional string displayed before the text input.
        ///   - text: Binding to the text content.
        ///   - placeholder: Text to display when the text field is empty.
        ///   - suffix: An optional string displayed after the text input.
        ///   - rightIcon: An optional `Warp.Icon` displayed on the right side of the text field.
        ///   - rightIconAction: An optional action for the right icon.
        ///   - style: The style of the text field. Defaults to `.default`.
        ///   - helpText: Optional `String` to display below the text field.
        public init(
            title: String = "",
            additionalInformation: String? = nil,
            tooltipContent: AnyView? = nil,
            leftIcon: Warp.Icon? = nil,
            prefix: String? = nil,
            text: Binding<String>,
            placeholder: String = "",
            suffix: String? = nil,
            rightIcon: Warp.Icon? = nil,
            rightIconAction: @escaping () -> Void? = { nil },
            style: Warp.TextFieldStyle = .default,
            helpText: String? = nil
        ) {
            self.title = title
            self.additionalInformation = additionalInformation
            self.tooltipContent = tooltipContent
            self.leftIcon = leftIcon
            self.prefix = prefix
            self._text = text
            self.placeholder = placeholder
            self.suffix = suffix
            self.rightIcon = rightIcon
            self.rightIconAction = rightIconAction
            self.style = style
            self.helpText = helpText
        }

        // MARK: - Body

        public var body: some View {
            VStack(alignment: .leading, spacing: Warp.Spacing.spacing50) {
                if !title.isEmpty {
                    Warp.Label(title: title, additionalInformation: additionalInformation, tooltipContent: tooltipContent)
                }

                textFieldView
                    .frame(height: 48)

                if let helpText = helpText {
                    Warp.HelpText(text: helpText, style: helpTextStyle())
                }
            }
        }

        /// Returns a new `TextField` instance with editing disabled or enabled.
        func disableEditing(_ disable: Bool) -> Self {
            var copy = self
            copy.disableEditing = disable
            return copy
        }

        private func helpTextStyle() -> Warp.HelpTextStyle {
            switch style {
            case .default:
                return .default
            case .disabled:
                return .disabled
            case .error:
                return .error
            case .readOnly:
                return .default
            }
        }

        // MARK: - Subviews

        /// The text field view, including the placeholder text.
        @ViewBuilder
        private var textFieldView: some View {
            HStack(spacing: Warp.Spacing.spacing100) {
                if let leftIcon {
                    Warp.IconView(leftIcon, size: .small)
                }
                if let prefix {
                    Text(prefix, style: .detail)
                }
                ZStack(alignment: .topLeading) {
                    if text.isEmpty && !isFocused {
                        Text(
                            placeholder,
                            style: .body,
                            color: colorProvider.token.textPlaceholder
                        )
                        .padding(.vertical, Warp.Spacing.spacing150)
                    }
                    SwiftUI.TextField(text, text: $text)
                        .allowsHitTesting(!disableEditing)
                        .disabled(style == .disabled || style == .readOnly)
                        .foregroundColor(textColor)
                        .font(from: Warp.Typography.body)
                        .clearTextEditorBackground()
                        .focused($isFocused)
                        .padding(.vertical, Warp.Spacing.spacing150)
                }
                if let suffix {
                    Text(suffix, style: .detail)
                }
                if let rightIcon {
                    SwiftUI.Button {
                        rightIconAction()
                    } label: {
                        Warp.IconView(rightIcon, size: .small)
                    }
                }
            }
            .padding(.horizontal, horizontalPadding)
            .modifier(BorderModifier(isFocused: isFocused, style: style, cornerRadius: cornerRadius, colorProvider: colorProvider, borderColor: borderColor))
            .background(backgroundColor)
        }

        // MARK: - Computed Properties

        /// Determines the background color based on the selected style.
        private var backgroundColor: Color {
            switch style {
            case .default:
                return colorProvider.token.background
            case .disabled:
                return colorProvider.token.backgroundDisabledSubtle
            case .error:
                return colorProvider.token.background
            case .readOnly:
                return colorProvider.token.backgroundTransparent0
            }
        }

        /// Determines the border color based on the selected style.
        private var borderColor: Color {
            switch style {
            case .default:
                return colorProvider.token.borderStrong
            case .disabled:
                return colorProvider.token.borderDisabled
            case .error:
                return colorProvider.token.borderNegative
            case .readOnly:
                return .clear
            }
        }

        /// Determines the text color based on the style and focus state.
        private var textColor: Color {
            switch style {
            case .default, .readOnly:
                return colorProvider.token.text
            case .disabled:
                return colorProvider.token.textDisabled
            case .error:
                return isFocused ? colorProvider.token.text : colorProvider.token.textNegative
            }
        }

        /// Calculates the horizontal padding based on the style.
        private var horizontalPadding: CGFloat {
            switch style {
            case .readOnly:
                return 0
            default:
                return Warp.Spacing.spacing100
            }
        }
    }
}

private struct BorderModifier: ViewModifier {
    var isFocused: Bool
    var style: Warp.TextFieldStyle
    var cornerRadius: CGFloat
    var colorProvider: ColorProvider
    var borderColor: Color

    func body(content: Content) -> some View {
        content.overlay(
            Group {
                if style != .readOnly {
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(isFocused ? colorProvider.token.borderFocus : borderColor, lineWidth: borderWidth)
                }
            }
        )
    }

    private var borderWidth: CGFloat {
        isFocused ? Warp.Border.borderWidth25 : Warp.Border.borderWidth12
    }
}

private struct ClearTextEditorBackgroundModifier: ViewModifier {
    func body(content: Content) -> some View {
        if #available(iOS 16.0, *) {
            content.scrollContentBackground(.hidden)
        } else {
            content
        }
    }
}

private extension View {
    func clearTextEditorBackground() -> some View {
        modifier(ClearTextEditorBackgroundModifier())
    }
}

#Preview {
    VStack(spacing: 30) {
        Warp.TextField(
            title: "Label",
            additionalInformation: "Optional",
            tooltipContent: AnyView(
                Warp.Tooltip(title: "It's an optional field", arrowEdge: .leading)
            ),
            text: .constant(""),
            placeholder: "Hint...",
            style: .default,
            helpText: "Help text"
        )

        Divider()

        Warp.TextField(
            title: "Label",
            text: .constant("Text"),
            placeholder: "Hint...",
            style: .disabled,
            helpText: "Help text"
        )

        Divider()

        Warp.TextField(
            title: "",
            text: .constant(""),
            placeholder: "Hint...",
            style: .error,
            helpText: "Error occurred."
        )

        Divider()

        Warp.TextField(
            title: "Label",
            text: .constant("Text"),
            placeholder: "Hint...",
            style: .readOnly,
            helpText: "Read-only field."
        )
    }
    .padding(Warp.Spacing.spacing200)
}
