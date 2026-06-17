import SwiftUI

extension Warp {
    /// A view that renders a palette icon with the specified size and color.
    ///
    /// `PaletteIconView` displays an icon in a specified size (`small`, `default`, `large`, or `custom`) and color with optional palette color tinting. The icon is rendered from the asset catalog.
    public struct PaletteIconView: View {
        /// The `Warp.Icon` to display.
        private let icon: Warp.Icon
        /// The size of the icon (small, default, large, or custom). Default is `.default`.
        private let size: Warp.IconSize
        /// The color of the icon from the palette which will be tinted. If nil, defaults to black.
        private let paletteColor: Color?
        /// The color of the icon. If nil, defaults to theme's icon color.
        private let color: Color?

        /// The current theme from the environment.
        @Environment(\.warpTheme) private var theme

        var paletteIconManager: WarpPaletteIconManager = .shared

        /// Initializes a new `PaletteIconView`.
        ///
        /// - Parameters:
        ///   - icon: The `Warp.Icon` to display.
        ///   - size: The size of the icon (small, default, large, or custom). Default is `.default`.
        ///   - paletteColor: The palette color to match and tint. If nil, defaults to black.
        ///   - color: The color to apply to the icon. If nil, uses the theme's default icon color.
        public init(_ icon: Warp.Icon,
                    size: Warp.IconSize = .default,
                    paletteColor: Color? = nil,
                    color: Color? = nil) {
            self.icon = icon
            self.size = size
            self.paletteColor = paletteColor
            self.color = color
        }

        // Tint image and cache it
        private var tintedImage: UIImage? {

            // This will instantly return from cache if it exists.
            // If not, it halts the main thread, calculates the pixels, caches it, and returns.
            return paletteIconManager.recolorRasterizedImage(
                icon: icon,
                targetColor: paletteColor.flatMap { UIKit.UIColor($0) } ?? .black,
                newColor: (color ?? theme.token.icon).flatMap { UIKit.UIColor($0) } ?? theme.uiToken.icon,
                size: size
            )
        }

        public var body: some View {
            Group {
                if let tintedImage {
                    SwiftUI.Image(uiImage: tintedImage)
                        .accessibilityLabel(icon.localization)
                } else {
                    SwiftUI.Color.clear
                        .accessibilityLabel(icon.localization)
                }
            }
                // Force the frame to match the target size
              .frame(width: size.value, height: size.value)
        }
    }
}

extension Warp.PaletteIconView {
    /// Applies a custom foreground color to the `IconView`.
    ///
    /// - Parameter color: The custom color to apply to the icon.
    /// - Returns: A new `IconView` with the updated color.
    public func foregroundColor(_ color: Color) -> Self {
        Warp.PaletteIconView(icon, size: size, paletteColor: paletteColor, color: color)
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
                Warp.PaletteIconView(.activeAds, size: .small, color: theme.token.iconPrimary)
                Warp.PaletteIconView(.ads, size: .default, color: theme.token.iconWarning)
                Warp.PaletteIconView(.airCon, size: .large, color: theme.token.iconNegative)
            }
              .padding()
        }
    }
}

