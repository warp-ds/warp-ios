import UIKit

extension UIBarButtonItem {

    /// Applies Warp design style to a bar button item for navigation bar placement.
    ///
    /// Styles the item with Warp colors and fonts. The primary style is rendered with the
    /// `.prominent` item style on iOS 26+, which gives it a glass appearance; below 26 that style
    /// does not exist, so `.done` stands in for it, matching what NMP already ships through
    /// `doneButtonAppearance`.
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
        switch style {
        case .default:
            self.style = .plain
            tintColor = Warp.UIColor.token.icon
            setTitleTextAttributes([
                .font: Warp.Typography.body.uiFont
            ], for: .normal)
            setTitleTextAttributes([
                .font: Warp.Typography.body.uiFont
            ], for: .highlighted)
        case .primary:
            if #available(iOS 26.0, *) {
                self.style = .prominent
            } else {
                self.style = .done
            }
            tintColor = Warp.UIColor.buttonPrimaryBackground
            setTitleTextAttributes([
                .font: Warp.Typography.title4.uiFont
            ], for: .normal)
            setTitleTextAttributes([
                .font: Warp.Typography.title4.uiFont
            ], for: .highlighted)
        }

        return self
    }
}
