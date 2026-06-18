import SwiftUI

extension Button {

    /// Styling options for buttons displayed in a navigation bar (iOS 26+).
    public enum WarpBarButtonStyle {
        /// Default style for navigation bar buttons.
        /// Uses Warp's icon color for text and body typography. Suitable for secondary or action buttons.
        case `default`

        /// Primary style for navigation bar buttons.
        /// Uses Warp's primary background color with Liquid Glass prominent button style.
        /// Suitable for primary actions that require visual emphasis.
        case primary
    }

    /// Applies Warp design style to a button with Liquid Glass styling (iOS 26+).
    ///
    /// This modifier styles the button with the appropriate colors, fonts, and Liquid Glass effects for
    /// navigation bar placement. The primary style uses the `.glassProminent` button style for a glass appearance.
    ///
    /// **Availability:** iOS 26+. On earlier versions, this method returns the unmodified button.
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
        Group {
            if #available(iOS 26.0, *) {
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
            } else {
                self
            }
        }
    }
}
