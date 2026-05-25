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
        /// The optional color for the text.
        private let color: Color?
        /// The optional custom foreground style for the text.
        private let customForegroundStyle: AnyShapeStyle?

        /// The current theme from the environment.
        @Environment(\.warpTheme) private var theme

        /// Object responsible for providing colors in different environments and variants.
        private var colorProvider: ColorProvider {
            theme.colors
        }

        /// Initializes a Warp.Text view with specific text, style, and a single color.
        ///
        /// - Parameters:
        ///   - text: The text content to display.
        ///   - style: The text style, defined by `Warp.TextStyle`, which determines typography and size.
        ///   - color: An optional solid color for the text. Defaults to nil, which uses the theme's default text color.
        public init(
            _ text: String,
            style: Warp.TextStyle,
            color: Color? = nil
        ) {
            self.text = text
            self.style = style
            self.color = color
            self.customForegroundStyle = nil
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
            self.color = nil
            self.customForegroundStyle = foregroundStyle
        }

        public var body: some View {
            let resolvedStyle: AnyShapeStyle
            if let customForegroundStyle {
                resolvedStyle = customForegroundStyle
            } else {
                let resolvedColor = color ?? theme.token.text
                resolvedStyle = AnyShapeStyle(resolvedColor)
            }

            return SwiftUI.Text(text)
                .font(from: style.asTypography)
                .foregroundStyle(resolvedStyle)
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
