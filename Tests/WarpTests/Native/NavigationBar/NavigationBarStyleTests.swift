import Testing
import UIKit
@testable import Warp

@Suite(.serialized) // Serialized because we're testing global appearance state
@MainActor
struct NavigationBarStyleTests {

    @Test
    func staticWarpLiquidGlassStyleShouldConfigureStandardAppearance() {
        guard #available(iOS 26.0, *) else {
            return // Skip test on iOS < 26
        }
        // When
        UINavigationBar.warpLiquidGlassStyle()

        // Then
        let appearance = UINavigationBar.appearance().standardAppearance

        // Verify transparent background
        #expect(appearance.backgroundEffect == nil)
        #expect(appearance.backgroundColor == nil)
        #expect(appearance.shadowColor == nil)
    }

    @Test
    func staticWarpLiquidGlassStyleShouldConfigureLargeTitleAttributes() {
        guard #available(iOS 26.0, *) else {
            return // Skip test on iOS < 26
        }

        // When
        UINavigationBar.warpLiquidGlassStyle()

        // Then
        let appearance = UINavigationBar.appearance().standardAppearance
        let attributes = appearance.largeTitleTextAttributes

        // Verify large title text color
        if let foregroundColor = attributes[.foregroundColor] as? UIColor {
            let traitCollection = UITraitCollection(userInterfaceStyle: .light)
            #expect(foregroundColor.resolvedColor(with: traitCollection) == Warp.UIColor.token.text.resolvedColor(with: traitCollection))
        }

        // Verify large title font
        if let font = attributes[.font] as? UIFont {
            #expect(font == Warp.Typography.title1.uiFont)
        }
    }

    @Test
    func staticWarpLiquidGlassStyleShouldConfigureTitleAttributes() {
        guard #available(iOS 26.0, *) else {
            return // Skip test on iOS < 26
        }

        // When
        UINavigationBar.warpLiquidGlassStyle()

        // Then
        let appearance = UINavigationBar.appearance().standardAppearance
        let attributes = appearance.titleTextAttributes

        // Verify title text color
        if let foregroundColor = attributes[.foregroundColor] as? UIColor {
            let traitCollection = UITraitCollection(userInterfaceStyle: .light)
            #expect(foregroundColor.resolvedColor(with: traitCollection) == Warp.UIColor.token.text.resolvedColor(with: traitCollection))
        }

        // Verify title font
        if let font = attributes[.font] as? UIFont {
            #expect(font == Warp.Typography.title4.uiFont)
        }
    }

    @Test
    func staticWarpLiquidGlassStyleShouldConfigureSubtitleAttributes() {
        guard #available(iOS 26.0, *) else {
            return // Skip test on iOS < 26
        }

        // When
        UINavigationBar.warpLiquidGlassStyle()

        // Then
        let appearance = UINavigationBar.appearance().standardAppearance
        let attributes = appearance.subtitleTextAttributes

        // Verify subtitle text color
        if let foregroundColor = attributes[.foregroundColor] as? UIColor {
            let traitCollection = UITraitCollection(userInterfaceStyle: .light)
            #expect(foregroundColor.resolvedColor(with: traitCollection) == Warp.UIColor.token.textSubtle.resolvedColor(with: traitCollection))
        }

        // Verify subtitle font
        if let font = attributes[.font] as? UIFont {
            #expect(font == Warp.Typography.title6.uiFont)
        }
    }

    @Test
    func staticWarpLiquidGlassStyleShouldConfigureBackIndicator() {
        guard #available(iOS 26.0, *) else {
            return // Skip test on iOS < 26
        }

        // When
        UINavigationBar.warpLiquidGlassStyle()

        // Then
        let appearance = UINavigationBar.appearance().standardAppearance
        let expectedImage = Warp.Icon.chevronLeft.uiImage

        #expect(appearance.backIndicatorImage == expectedImage)
        #expect(appearance.backIndicatorTransitionMaskImage == expectedImage)
    }

    @Test
    func staticWarpLiquidGlassStyleShouldConfigureButtonAppearance() {
        guard #available(iOS 26.0, *) else {
            return // Skip test on iOS < 26
        }

        // When
        UINavigationBar.warpLiquidGlassStyle()

        // Then
        let appearance = UINavigationBar.appearance().standardAppearance
        let buttonAppearance = appearance.buttonAppearance
        let normalAttributes = buttonAppearance.normal.titleTextAttributes

        // Verify button text color
        if let foregroundColor = normalAttributes[.foregroundColor] as? UIColor {
            let traitCollection = UITraitCollection(userInterfaceStyle: .light)
            #expect(foregroundColor.resolvedColor(with: traitCollection) == Warp.UIColor.token.text.resolvedColor(with: traitCollection))
        }

        // Verify button font
        if let font = normalAttributes[.font] as? UIFont {
            #expect(font == Warp.Typography.body.uiFont)
        }
    }

    @Test
    func staticWarpLiquidGlassStyleShouldConfigureTintColor() {
        guard #available(iOS 26.0, *) else {
            return // Skip test on iOS < 26
        }

        // When
        UINavigationBar.warpLiquidGlassStyle()

        // Then
        let tintColor = UINavigationBar.appearance().tintColor
        let expectedTint = Warp.UIColor.token.icon

        let traitCollection = UITraitCollection(userInterfaceStyle: .light)
        #expect(tintColor?.resolvedColor(with: traitCollection) == expectedTint.resolvedColor(with: traitCollection))
    }

    @Test
    func staticWarpLiquidGlassStyleShouldConfigureCompactAppearance() {
        guard #available(iOS 26.0, *) else {
            return // Skip test on iOS < 26
        }

        // When
        UINavigationBar.warpLiquidGlassStyle()

        // Then
        let appearance = UINavigationBar.appearance().compactAppearance

        // Verify compact appearance is configured the same as standard
        #expect(appearance?.backgroundEffect == nil)
        #expect(appearance?.backgroundColor == nil)
        #expect(appearance?.shadowColor == nil)
    }

    @Test
    func staticWarpLiquidGlassStyleShouldConfigureScrollEdgeAppearance() {
        guard #available(iOS 26.0, *) else {
            return // Skip test on iOS < 26
        }

        // When
        UINavigationBar.warpLiquidGlassStyle()

        // Then
        let appearance = UINavigationBar.appearance().scrollEdgeAppearance

        // Verify scroll edge appearance is configured the same as standard
        #expect(appearance?.backgroundEffect == nil)
        #expect(appearance?.backgroundColor == nil)
        #expect(appearance?.shadowColor == nil)
    }

    // MARK: - Instance method tests

    @Test
    func instanceWarpLiquidGlassStyleShouldConfigureStandardAppearance() {
        guard #available(iOS 26.0, *) else {
            return // Skip test on iOS < 26
        }

        // Given
        let navigationBar = UINavigationBar()

        // When
        navigationBar.warpLiquidGlassStyle()

        // Then
        let appearance = navigationBar.standardAppearance

        // Verify transparent background
        #expect(appearance.backgroundEffect == nil)
        #expect(appearance.backgroundColor == nil)
        #expect(appearance.shadowColor == nil)
    }

    @Test
    func instanceWarpLiquidGlassStyleShouldConfigureLargeTitleAttributes() {
        guard #available(iOS 26.0, *) else {
            return // Skip test on iOS < 26
        }

        // Given
        let navigationBar = UINavigationBar()

        // When
        navigationBar.warpLiquidGlassStyle()

        // Then
        let appearance = navigationBar.standardAppearance
        let attributes = appearance.largeTitleTextAttributes

        // Verify large title font
        if let font = attributes[.font] as? UIFont {
            #expect(font == Warp.Typography.title1.uiFont)
        }
    }

    @Test
    func instanceWarpLiquidGlassStyleShouldConfigureTitleAttributes() {
        guard #available(iOS 26.0, *) else {
            return // Skip test on iOS < 26
        }

        // Given
        let navigationBar = UINavigationBar()

        // When
        navigationBar.warpLiquidGlassStyle()

        // Then
        let appearance = navigationBar.standardAppearance
        let attributes = appearance.titleTextAttributes

        // Verify title font
        if let font = attributes[.font] as? UIFont {
            #expect(font == Warp.Typography.title4.uiFont)
        }
    }

    @Test
    func instanceWarpLiquidGlassStyleShouldConfigureSubtitleAttributes() {
        guard #available(iOS 26.0, *) else {
            return // Skip test on iOS < 26
        }

        // Given
        let navigationBar = UINavigationBar()

        // When
        navigationBar.warpLiquidGlassStyle()

        // Then
        let appearance = navigationBar.standardAppearance
        let attributes = appearance.subtitleTextAttributes

        // Verify subtitle font
        if let font = attributes[.font] as? UIFont {
            #expect(font == Warp.Typography.title6.uiFont)
        }
    }

    @Test
    func instanceWarpLiquidGlassStyleShouldConfigureCompactAppearance() {
        guard #available(iOS 26.0, *) else {
            return // Skip test on iOS < 26
        }

        // Given
        let navigationBar = UINavigationBar()

        // When
        navigationBar.warpLiquidGlassStyle()

        // Then
        let appearance = navigationBar.compactAppearance

        // Verify compact appearance is configured
        #expect(appearance?.backgroundEffect == nil)
        #expect(appearance?.backgroundColor == nil)
        #expect(appearance?.shadowColor == nil)
    }

    @Test
    func instanceWarpLiquidGlassStyleShouldConfigureScrollEdgeAppearance() {
        guard #available(iOS 26.0, *) else {
            return // Skip test on iOS < 26
        }

        // Given
        let navigationBar = UINavigationBar()

        // When
        navigationBar.warpLiquidGlassStyle()

        // Then
        let appearance = navigationBar.scrollEdgeAppearance

        // Verify scroll edge appearance is configured
        #expect(appearance?.backgroundEffect == nil)
        #expect(appearance?.backgroundColor == nil)
        #expect(appearance?.shadowColor == nil)
    }

    // MARK: - UINavigationController convenience method tests

    @Test
    func navigationControllerWarpLiquidGlassStyleShouldConfigureNavigationBar() {
        guard #available(iOS 26.0, *) else {
            return // Skip test on iOS < 26
        }

        // Given
        let navigationController = UINavigationController()

        // When
        navigationController.warpLiquidGlassStyle()

        // Then
        let appearance = navigationController.navigationBar.standardAppearance

        // Verify navigation bar appearance is configured
        #expect(appearance.backgroundEffect == nil)
        #expect(appearance.backgroundColor == nil)
        #expect(appearance.shadowColor == nil)
    }

    @Test
    func navigationControllerWarpLiquidGlassStyleShouldEnableExtendedLayout() {
        guard #available(iOS 26.0, *) else {
            return // Skip test on iOS < 26
        }

        // Given
        let navigationController = UINavigationController()

        // When
        navigationController.warpLiquidGlassStyle()

        // Then
        #expect(navigationController.extendedLayoutIncludesOpaqueBars == true)
    }

    @Test
    func navigationControllerWarpLiquidGlassStyleShouldConfigureTitleAttributes() {
        guard #available(iOS 26.0, *) else {
            return // Skip test on iOS < 26
        }

        // Given
        let navigationController = UINavigationController()

        // When
        navigationController.warpLiquidGlassStyle()

        // Then
        let appearance = navigationController.navigationBar.standardAppearance
        let attributes = appearance.titleTextAttributes

        // Verify title font
        if let font = attributes[.font] as? UIFont {
            #expect(font == Warp.Typography.title4.uiFont)
        }
    }
}
