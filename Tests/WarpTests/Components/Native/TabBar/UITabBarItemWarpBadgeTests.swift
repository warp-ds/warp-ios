// Tests/WarpTests/Components/Native/TabBar/UITabBarItemWarpBadgeTests.swift
import Testing
import UIKit
@testable import Warp

@Suite @MainActor
struct UITabBarItemWarpBadgeTests {

    /// Resolve a (possibly dynamic) UIColor to a concrete color so `==` is reliable.
    /// Warp tokens are dynamic colors; two separate token calls have different
    /// providers and are never `==`, but their resolved concrete colors match.
    private func resolved(_ color: UIColor?) -> UIColor? {
        color?.resolvedColor(with: UITraitCollection(userInterfaceStyle: .light))
    }

    @Test
    func setBadgeBelowMaxShowsExactCount() {
        let item = UITabBarItem()
        item.warpSetBadge(count: 5)
        #expect(item.badgeValue == "5")
    }

    @Test
    func setBadgeAtMaxShowsExactCount() {
        let item = UITabBarItem()
        item.warpSetBadge(count: 99)
        #expect(item.badgeValue == "99")
    }

    @Test
    func setBadgeAboveMaxIsCapped() {
        let item = UITabBarItem()
        item.warpSetBadge(count: 150)
        #expect(item.badgeValue == "99+")
    }

    @Test
    func setBadgeRespectsCustomMax() {
        let item = UITabBarItem()
        item.warpSetBadge(count: 10, max: 9)
        #expect(item.badgeValue == "9+")
    }

    @Test
    func setBadgeDotShowsBullet() {
        let item = UITabBarItem()
        item.warpSetBadgeDot()
        #expect(item.badgeValue == "•")
    }

    @Test
    func clearBadgeRemovesValue() {
        let item = UITabBarItem()
        item.warpSetBadge(count: 3)
        item.warpClearBadge()
        #expect(item.badgeValue == nil)
        #expect(item.accessibilityValue == nil)
    }

    @Test
    func setBadgeAppliesWarpStyling() {
        Warp.Theme = .finn
        let item = UITabBarItem()
        item.warpSetBadge(count: 3)
        #expect(resolved(item.badgeColor) == resolved(Warp.UIToken.backgroundNotification))
        let attrs = item.badgeTextAttributes(for: .normal)
        #expect(resolved(attrs?[.foregroundColor] as? UIColor) == resolved(Warp.UIToken.textInvertedStatic))
        #expect((attrs?[.font] as? UIFont)?.fontName == Warp.Typography.detailStrong.uiFont.fontName)
    }

    @Test
    func setBadgeWithNonPositiveCountClearsBadge() {
        let item = UITabBarItem()
        item.warpSetBadge(count: 7)   // establish a badge first
        item.warpSetBadge(count: 0)
        #expect(item.badgeValue == nil)

        item.warpSetBadge(count: 5)
        item.warpSetBadge(count: -3)
        #expect(item.badgeValue == nil)
    }

    @Test
    func appearanceProxyConfiguresBadgeStyling() {
        Warp.Theme = .finn
        UITabBar.warpConfigureAppearanceProxy()
        let proxy = UITabBarItem.appearance()
        #expect(resolved(proxy.badgeColor) == resolved(Warp.UIToken.backgroundNotification))
        let attrs = proxy.badgeTextAttributes(for: .normal)
        #expect(resolved(attrs?[.foregroundColor] as? UIColor) == resolved(Warp.UIToken.textInvertedStatic))
    }

    @Test
    func configureImagesSetsBothTintedStates() {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 1, height: 1))
        let base = renderer.image { ctx in
            UIColor.white.setFill(); ctx.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        }.withRenderingMode(.alwaysTemplate)

        let item = UITabBarItem()
        item.warpConfigureImages(base)

        #expect(item.image != nil)
        #expect(item.selectedImage != nil)
        // The two states use different tokens, so the rendered images must differ.
        #expect(item.image !== item.selectedImage)
    }

    @Test
    func badgeSetsLocalizedAccessibility() {
        let item = UITabBarItem()
        item.warpSetBadge(count: 3)
        #expect(item.accessibilityValue == "3 unread")

        item.warpSetBadgeDot()
        #expect(item.accessibilityValue == "new notification")

        item.warpClearBadge()
        #expect(item.accessibilityValue == nil)
    }
}
