// Sources/Components/Native/TabBar/UIImage+TabBarItem.swift
import UIKit

extension Warp {
    /// A tab bar item visual state — narrowly scoped to the two states a tab item meaningfully has.
    public enum TabBarItemState: Sendable {
        case normal
        case selected
    }
}

extension UIImage {
    /// Returns a copy of this image tinted with the Warp tab bar token appropriate for `state`.
    /// - `.normal`   → `Warp.UIToken.icon`
    /// - `.selected` → `Warp.UIColor.navbarIconSelected`
    /// Rendering mode is `.alwaysOriginal`.
    public func warpTabBarItemTinted(state: Warp.TabBarItemState) -> UIImage {
        let tint: UIColor = switch state {
        case .normal: Warp.UIToken.icon
        case .selected: Warp.UIColor.navbarIconSelected
        }
        return withTintColor(tint, renderingMode: .alwaysOriginal)
    }
}
