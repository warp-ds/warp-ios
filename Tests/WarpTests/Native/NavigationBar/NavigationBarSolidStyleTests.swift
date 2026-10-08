import Testing
import UIKit
@testable import Warp

/// Covers the appearance applied below iOS 26, where Liquid Glass does not exist.
///
/// These assert on `UINavigationBarAppearance.warpNavigationBarSolid()` directly rather than going
/// through the public entry points. The entry points dispatch on `#available`, so on a simulator
/// running iOS 26 the solid branch would never be reached and the suite would pass without testing
/// anything.
@Suite(.serialized) // Serialized because the fixtures read the global `Warp.Theme` token provider.
@MainActor
struct NavigationBarSolidStyleTests {

    private func resolved(_ color: UIColor?) -> [UIColor]? {
        guard let color else { return nil }
        return [UITraitCollection(userInterfaceStyle: .light), UITraitCollection(userInterfaceStyle: .dark)]
            .map { color.resolvedColor(with: $0) }
    }

    // MARK: - Background

    /// NMP's pre-26 bar is opaque on the `background` token, not transparent and not
    /// `surfaceElevated100`, which an earlier revision of this work had guessed at.
    @Test
    func solidAppearanceUsesTheBackgroundToken() {
        let appearance = UINavigationBarAppearance.warpNavigationBarSolid()

        #expect(resolved(appearance.backgroundColor) == resolved(Warp.UIColor.token.background))
    }

    // MARK: - Titles

    /// NMP styles the inline title with FinniversKit's `UIFont.bodyStrong`, which forwards to
    /// `Warp.Typography.title4`. Harmless either way, since `title4` and `bodyStrong` are the same
    /// 16pt Medium `.callout` font in Warp, but `title4` is what the chain actually resolves to and
    /// it matches the iOS 26 appearance above.
    @Test
    func solidAppearanceStylesTheInlineTitle() {
        let attributes = UINavigationBarAppearance.warpNavigationBarSolid().titleTextAttributes

        #expect(resolved(attributes[.foregroundColor] as? UIColor) == resolved(Warp.UIColor.token.text))
        #expect(attributes[.font] as? UIFont == Warp.Typography.title4.uiFont)
    }

    @Test
    func solidAppearanceStylesTheLargeTitle() {
        let attributes = UINavigationBarAppearance.warpNavigationBarSolid().largeTitleTextAttributes

        #expect(resolved(attributes[.foregroundColor] as? UIColor) == resolved(Warp.UIColor.token.text))
        #expect(attributes[.font] as? UIFont == Warp.Typography.title1.uiFont)
    }

    // MARK: - Buttons

    /// All four states are set, not just `.normal`, so a disabled or highlighted button does not
    /// fall back to the system font mid-interaction.
    @Test
    func solidAppearanceStylesEveryPlainButtonState() {
        let buttonAppearance = UINavigationBarAppearance.warpNavigationBarSolid().buttonAppearance
        let states = [
            buttonAppearance.normal,
            buttonAppearance.highlighted,
            buttonAppearance.disabled,
            buttonAppearance.focused
        ]

        for state in states {
            #expect(state.titleTextAttributes[.font] as? UIFont == Warp.Typography.body.uiFont)
        }
    }

    /// `prominentButtonAppearance` is the iOS 26 spelling. Below it, prominence is `.done`, so the
    /// primary bar button has to be styled through `doneButtonAppearance` instead.
    @Test
    func solidAppearanceStylesEveryDoneButtonState() {
        let doneAppearance = UINavigationBarAppearance.warpNavigationBarSolid().doneButtonAppearance
        let states = [
            doneAppearance.normal,
            doneAppearance.highlighted,
            doneAppearance.disabled,
            doneAppearance.focused
        ]

        for state in states {
            #expect(state.titleTextAttributes[.font] as? UIFont == Warp.Typography.title4.uiFont)
        }
    }

    // MARK: - Brand coverage

    @Test(arguments: Warp.Brand.allCases)
    func solidAppearanceFollowsActiveBrand(brand: Warp.Brand) {
        let previousTheme = Warp.Theme
        defer { Warp.Theme = previousTheme }
        Warp.Theme = brand

        let appearance = UINavigationBarAppearance.warpNavigationBarSolid()

        #expect(resolved(appearance.backgroundColor) == resolved(brand.uiToken.background))
    }

    // MARK: - Entry points

    /// The point of the change: below iOS 26 these used to return without touching anything.
    @Test
    func instanceEntryPointAppliesAnAppearanceOnEveryOSVersion() {
        let navigationBar = UINavigationBar()

        navigationBar.warpStyle()

        #expect(navigationBar.compactAppearance != nil)
        #expect(navigationBar.scrollEdgeAppearance != nil)

        if #unavailable(iOS 26.0) {
            #expect(resolved(navigationBar.standardAppearance.backgroundColor) == resolved(Warp.UIColor.token.background))
        }
    }

    @Test
    func navigationControllerEntryPointStylesItsBar() {
        let navigationController = UINavigationController(rootViewController: UIViewController())

        navigationController.warpStyle()

        #expect(navigationController.navigationBar.compactAppearance != nil)
        #expect(navigationController.navigationBar.scrollEdgeAppearance != nil)
    }

    @Test
    func navigationItemEntryPointStylesEveryAppearanceSlot() {
        let navigationItem = UINavigationItem()

        navigationItem.warpStyle()

        #expect(navigationItem.standardAppearance != nil)
        #expect(navigationItem.compactAppearance != nil)
        #expect(navigationItem.scrollEdgeAppearance != nil)
    }

    /// `.prominent` does not exist below iOS 26, so the primary style has to resolve to `.done`
    /// there. Previously the whole method returned `self` untouched below 26.
    @Test
    func primaryBarButtonResolvesToAProminentStyleOnEveryOSVersion() {
        let item = UIBarButtonItem(title: "Save", style: .plain, target: nil, action: nil)

        item.warpNavigationBarButton(style: .primary)

        if #available(iOS 26.0, *) {
            #expect(item.style == .prominent)
        } else {
            #expect(item.style == .done)
        }
        #expect(item.titleTextAttributes(for: .normal)?[.font] as? UIFont == Warp.Typography.title4.uiFont)
    }

    @Test
    func defaultBarButtonIsPlainAndTinted() {
        let item = UIBarButtonItem(title: "Cancel", style: .done, target: nil, action: nil)

        item.warpNavigationBarButton(style: .default)

        #expect(item.style == .plain)
        #expect(resolved(item.tintColor) == resolved(Warp.UIColor.token.icon))
        #expect(item.titleTextAttributes(for: .normal)?[.font] as? UIFont == Warp.Typography.body.uiFont)
    }
}
