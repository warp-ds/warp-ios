import SwiftUI
import XCTest
@testable import Warp

/// Tests for `Warp.ColorVariant` and the theme context that resolves it.
///
/// Colours are compared through `resolve(in:)` rather than `==`, because
/// `Color.dynamicColor` allocates a fresh provider on every call — two structurally
/// identical dynamic colours are never equal by identity.
///
/// No test here mutates the `Warp.Theme` global: suites run in parallel, so a global
/// write in one suite would surface as a flake in another.
final class ColorVariantTests: XCTestCase {
    private let light = EnvironmentValues()
    private var dark: EnvironmentValues = {
        var values = EnvironmentValues()
        values.colorScheme = .dark
        return values
    }()

    private func assertSameColor(
        _ lhs: Color,
        _ rhs: Color,
        _ message: String = "",
        file: StaticString = #filePath,
        line: UInt = #line
    ) {
        XCTAssertEqual(lhs.resolve(in: light), rhs.resolve(in: light), "light: \(message)", file: file, line: line)
        XCTAssertEqual(lhs.resolve(in: dark), rhs.resolve(in: dark), "dark: \(message)", file: file, line: line)
    }

    private func assertDifferentColor(
        _ lhs: Color,
        _ rhs: Color,
        _ message: String = "",
        file: StaticString = #filePath,
        line: UInt = #line
    ) {
        XCTAssertNotEqual(lhs.resolve(in: light), rhs.resolve(in: light), "light: \(message)", file: file, line: line)
    }

    // MARK: - The variant overrides only what it names

    func testPremium_OverridesTheThreeNamedTokens() {
        let stock = WarpThemeContext(brand: .finn)
        let premium = WarpThemeContext(brand: .finn, variant: .premium)

        assertDifferentColor(premium.token.backgroundPrimary, stock.token.backgroundPrimary)
        assertDifferentColor(premium.token.backgroundPrimaryHover, stock.token.backgroundPrimaryHover)
        assertDifferentColor(premium.token.backgroundPrimaryActive, stock.token.backgroundPrimaryActive)

        assertSameColor(premium.token.backgroundPrimary, Color.dynamicColor(
            defaultColor: FinnColors.gray900,
            darkModeColor: FinnColors.gray50
        ), "premium primary surface should be near-black on light, near-white on dark")
    }

    func testPremium_LeavesEveryOtherTokenAsTheBrandDefines() {
        let stock = WarpThemeContext(brand: .finn)
        let premium = WarpThemeContext(brand: .finn, variant: .premium)

        // A spread across the token families: text, links, surfaces, borders, icons,
        // and the semantic statuses. None of these are named by the variant.
        assertSameColor(premium.token.text, stock.token.text, "text")
        assertSameColor(premium.token.textSubtle, stock.token.textSubtle, "textSubtle")
        assertSameColor(premium.token.textInverted, stock.token.textInverted, "textInverted")
        assertSameColor(premium.token.textLink, stock.token.textLink, "links stay FINN blue by design")
        assertSameColor(premium.token.background, stock.token.background, "background")
        assertSameColor(premium.token.backgroundSubtle, stock.token.backgroundSubtle, "backgroundSubtle")
        assertSameColor(premium.token.border, stock.token.border, "border")
        assertSameColor(premium.token.icon, stock.token.icon, "icon")
        assertSameColor(premium.token.backgroundNegative, stock.token.backgroundNegative, "backgroundNegative")
        assertSameColor(premium.token.backgroundPositive, stock.token.backgroundPositive, "backgroundPositive")
    }

    // MARK: - A variant is not a brand

    func testPremium_PreservesBrandIdentity() {
        let premium = WarpThemeContext(brand: .finn, variant: .premium)

        XCTAssertEqual(premium.brand, .finn, "a variant layers colours; it must never change the brand")
        XCTAssertEqual(premium.description, Warp.Brand.finn.description)
    }

    func testVariant_ComposesWithAnyBrand() {
        let stockTori = WarpThemeContext(brand: .tori)
        let premiumTori = WarpThemeContext(brand: .tori, variant: .premium)

        XCTAssertEqual(premiumTori.brand, .tori)
        assertSameColor(premiumTori.token.text, stockTori.token.text, "Tori's own tokens still apply")
        assertDifferentColor(premiumTori.token.backgroundPrimary, stockTori.token.backgroundPrimary)
    }

    func testNoVariant_IsIdenticalToTheBrand() {
        let stock = WarpThemeContext(brand: .finn)
        let cleared = WarpThemeContext(brand: .finn, variant: nil)

        assertSameColor(cleared.token.backgroundPrimary, stock.token.backgroundPrimary)
        assertSameColor(cleared.token.text, stock.token.text)
    }

    // MARK: - Reach into component colours

    func testPremium_ReachesComponentColorsThatDeriveFromTokens() {
        let stock = WarpThemeContext(brand: .finn)
        let premium = WarpThemeContext(brand: .finn, variant: .premium)

        // `buttonPrimaryBackground` resolves to `token.backgroundPrimary` for FINN, so the
        // primary button picks the variant up without any change to the button itself.
        assertSameColor(
            premium.colors.buttonPrimaryBackground,
            premium.token.backgroundPrimary,
            "primary button background should follow the overridden token"
        )
        assertDifferentColor(premium.colors.buttonPrimaryBackground, stock.colors.buttonPrimaryBackground)

        assertSameColor(premium.colors.buttonPrimaryBackgroundHover, premium.token.backgroundPrimaryHover)
        assertSameColor(premium.colors.buttonPrimaryBackgroundActive, premium.token.backgroundPrimaryActive)
    }

    func testPremium_DoesNotReachComponentColorsThatHardcodeBrandValues() {
        let stock = WarpThemeContext(brand: .finn)
        let premium = WarpThemeContext(brand: .finn, variant: .premium)

        // Documents a real boundary rather than asserting the ideal: 21 of the 27 component
        // colours hardcode a raw brand colour instead of deriving from a token, so a variant
        // cannot reach them. For premium this is mostly desirable — a sponsored badge should
        // keep its brand colour — but it is the reason a variant is not a whole-surface reskin.
        assertSameColor(premium.colors.badgeSponsoredBackground, stock.colors.badgeSponsoredBackground)
        assertSameColor(premium.colors.calloutBackground, stock.colors.calloutBackground)
        assertSameColor(premium.colors.switchHandleBackground, stock.colors.switchHandleBackground)
    }

    // MARK: - Variant equality

    func testVariantsAreComparedByName() {
        XCTAssertEqual(Warp.ColorVariant.premium, Warp.ColorVariant.premium)
        XCTAssertEqual(Warp.ColorVariant.premium.name, "premium")
    }

    // MARK: - UIKit is deliberately untouched

    func testVariant_DoesNotAffectUIKitTokens() {
        let premium = WarpThemeContext(brand: .finn, variant: .premium)

        // Variants are scoped to a SwiftUI subtree; UIKit has no equivalent boundary, so
        // `uiToken` intentionally stays the brand's.
        //
        // Resolved against traits rather than compared directly: dynamic UIColors are
        // provider-backed and never equal by identity.
        for style in [UIUserInterfaceStyle.light, .dark] {
            let traits = UITraitCollection(userInterfaceStyle: style)
            XCTAssertEqual(
                premium.uiToken.backgroundPrimary.resolvedColor(with: traits),
                Warp.Brand.finn.uiToken.backgroundPrimary.resolvedColor(with: traits),
                "\(style)"
            )
        }
    }
}
