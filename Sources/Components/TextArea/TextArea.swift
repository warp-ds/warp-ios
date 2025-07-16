import SwiftUI

extension Warp {
    /// A text area component used for capturing multi-line text input.
    ///
    /// The `Warp.TextArea` component allows for longer text inputs compared to a standard text field. It supports multiple styles: `.default`, `.disabled`, `.error`, and `.readOnly`. You can also provide an optional label and help text to display alongside the text area, as well as specify the minimum height.
    ///
    /// **Usage:**
    /// ```swift
    /// Warp.TextArea(
    ///     title: "Description",
    ///     text: .constant(""),
    ///     placeholder: "Enter your text here...",
    ///     style: .default,
    ///     helpText: "This is a required field.",
    ///     minHeight: 120
    /// )
    /// ```
    ///
    /// - Parameters:
    ///   - title: The main title text to display.
    ///   - additionalInformation: Optional text to display after the title.
    ///   - tooltipContent: An optional view to display when the tooltip icon is tapped.
    ///   - text: Binding to the text content.
    ///   - placeholder: Text to display when the text area is empty.
    ///   - style: The style of the text area. Options are `.default`, `.disabled`, `.error`, and `.readOnly`.
    ///   - helpText: Optional `String` to display below the text area.
    ///   - minHeight: Optional minimum height for the text area. Defaults to `88`.
    public struct TextArea: View {
        
        // MARK: - Properties
        
        /// Object responsible for providing colors in different environments and variants.
        private let colorProvider: ColorProvider = Warp.Color

        /// The corner radius for the text area border.
        private let cornerRadius = Warp.Border.borderRadius50
        
        /// Tracks whether the text area is currently focused.
        @FocusState private var isFocused: Bool
        
        /// Binding to the text content.
        @Binding private var text: String

        /// The main title text to display.
        private let title: String

        /// Optional text to display after the title.
        private let additionalInformation: String?

        /// An optional view to display when the tooltip icon is tapped.
        private let tooltipContent: AnyView?

        /// Text to display when the text area is empty.
        private let placeholder: String

        /// The style of the text area.
        private let style: Warp.TextAreaStyle

        /// Optional `String` to display below the text area.
        private let helpText: String?
        
        /// The minimum height of the text area.
        private let minHeight: CGFloat
        
        // MARK: - Initialization

        /// Creates a new `TextArea` instance.
        ///
        /// - Parameters:
        ///   - title: The main title text to display.
        ///   - additionalInformation: Optional text to display after the title.
        ///   - tooltipContent: An optional view to display when the tooltip icon is tapped.
        ///   - text: Binding to the text content.
        ///   - placeholder: Text to display when the text area is empty.
        ///   - style: The style of the text area. Defaults to `.default`.
        ///   - helpText: Optional `String` to display below the text area.
        ///   - minHeight: Optional minimum height for the text area. Defaults to `88`.
        public init(
            title: String = "",
            additionalInformation: String? = nil,
            tooltipContent: AnyView? = nil,
            text: Binding<String>,
            placeholder: String = "",
            style: Warp.TextAreaStyle = .default,
            helpText: String? = nil,
            minHeight: CGFloat = 88
        ) {
            self.title = title
            self.additionalInformation = additionalInformation
            self.tooltipContent = tooltipContent
            self._text = text
            self.placeholder = placeholder
            self.style = style
            self.helpText = helpText
            self.minHeight = minHeight
        }

        // MARK: - Body

        public var body: some View {
            VStack(alignment: .leading, spacing: Warp.Spacing.spacing50) {
                if !title.isEmpty {
                    Warp.Label(title: title, additionalInformation: additionalInformation, tooltipContent: tooltipContent)
                }
                
                textAreaView

                if let helpText = helpText {
                    Warp.HelpText(text: helpText, style: helpTextStyle())
                }
            }
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

        /// The text area view, including the placeholder text.
        @ViewBuilder
        private var textAreaView: some View {
            ZStack(alignment: .topLeading) {
                if text.isEmpty && !isFocused {
                    Text(
                        placeholder,
                        style: .body,
                        color: colorProvider.token.textPlaceholder
                    )
                    .padding(.horizontal, horizontalPadding)
                    .padding(.vertical, Warp.Spacing.spacing150)
                }
                TextEditor(text: $text)
                    .disabled(style == .disabled || style == .readOnly)
                    .foregroundColor(textColor)
                    .font(from: Warp.Typography.body)
                    .clearTextEditorBackground()
                    .focused($isFocused)
                    .padding(.horizontal, horizontalPadding)
                    .padding(.vertical, Warp.Spacing.spacing150)
            }
            .frame(minHeight: self.minHeight)
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
                return colorProvider.token.border
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
            case .readOnly where !text.isEmpty:
                return -Warp.Spacing.spacing50
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
    var style: Warp.TextAreaStyle
    var cornerRadius: CGFloat
    var colorProvider: ColorProvider
    var borderColor: Color

    func body(content: Content) -> some View {
        content.overlay(
            Group {
                if style != .readOnly {
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(isFocused ? colorProvider.token.borderFocus : borderColor, lineWidth: 1)
                }
            }
        )
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
        Warp.TextArea(
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

        Warp.TextArea(
            title: "Label",
            text: .constant("Text"),
            placeholder: "Hint...",
            style: .disabled,
            helpText: "Help text"
        )
        
        Divider()

        Warp.TextArea(
            title: "",
            text: .constant(""),
            placeholder: "Hint...",
            style: .error,
            helpText: "Error occurred."
        )
        
        Divider()

        Warp.TextArea(
            title: "Label",
            text: .constant("Text"),
            placeholder: "Hint...",
            style: .readOnly,
            helpText: "Read-only field."
        )
    }
    .padding(Warp.Spacing.spacing200)
}
