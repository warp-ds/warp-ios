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

    // MARK: - Background resolution

    /// The Warp Sheet spec draws Glass and Solid background variants. These map to OS
    /// availability, not to a caller decision, so `.automatic` must resolve to the system
    /// appearance on iOS 26+ and to the opaque token below it.
    @Test
    func automaticBackgroundDefersToSystemWhenLiquidGlassIsAvailable() {
        let resolved = Warp.SheetBackground.automatic.resolvedColor(
            token: Warp.Theme.token,
            supportsLiquidGlass: true,
            nativeGlassEffectsEnabled: true
        )

        #expect(resolved == nil)
    }

    @Test
    func automaticBackgroundFallsBackToSurfaceBelowLiquidGlass() {
        let token = Warp.Theme.token

        let resolved = Warp.SheetBackground.automatic.resolvedColor(
            token: token,
            supportsLiquidGlass: false,
            nativeGlassEffectsEnabled: true
        )

        #expect(components(resolved) == components(token.surfaceElevated100))
    }

    /// Offscreen snapshot hosts cannot rasterize native Liquid Glass, so disabling it must force
    /// the opaque fallback even on an OS that supports glass.
    @Test
    func automaticBackgroundFallsBackToSurfaceWhenGlassEffectsAreDisabled() {
        let token = Warp.Theme.token

        let resolved = Warp.SheetBackground.automatic.resolvedColor(
            token: token,
            supportsLiquidGlass: true,
            nativeGlassEffectsEnabled: false
        )

        #expect(components(resolved) == components(token.surfaceElevated100))
    }

    @Test
    func surfaceBackgroundIsOpaqueRegardlessOfLiquidGlassSupport() {
        let token = Warp.Theme.token

        for supportsLiquidGlass in [true, false] {
            let resolved = Warp.SheetBackground.surface.resolvedColor(
                token: token,
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
            supportsLiquidGlass: true,
            nativeGlassEffectsEnabled: true
        )

        #expect(components(resolved) == components(.red))
    }

    @Test
    func noneBackgroundLeavesPresentationUnstyled() {
        let resolved = Warp.SheetBackground.none.resolvedColor(
            token: Warp.Theme.token,
            supportsLiquidGlass: false,
            nativeGlassEffectsEnabled: false
        )

        #expect(resolved == nil)
    }

    // MARK: - Brand coverage

    /// `surfaceElevated100` differs per brand, so the fallback must follow the active theme
    /// rather than resolving to a single hard-coded color.
    @Test(arguments: Warp.Brand.allCases)
    func surfaceFallbackFollowsActiveBrand(brand: Warp.Brand) {
        let previousTheme = Warp.Theme
        defer { Warp.Theme = previousTheme }
        Warp.Theme = brand

        let resolved = Warp.SheetBackground.automatic.resolvedColor(
            token: brand.token,
            supportsLiquidGlass: false,
            nativeGlassEffectsEnabled: true
        )

        #expect(components(resolved) == components(brand.token.surfaceElevated100))
    }
}
