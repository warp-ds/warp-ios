import SwiftUI

extension Warp {
    /// A text area component used for capturing multi-line text input.
    ///
    /// The `Warp.TextArea` component allows for longer text inputs compared to a standard text field. It supports multiple styles: `.default`, `.disabled`, `.error`, and `.readOnly`. You can also provide an optional label and help text to display alongside the text area, as well as specify the minimum height.
    ///
    /// **Usage:**
    /// ```swift
    /// Warp.TextArea(
    ///     label: Warp.Label(title: "Description"),
    ///     text: .constant(""),
    ///     placeholder: "Enter your text here...",
    ///     style: .default,
    ///     helpText: Warp.HelpText(text: "This is a required field.", style: .default),
    ///     minHeight: 120
    /// )
    /// ```
    ///
    /// - Parameters:
    ///   - label: An optional `Warp.Label` to display above the text area.
    ///   - text: Binding to the text content.
    ///   - placeholder: Text to display when the text area is empty.
    ///   - style: The style of the text area. Options are `.default`, `.disabled`, `.error`, and `.readOnly`.
    ///   - helpText: Optional `Warp.HelpText` to display below the text area.
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

        /// An optional `Warp.Label` to display above the text area.
        private let label: Warp.Label?

        /// Text to display when the text area is empty.
        private let placeholder: String

        /// The style of the text area.
        private let style: Warp.TextAreaStyle

        /// Optional `Warp.HelpText` to display below the text area.
        private let helpText: Warp.HelpText?
        
        /// The minimum height of the text area.
        private let minHeight: CGFloat
        
        // MARK: - Initialization

        /// Creates a new `TextArea` instance.
        ///
        /// - Parameters:
        ///   - label: An optional `Warp.Label` to display above the text area.
        ///   - text: Binding to the text content.
        ///   - placeholder: Text to display when the text area is empty.
        ///   - style: The style of the text area. Defaults to `.default`.
        ///   - helpText: Optional `Warp.HelpText` to display below the text area.
        ///   - minHeight: Optional minimum height for the text area. Defaults to `88`.
        public init(
            label: Warp.Label? = nil,
            text: Binding<String>,
            placeholder: String,
            style: Warp.TextAreaStyle = .default,
            helpText: Warp.HelpText? = nil,
            minHeight: CGFloat = 88
        ) {
            self.label = label
            self._text = text
            self.placeholder = placeholder
            self.style = style
            self.helpText = helpText
            self.minHeight = minHeight
        }

        // MARK: - Body

        public var body: some View {
            VStack(alignment: .leading, spacing: Warp.Spacing.spacing50) {
                if let label = label {
                    label
                }
                
                textAreaView

                if let helpText = helpText {
                    helpText
                }
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
            label: Warp.Label(
                title: "Label",
                additionalInformation: "Optional",
                showTooltipImage: true,
                tooltipContent: AnyView(
                    Warp.Tooltip(title: "It's an optional field", arrowEdge: .leading)
                )
            ),
            text: .constant(""),
            placeholder: "Hint...",
            style: .default,
            helpText: Warp.HelpText(text: "Help text", style: .error)
        )

        Divider()

        Warp.TextArea(
            label: Warp.Label(title: "Label"),
            text: .constant("Text"),
            placeholder: "Hint...",
            style: .disabled,
            helpText: Warp.HelpText(text: "Help text", style: .default)
        )
        
        Divider()

        Warp.TextArea(
            text: .constant(""),
            placeholder: "Hint...",
            style: .error,
            helpText: Warp.HelpText(text: "Error occurred.", style: .error)
        )
        
        Divider()

        Warp.TextArea(
            label: Warp.Label(title: "Label"),
            text: .constant("Text"),
            placeholder: "Hint...",
            style: .readOnly,
            helpText: Warp.HelpText(text: "Read-only field.", style: .default)
        )
    }
    .padding(Warp.Spacing.spacing200)
}
