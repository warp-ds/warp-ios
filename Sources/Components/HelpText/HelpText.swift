import SwiftUI

extension Warp {

    public struct HelpText: View {

        private let colorProvider: ColorProvider = Warp.Color

        private let text: String

        private let style: Warp.HelpTextStyle


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


        public var body: some View {
            Text(
                text,
                style: .detail,
                color: textColor
            )
        }


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
