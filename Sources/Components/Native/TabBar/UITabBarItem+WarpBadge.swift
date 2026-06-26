// Sources/Components/Native/TabBar/UITabBarItem+WarpBadge.swift
import UIKit

public extension UITabBarItem {
    /// Sets a numeric badge on this tab item, Warp-styled.
    /// Counts above `max` render as "\(max)+" (e.g. 150 → "99+").
    /// Counts of 0 or less clear the badge.
    func warpSetBadge(count: Int, max: Int = 99) {
        guard count > 0 else {
            warpClearBadge()
            return
        }
        badgeValue = count > max ? "\(max)+" : "\(count)"
        applyWarpBadgeAppearance()
        let format = NSLocalizedString("warp.tabBarBadge.unreadCount", bundle: .module, comment: "")
        accessibilityValue = String.localizedStringWithFormat(format, count)
    }

    /// Sets a dot/presence badge (rendered as the bullet "•"), Warp-styled.
    func warpSetBadgeDot() {
        badgeValue = "•"
        applyWarpBadgeAppearance()
        accessibilityValue = NSLocalizedString("warp.tabBarBadge.newNotification", bundle: .module, comment: "")
    }

    /// Removes any badge from this tab item (clears value + accessibility).
    /// Appearance attributes (`badgeColor` / text attributes) are left untouched —
    /// they are no-ops while `badgeValue` is `nil`, and the global appearance proxy
    /// governs styling for any badge set later directly via `badgeValue`.
    func warpClearBadge() {
        badgeValue = nil
        accessibilityValue = nil
    }

    /// Sets the item's normal + selected images from one base image, tinted with
    /// the Warp tab-bar tokens (`Warp.UIToken.icon` / `Warp.UIColor.navbarIconSelected`).
    func warpConfigureImages(_ base: UIImage) {
        image = base.warpTabBarItemTinted(state: .normal)
        selectedImage = base.warpTabBarItemTinted(state: .selected)
    }
}

extension UITabBarItem {
    /// Warp badge text attributes (text on the notification background, Warp typography).
    /// The font is already Dynamic-Type-scaled by `Warp.Typography`.
    static var warpBadgeTextAttributes: [NSAttributedString.Key: Any] {
        [
            .foregroundColor: Warp.UIToken.textInvertedStatic,
            .font: Warp.Typography.detailStrong.uiFont,
        ]
    }

    /// Applies Warp badge color + text attributes to THIS item.
    func applyWarpBadgeAppearance() {
        badgeColor = Warp.UIToken.backgroundNotification
        setBadgeTextAttributes(Self.warpBadgeTextAttributes, for: .normal)
    }

    /// Applies Warp badge styling to the global `UITabBarItem.appearance()` proxy,
    /// so badges set directly via `badgeValue` (without the helpers) are also styled.
    /// Called from `UITabBar.warpConfigureAppearanceProxy()`.
    @MainActor
    static func warpConfigureBadgeAppearanceProxy() {
        let proxy = UITabBarItem.appearance()
        proxy.badgeColor = Warp.UIToken.backgroundNotification
        proxy.setBadgeTextAttributes(warpBadgeTextAttributes, for: .normal)
    }
}
