import SwiftUI

extension Button {

    public enum WarpBarButtonStyle {
        /// Default style for navigation bar buttons, using Warp's icon color and body typography.
        case `default`
        /// Primary style for navigation bar buttons, using Warp's primary style and Apple prominent glass style.
        case primary
    }

    /// Applies Warp design style to the button, making it suitable for use in a navigation bar.
    ///
    /// - Parameter style: The style to apply to the button. Defaults to `.default`.
    /// - Returns: Itself
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
