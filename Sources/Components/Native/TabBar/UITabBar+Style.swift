// Sources/Components/Native/TabBar/UITabBar+Style.swift
import UIKit

extension UITabBar {
    /// Configures the global UITabBar appearance proxy with Warp brand tokens.
    /// Call once at app launch if you want every UITabBar to pick this up automatically.
    ///
    /// Does NOT set `unselectedItemTintColor` — the compact-size-class rule cannot be
    /// applied through the proxy (UIAppearance has no trait-collection context).
    /// Use the instance `warpStyle()` for full styling including the compact rule.
    ///
    /// Also styles UITabBarItem badges via the appearance proxy.
    @MainActor
    public static func warpConfigureAppearanceProxy() {
        applyAppearanceTokens(to: UITabBar.appearance())
        UITabBarItem.warpConfigureBadgeAppearanceProxy()
    }

    /// Applies Warp tab bar styling to this instance, including the compact-size-class
    /// `unselectedItemTintColor` rule, and registers for trait changes to re-apply
    /// the rule when horizontalSizeClass changes (e.g. iPad rotation, multitasking).
    ///
    /// Pre-iOS 26: opaque bar, `backgroundColor = Warp.UIToken.background`,
    ///   `tintColor = Warp.UIColor.navbarIconSelected`.
    /// iOS 26+: selected text/icon color = `Warp.UIColor.navbarIconSelected` across
    ///   stacked, inline, and compactInline layouts; applied to both
    ///   `standardAppearance` and `scrollEdgeAppearance` (separate copies).
    /// All paths: `unselectedItemTintColor` = `Warp.UIToken.icon` when horizontal
    ///   size class is `.compact`, otherwise `nil` (system default).
    public func warpStyle() {
        Self.applyAppearanceTokens(to: self)
        Self.applyUnselectedTint(to: self)
        Self.registerTraitObserverIfNeeded(on: self)
    }

    // MARK: - Implementation

    private static func applyAppearanceTokens(to bar: UITabBar) {
        if #available(iOS 26, *) {
            let selected = Warp.UIColor.navbarIconSelected
            let standard = bar.standardAppearance.copy()
            for layout in [
                standard.stackedLayoutAppearance,
                standard.inlineLayoutAppearance,
                standard.compactInlineLayoutAppearance,
            ] {
                var attributes = layout.selected.titleTextAttributes
                attributes[.foregroundColor] = selected
                layout.selected.titleTextAttributes = attributes
                layout.selected.iconColor = selected
            }
            bar.standardAppearance = standard
            bar.scrollEdgeAppearance = standard.copy()  // distinct instance — avoid aliasing
        } else {
            bar.isTranslucent = false
            bar.backgroundColor = Warp.UIToken.background
            bar.tintColor = Warp.UIColor.navbarIconSelected
        }
    }

    private static func applyUnselectedTint(to bar: UITabBar) {
        bar.unselectedItemTintColor = (bar.traitCollection.horizontalSizeClass == .compact)
            ? Warp.UIToken.icon
            : nil
    }

    private static func registerTraitObserverIfNeeded(on bar: UITabBar) {
        guard !bar.hasWarpTraitRegistration else { return }
        bar.hasWarpTraitRegistration = true
        _ = bar.registerForTraitChanges([UITraitHorizontalSizeClass.self]) { (bar: UITabBar, _) in
            UITabBar.applyUnselectedTint(to: bar)
        }
    }
}

extension UITabBarController {
    /// Convenience — applies Warp styling to `self.tabBar`.
    public func warpStyle() {
        tabBar.warpStyle()
    }
}

// MARK: - Associated-object plumbing for trait-observer dedup

private extension UITabBar {
    nonisolated(unsafe) static var traitRegistrationKey: UInt8 = 0

    var hasWarpTraitRegistration: Bool {
        get { (objc_getAssociatedObject(self, &Self.traitRegistrationKey) as? Bool) ?? false }
        set { objc_setAssociatedObject(self, &Self.traitRegistrationKey, newValue, .OBJC_ASSOCIATION_RETAIN) }
    }
}
