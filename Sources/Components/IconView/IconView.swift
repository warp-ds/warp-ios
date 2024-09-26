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
        /// The color of the icon. Defaults to `Warp.Color.token.icon`.
        private let color: Color
        private let colorProvider: ColorProvider = Warp.Color
        
        /// Initializes a new `IconView`.
        ///
        /// - Parameters:
        ///   - icon: The `Warp.Icon` to display.
        ///   - size: The size of the icon (small, default, large, or custom). Default is `.default`.
        ///   - color: The color of the icon. Defaults to `Warp.Color.token.icon`.
        public init(_ icon: Warp.Icon,
                    size: Warp.IconSize = .default,
                    color: Color = Warp.Color.token.icon) {
            self.icon = icon
            self.size = size
            self.color = color
        }

        public var body: some View {
            icon
                .frame(width: size.value, height: size.value)
                .foregroundColor(color) // Apply the icon color
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
    ScrollView(showsIndicators: false) {
        // Example preview displaying multiple icons with different sizes and colors
        VStack(spacing: 20) {
            Warp.IconView(.activeAds, size: .small, color: Warp.Token.iconPrimary)
            Warp.IconView(.ads, size: .default, color: Warp.Token.iconWarning)
            Warp.IconView(.airCon, size: .large, color: Warp.Token.iconNegative)
        }
        .padding()
    }
}
