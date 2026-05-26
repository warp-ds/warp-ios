import SwiftUI

extension Button {

    /// Styling options for buttons displayed in a navigation bar.
    public enum WarpBarButtonStyle {
        /// Default style for navigation bar buttons.
        /// Uses Warp's icon color for text and body typography. Suitable for secondary or action buttons.
        case `default`

        /// Primary style for navigation bar buttons.
        /// Uses Warp's primary background color with Apple's glass prominent button style (iOS 26+).
        /// Suitable for primary actions that require visual emphasis.
        case primary
    }

    /// Applies Warp design style to a button, making it suitable for use in a navigation bar.
    ///
    /// This modifier styles the button with the appropriate colors, fonts, and effects for navigation bar placement.
    /// On iOS 26+, the primary style uses the `.glassProminent` button style for a liquid glass appearance.
    /// On earlier iOS versions, the styling is applied without glass effects.
    ///
    /// **Usage:**
    ///
    /// ```swift
    /// Button(action: { /* action */ }) {
    ///     Label("Save", systemImage: "checkmark")
    /// }
    /// .warpNavigationBarButton(style: .primary)
    /// ```
    ///
    /// - Parameter style: The style to apply to the button. Defaults to `.default`.
    /// - Returns: A button with Warp navigation bar styling applied.
    public func warpNavigationBarButton(style: WarpBarButtonStyle = .default) -> some View {
        if #available(iOS 26.0, *) {
            return Group {
                switch style {
                case .default:
                    self
                      .tint(Warp.Color.token.icon)
                      .font(Warp.Typography.body.font)
                case .primary:
                    self
                      .buttonStyle(.glassProminent)
                      .tint(Warp.Color.buttonPrimaryBackground)
                      .font(Warp.Typography.body.font)
                }
            }
        }
        return self
    }
}
