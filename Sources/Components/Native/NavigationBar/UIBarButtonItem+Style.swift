//
// Created by Łukasz Śliwa on 26/02/2026.
//

import UIKit

extension UIBarButtonItem {

    public enum WarpBarButtonStyle {
        /// Default style for navigation bar buttons, using Warp's icon color and body typography.
        case `default`
        /// Primary style for navigation bar buttons, using Warp's primary style and Apple prominent glass style.
        case primary
    }

    /// Applies Warp design style to the bar button item, making it suitable for use in a navigation bar.
    ///
    /// - Parameter style: The style to apply to the bar button item. Defaults to `.default`.
    /// - Returns: Itself
    @discardableResult
    public func warpNavigationBarButton(style: WarpBarButtonStyle = .default) -> Self {
        let tint = Warp.UIColor.token.icon
        let primaryTint = Warp.UIColor.buttonPrimaryBackground
        if #available(iOS 26.0, *) {
            switch style {
            case .default:
                tintColor = tint
                setTitleTextAttributes([.foregroundColor: Warp.UIColor.token.text], for: .normal)
                setTitleTextAttributes([.font: Warp.Typography.body.uiFont], for: .normal)
                setTitleTextAttributes([.font: Warp.Typography.body.uiFont], for: .highlighted)
            case .primary:
                self.style = .prominent
                tintColor = primaryTint
                setTitleTextAttributes([.foregroundColor: Warp.UIColor.token.text], for: .normal)
                setTitleTextAttributes([.font: Warp.Typography.body.uiFont], for: .normal)
                setTitleTextAttributes([.font: Warp.Typography.body.uiFont], for: .highlighted)
            }
        }
        return self
    }
}
