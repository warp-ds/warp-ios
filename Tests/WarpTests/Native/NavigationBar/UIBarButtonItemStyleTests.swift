import Testing
import UIKit
@testable import Warp

@Suite(.serialized)
@MainActor
struct UIBarButtonItemStyleTests {

    // MARK: - Default Style Tests

    @Test
    func defaultStyleShouldSetTintColor() {
        guard #available(iOS 26.0, *) else {
            return
        }

        // Given
        let barButtonItem = UIBarButtonItem(title: "Test", style: .plain, target: nil, action: nil)

        // When
        barButtonItem.warpNavigationBarButton(style: .default)

        // Then
        let expectedTint = Warp.UIColor.token.icon
        let traitCollection = UITraitCollection(userInterfaceStyle: .light)
        #expect(barButtonItem.tintColor?.resolvedColor(with: traitCollection) == expectedTint.resolvedColor(with: traitCollection))
    }

    @Test
    func defaultStyleShouldSetNormalTitleAttributes() {
        guard #available(iOS 26.0, *) else {
            return
        }

        // Given
        let barButtonItem = UIBarButtonItem(title: "Test", style: .plain, target: nil, action: nil)

        // When
        barButtonItem.warpNavigationBarButton(style: .default)

        // Then
        let attributes = barButtonItem.titleTextAttributes(for: .normal)

        // Verify text color
        if let foregroundColor = attributes?[.foregroundColor] as? UIColor {
            let traitCollection = UITraitCollection(userInterfaceStyle: .light)
            #expect(foregroundColor.resolvedColor(with: traitCollection) == Warp.UIColor.token.text.resolvedColor(with: traitCollection))
        }

        // Verify font
        if let font = attributes?[.font] as? UIFont {
            #expect(font == Warp.Typography.body.uiFont)
        }
    }

    @Test
    func defaultStyleShouldSetHighlightedTitleAttributes() {
        guard #available(iOS 26.0, *) else {
            return
        }

        // Given
        let barButtonItem = UIBarButtonItem(title: "Test", style: .plain, target: nil, action: nil)

        // When
        barButtonItem.warpNavigationBarButton(style: .default)

        // Then
        let attributes = barButtonItem.titleTextAttributes(for: .highlighted)

        // Verify text color
        if let foregroundColor = attributes?[.foregroundColor] as? UIColor {
            let traitCollection = UITraitCollection(userInterfaceStyle: .light)
            #expect(foregroundColor.resolvedColor(with: traitCollection) == Warp.UIColor.token.text.resolvedColor(with: traitCollection))
        }

        // Verify font
        if let font = attributes?[.font] as? UIFont {
            #expect(font == Warp.Typography.body.uiFont)
        }
    }

    // MARK: - Primary Style Tests

    @Test
    func primaryStyleShouldSetProminentStyle() {
        guard #available(iOS 26.0, *) else {
            return
        }

        // Given
        let barButtonItem = UIBarButtonItem(title: "Test", style: .plain, target: nil, action: nil)

        // When
        barButtonItem.warpNavigationBarButton(style: .primary)

        // Then
        #expect(barButtonItem.style == .prominent)
    }

    @Test
    func primaryStyleShouldSetPrimaryTintColor() {
        guard #available(iOS 26.0, *) else {
            return
        }

        // Given
        let barButtonItem = UIBarButtonItem(title: "Test", style: .plain, target: nil, action: nil)

        // When
        barButtonItem.warpNavigationBarButton(style: .primary)

        // Then
        let expectedTint = Warp.UIColor.buttonPrimaryBackground
        let traitCollection = UITraitCollection(userInterfaceStyle: .light)
        #expect(barButtonItem.tintColor?.resolvedColor(with: traitCollection) == expectedTint.resolvedColor(with: traitCollection))
    }

    @Test
    func primaryStyleShouldSetNormalTitleAttributes() {
        guard #available(iOS 26.0, *) else {
            return
        }

        // Given
        let barButtonItem = UIBarButtonItem(title: "Test", style: .plain, target: nil, action: nil)

        // When
        barButtonItem.warpNavigationBarButton(style: .primary)

        // Then
        let attributes = barButtonItem.titleTextAttributes(for: .normal)

        // Verify text color
        if let foregroundColor = attributes?[.foregroundColor] as? UIColor {
            let traitCollection = UITraitCollection(userInterfaceStyle: .light)
            #expect(foregroundColor.resolvedColor(with: traitCollection) == Warp.UIColor.token.text.resolvedColor(with: traitCollection))
        }

        // Verify font
        if let font = attributes?[.font] as? UIFont {
            #expect(font == Warp.Typography.title4.uiFont)
        }
    }

    @Test
    func primaryStyleShouldSetHighlightedTitleAttributes() {
        guard #available(iOS 26.0, *) else {
            return
        }

        // Given
        let barButtonItem = UIBarButtonItem(title: "Test", style: .plain, target: nil, action: nil)

        // When
        barButtonItem.warpNavigationBarButton(style: .primary)

        // Then
        let attributes = barButtonItem.titleTextAttributes(for: .highlighted)

        // Verify text color
        if let foregroundColor = attributes?[.foregroundColor] as? UIColor {
            let traitCollection = UITraitCollection(userInterfaceStyle: .light)
            #expect(foregroundColor.resolvedColor(with: traitCollection) == Warp.UIColor.token.text.resolvedColor(with: traitCollection))
        }

        // Verify font
        if let font = attributes?[.font] as? UIFont {
            #expect(font == Warp.Typography.title4.uiFont)
        }
    }

    // MARK: - Method Chaining Tests

    @Test
    func warpNavigationBarButtonShouldReturnSelf() {
        guard #available(iOS 26.0, *) else {
            return
        }

        // Given
        let barButtonItem = UIBarButtonItem(title: "Test", style: .plain, target: nil, action: nil)

        // When
        let result = barButtonItem.warpNavigationBarButton(style: .default)

        // Then
        #expect(result === barButtonItem)
    }

    // MARK: - Cross-version behaviour

    /// This used to assert the opposite: that below iOS 26 the modifier left the item untouched.
    /// That was the bug, not the contract - the package supports iOS 18, so a Warp API that
    /// silently does nothing there is broken. Now the item is styled on every supported version,
    /// and only the prominence spelling differs.
    @Test
    func shouldStyleTheItemOnEveryOSVersion() {
        // Given
        let barButtonItem = UIBarButtonItem(title: "Test", style: .plain, target: nil, action: nil)
        let originalTintColor = barButtonItem.tintColor

        // When
        barButtonItem.warpNavigationBarButton(style: .primary)

        // Then
        #expect(barButtonItem.tintColor != originalTintColor)

        if #available(iOS 26.0, *) {
            #expect(barButtonItem.style == .prominent)
        } else {
            #expect(barButtonItem.style == .done)
        }
    }
}
