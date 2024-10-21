import SwiftUI

extension Warp {

    /// A view that displays help text with customizable styles.
    ///
    /// The `Warp.HelpText` component is used to present supplementary information, hints, or messages to the user. It supports different styles to represent various states like default, error, or disabled.
    ///
    /// **Usage:**
    ///
    /// ```swift
    /// Warp.HelpText(text: "This is a help text.", style: .default)
    /// ```
    ///
    /// - Parameters:
    ///   - text: The text to display.
    ///   - style: The style to apply to the text. Defaults to `.default`.
    public struct HelpText: View {

        // MARK: - Properties

        /// Object responsible for providing colors in different environments and variants.
        private let colorProvider: ColorProvider = Warp.Color

        /// The text to display.
        private let text: String

        /// The style to apply to the text.
        private let style: Warp.HelpTextStyle

        // MARK: - Initialization

        /// Creates a new `HelpText` instance.
        ///
        /// - Parameters:
        ///   - text: The text to display.
        ///   - style: The style to apply to the text. Defaults to `.default`.
        public init(
            text: String,
            style: Warp.HelpTextStyle = .default
        ) {
            self.text = text
            self.style = style
        }

        // MARK: - Body

        public var body: some View {
            SwiftUI.Text(
                text
            )
            .font(from: .detail)
            .foregroundColor(textColor)
        }

        // MARK: - Computed Properties

        /// Determines the text color based on the selected style.
        private var textColor: Color {
            switch style {
            case .default:
                return colorProvider.token.textSubtle
            case .error:
                return colorProvider.token.textNegative
            case .disabled:
                return colorProvider.token.textDisabled
            }
        }
    }
}

#Preview {
    VStack(spacing: 30) {
        Warp.HelpText(text: "Default style", style: .default)

        Divider()

        Warp.HelpText(text: "Disabled style", style: .disabled)

        Divider()

        Warp.HelpText(text: "Error style", style: .error)
    }
    .padding()
}
