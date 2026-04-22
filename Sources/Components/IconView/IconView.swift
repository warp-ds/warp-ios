import SwiftUI

extension Warp {
    /// A view that renders an icon with the specified size and color.
    ///
    /// `IconView` displays an icon in a specified size (`small`, `default`,  `large`, or `custom`) and color. The icon is rendered from the asset catalog.
    public struct IconView: View {
        /// The `Warp.Icon` to display.
        private let icon: Warp.Icon
        /// The size of the icon (small, default, large, or custom). Default is `.default`.
        private let size: Warp.IconSize
        /// The color of the icon. If nil, defaults to theme's icon color.
        private let color: Color?

        /// The current theme from the environment.
        @Environment(\.warpTheme) private var theme
        
        /// Initializes a new `IconView`.
        ///
        /// - Parameters:
        ///   - icon: The `Warp.Icon` to display.
        ///   - size: The size of the icon (small, default, large, or custom). Default is `.default`.
        ///   - color: The color of the icon. If nil, uses the theme's default icon color.
        public init(_ icon: Warp.Icon,
                    size: Warp.IconSize = .default,
                    color: Color? = nil) {
            self.icon = icon
            self.size = size
            self.color = color
        }

        public var body: some View {
            icon
                .frame(width: size.value, height: size.value)
                .foregroundColor(color ?? theme.token.icon) // Apply the icon color
        }
    }
}

extension Warp.IconView {
    /// Applies a custom foreground color to the `IconView`.
    ///
    /// - Parameter color: The custom color to apply to the icon.
    /// - Returns: A new `IconView` with the updated color.
    public func foregroundColor(_ color: Color) -> Self {
        return Warp.IconView(icon, size: size, color: color)
    }
}

#Preview {
    PreviewWrapper()
}

private struct PreviewWrapper: View {
    @Environment(\.warpTheme) private var theme

    var body: some View {
        ScrollView(showsIndicators: false) {
            // Example preview displaying multiple icons with different sizes and colors
            VStack(spacing: 20) {
                Warp.IconView(.activeAds, size: .small, color: theme.token.iconPrimary)
                Warp.IconView(.ads, size: .default, color: theme.token.iconWarning)
                Warp.IconView(.airCon, size: .large, color: theme.token.iconNegative)
            }
            .padding()
        }
    }
}
