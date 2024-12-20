import SwiftUI

extension Warp {
    /// A versatile text component used to display labels with customizable styles and foreground appearances.
    public struct Text: View, Hashable {
        public static func == (lhs: Warp.Text, rhs: Warp.Text) -> Bool {
            lhs.text == rhs.text &&
            lhs.style == rhs.style
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(text)
            hasher.combine(style)
        }

        /// The text content to display.
        private let text: String
        /// The style applied to the text, determining its typography and appearance.
        private let style: Warp.TextStyle
        /// The foreground style of the text, which can be a solid color, gradient, or other shape style.
        private let foregroundStyle: AnyShapeStyle
        /// Provides color tokens for the Warp design system.
        private let colorProvider: ColorProvider = Warp.Color

        /// Initializes a Warp.Text view with specific text, style, and a single color.
        ///
        /// - Parameters:
        ///   - text: The text content to display.
        ///   - style: The text style, defined by `Warp.TextStyle`, which determines typography and size.
        ///   - color: A solid color for the text. Defaults to `Warp.Color.token.text`.
        public init(
            _ text: String,
            style: Warp.TextStyle,
            color: Color = Warp.Color.token.text
        ) {
            self.text = text
            self.style = style
            self.foregroundStyle = AnyShapeStyle(color)
        }

        /// Initializes a Warp.Text view with specific text, style, and a custom foreground style.
        ///
        /// - Parameters:
        ///   - text: The text content to display.
        ///   - style: The text style, defined by `Warp.TextStyle`, which determines typography and size.
        ///   - foregroundStyle: A custom foreground style, such as a gradient or pattern, applied to the text.
        public init(
            _ text: String,
            style: Warp.TextStyle,
            foregroundStyle: AnyShapeStyle
        ) {
            self.text = text
            self.style = style
            self.foregroundStyle = foregroundStyle
        }

        public var body: some View {
            SwiftUI.Text(text)
                .font(from: style.asTypography)
                .foregroundStyle(foregroundStyle)
        }
    }
}


extension Warp.Text {
    /// Returns a new Warp.Text instance with an updated foreground color.
    ///
    /// - Parameter color: A solid color to apply to the text.
    /// - Returns: A new instance of Warp.Text with the specified color applied.
    public func foregroundColor(_ color: Color) -> Self {
        return Warp.Text(text, style: style, color: color)
    }

    /// Returns a new Warp.Text instance with an updated foreground style.
    ///
    /// - Parameter foregroundStyle: A custom foreground style, such as a gradient or pattern.
    /// - Returns: A new instance of Warp.Text with the specified foreground style applied.
    public func foregroundStyle(_ foregroundStyle: AnyShapeStyle) -> Self {
        return Warp.Text(text, style: style, foregroundStyle: foregroundStyle)
    }
}

#Preview {
    return ScrollView(showsIndicators: false) {
        ForEach(Warp.TextStyle.allCases, id: \.self) { variant in
            VStack(alignment: .leading, spacing: 10) {
                createView(for: variant)
                Divider()
            }
            .padding(.vertical, 4)
        }
        .padding()
    }

    func createView(for style: Warp.TextStyle) -> some View {
        Warp.Text(String(describing: style).capitalized, style: style)
    }
}
