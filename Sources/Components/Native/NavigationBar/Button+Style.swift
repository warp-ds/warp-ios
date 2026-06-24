import SwiftUI

extension Button {

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
    public func warpNavigationBarButton(style: Warp.NavigationBarButtonStyle = .default) -> some View {
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
