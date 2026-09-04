import Testing
import SwiftUI
@testable import Warp

@Suite(.serialized) // Serialized because we're reading the global `Warp.Theme` token provider.
@MainActor
struct SheetStyleModifierTests {

    /// Token colors are built with `Color.dynamicColor`, which mints a fresh provider-backed
    /// instance on every access, so two reads of the same token are never `==`. Comparing the
    /// resolved components in both interface styles checks what actually matters.
    private func components(_ color: Color?) -> [[CGFloat]]? {
        guard let color else { return nil }
        return [UIUserInterfaceStyle.light, .dark].map { style in
            let resolved = UIColor(color).resolvedColor(with: UITraitCollection(userInterfaceStyle: style))
            var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
            resolved.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
            return [red, green, blue, alpha]
        }
    }

    // MARK: - Detents

    @Test
    func mediumStyleOffersMediumAndLargeDetents() {
        #expect(Warp.SheetStyle.medium.detents == [.medium, .large])
    }

    @Test
    func fullScreenStyleOffersLargeDetentOnly() {
        #expect(Warp.SheetStyle.fullScreen.detents == [.large])
    }

    // MARK: - Glass eligibility

    /// Measured on simulators, with no `presentationBackground` applied: on iOS 26 a `.medium`
    /// detent renders as Liquid Glass and the same sheet turns fully opaque once it reaches
    /// `.large`. A `.fullScreen` sheet only has the large detent, so it never has a glass state.
    @Test
    func onlyTheMediumStyleCanEverRenderAsGlass() {
        #expect(Warp.SheetStyle.medium.mayRenderAsGlass)
        #expect(!Warp.SheetStyle.fullScreen.mayRenderAsGlass)
    }

    // MARK: - Background resolution

    /// `.medium` can reach the glass appearance, so `.automatic` must hand back `nil` and let the
    /// system make the per-detent call rather than pinning a color and killing the glass.
    @Test
    func automaticBackgroundDefersToSystemForMediumWhenLiquidGlassIsAvailable() {
        let resolved = Warp.SheetBackground.automatic.resolvedColor(
            token: Warp.Theme.token,
            style: .medium,
            supportsLiquidGlass: true,
            nativeGlassEffectsEnabled: true
        )

        #expect(resolved == nil)
    }

    /// A full-screen sheet is opaque on every OS, so deferring to the system would only mean
    /// taking Apple's color instead of the brand's. Visible in dark mode, where the system uses
    /// `#1c1c1e` and `surfaceElevated100` is `#26262b`.
    @Test
    func automaticBackgroundUsesTheTokenForFullScreenEvenWithLiquidGlass() {
        let token = Warp.Theme.token

        let resolved = Warp.SheetBackground.automatic.resolvedColor(
            token: token,
            style: .fullScreen,
            supportsLiquidGlass: true,
            nativeGlassEffectsEnabled: true
        )

        #expect(components(resolved) == components(token.surfaceElevated100))
    }

    @Test(arguments: [Warp.SheetStyle.medium, .fullScreen])
    func automaticBackgroundFallsBackToTokenBelowLiquidGlass(style: Warp.SheetStyle) {
        let token = Warp.Theme.token

        let resolved = Warp.SheetBackground.automatic.resolvedColor(
            token: token,
            style: style,
            supportsLiquidGlass: false,
            nativeGlassEffectsEnabled: true
        )

        #expect(components(resolved) == components(token.surfaceElevated100))
    }

    /// Offscreen snapshot hosts cannot rasterize native Liquid Glass, so disabling it must force
    /// the opaque fallback even on an OS that supports glass.
    @Test
    func automaticBackgroundFallsBackToTokenWhenGlassEffectsAreDisabled() {
        let token = Warp.Theme.token

        let resolved = Warp.SheetBackground.automatic.resolvedColor(
            token: token,
            style: .medium,
            supportsLiquidGlass: true,
            nativeGlassEffectsEnabled: false
        )

        #expect(components(resolved) == components(token.surfaceElevated100))
    }

    @Test(arguments: [Warp.SheetStyle.medium, .fullScreen])
    func solidBackgroundIsOpaqueRegardlessOfLiquidGlassSupport(style: Warp.SheetStyle) {
        let token = Warp.Theme.token

        for supportsLiquidGlass in [true, false] {
            let resolved = Warp.SheetBackground.solid.resolvedColor(
                token: token,
                style: style,
                supportsLiquidGlass: supportsLiquidGlass,
                nativeGlassEffectsEnabled: true
            )

            #expect(components(resolved) == components(token.surfaceElevated100))
        }
    }

    @Test
    func colorBackgroundUsesTheSuppliedColor() {
        let resolved = Warp.SheetBackground.color(.red).resolvedColor(
            token: Warp.Theme.token,
            style: .medium,
            supportsLiquidGlass: true,
            nativeGlassEffectsEnabled: true
        )

        #expect(components(resolved) == components(.red))
    }

    @Test
    func noneBackgroundLeavesPresentationUnstyled() {
        let resolved = Warp.SheetBackground.none.resolvedColor(
            token: Warp.Theme.token,
            style: .fullScreen,
            supportsLiquidGlass: false,
            nativeGlassEffectsEnabled: false
        )

        #expect(resolved == nil)
    }

    // MARK: - Brand coverage

    /// `surfaceElevated100` differs per brand, so the fallback must follow the active theme
    /// rather than resolving to a single hard-coded color.
    @Test(arguments: Warp.Brand.allCases)
    func opaqueFallbackFollowsActiveBrand(brand: Warp.Brand) {
        let previousTheme = Warp.Theme
        defer { Warp.Theme = previousTheme }
        Warp.Theme = brand

        let resolved = Warp.SheetBackground.automatic.resolvedColor(
            token: brand.token,
            style: .medium,
            supportsLiquidGlass: false,
            nativeGlassEffectsEnabled: true
        )

        #expect(components(resolved) == components(brand.token.surfaceElevated100))
    }
}
