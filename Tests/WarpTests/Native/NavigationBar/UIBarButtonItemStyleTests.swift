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

    // MARK: - Backward Compatibility Tests

    @Test
    func shouldDoNothingOnPreiOS26() {
        // Note: This test runs on all iOS versions to verify the availability guard works
        // Given
        let barButtonItem = UIBarButtonItem(title: "Test", style: .plain, target: nil, action: nil)
        let originalTintColor = barButtonItem.tintColor

        // When
        barButtonItem.warpNavigationBarButton(style: .primary)

        // Then - on iOS < 26, nothing should change
        if #available(iOS 26.0, *) {
            // On iOS 26+, tint color should be set
            #expect(barButtonItem.tintColor != originalTintColor)
        } else {
            // On iOS < 26, tint color should remain unchanged
            #expect(barButtonItem.tintColor == originalTintColor)
        }
    }
}
