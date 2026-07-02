import UIKit

extension UIBarButtonItem {

    /// Applies Warp design style to a bar button item with Liquid Glass styling (iOS 26+).
    ///
    /// This method styles the bar button item with the appropriate colors, fonts, and Liquid Glass effects
    /// for navigation bar placement. The primary style uses the `.prominent` button item style for a glass appearance.
    /// The method configures appearance for both normal and highlighted states.
    ///
    /// **Availability:** iOS 26+. On earlier versions, this method returns self unmodified.
    ///
    /// **Usage:**
    ///
    /// ```swift
    /// let saveButton = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(save))
    /// saveButton.warpNavigationBarButton(style: .primary)
    /// navigationItem.rightBarButtonItem = saveButton
    /// ```
    ///
    /// - Parameter style: The style to apply to the bar button item. Defaults to `.default`.
    /// - Returns: Self to support method chaining.
    @discardableResult
    public func warpNavigationBarButton(style: Warp.NavigationBarButtonStyle = .default) -> Self {
        guard #available(iOS 26.0, *) else { return self }

        let tint = Warp.UIColor.token.icon
        let primaryTint = Warp.UIColor.buttonPrimaryBackground

        switch style {
        case .default:
            self.style = .plain
            tintColor = tint
            setTitleTextAttributes([
                .foregroundColor: Warp.UIColor.token.text,
                .font: Warp.Typography.body.uiFont
            ], for: .normal)
            setTitleTextAttributes([
                .foregroundColor: Warp.UIColor.token.text,
                .font: Warp.Typography.body.uiFont
            ], for: .highlighted)
        case .primary:
            self.style = .prominent
            tintColor = primaryTint
            setTitleTextAttributes([
                .foregroundColor: Warp.UIColor.token.text,
                .font: Warp.Typography.title4.uiFont
            ], for: .normal)
            setTitleTextAttributes([
                .foregroundColor: Warp.UIColor.token.text,
                .font: Warp.Typography.title4.uiFont
            ], for: .highlighted)
        }

        return self
    }
}
