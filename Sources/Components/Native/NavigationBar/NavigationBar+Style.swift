import UIKit

@available(iOS 26.0, *)
private extension UINavigationBarAppearance {

    static func warpNavigationBarLiquidGlass() -> UINavigationBarAppearance {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.largeTitleTextAttributes = [
            .foregroundColor: Warp.UIColor.token.text,
            .font: Warp.Typography.title1.uiFont
        ]
        appearance.titleTextAttributes = [
            .foregroundColor: Warp.UIColor.token.text,
            .font: Warp.Typography.title4.uiFont
        ]
        appearance.subtitleTextAttributes = [
            .foregroundColor: Warp.UIColor.token.textSubtle,
            .font: Warp.Typography.title6.uiFont
        ]

        let backImage = Warp.Icon.chevronLeft.uiImage
        appearance.setBackIndicatorImage(backImage, transitionMaskImage: backImage)

        let buttonAppearance = UIBarButtonItemAppearance(style: .plain)
        buttonAppearance.normal.titleTextAttributes = [
            .font: Warp.Typography.body.uiFont
        ]
        appearance.buttonAppearance = buttonAppearance

        let prominentButtonAppearance = UIBarButtonItemAppearance(style: .prominent)
        let prominentButtonAttributes: [NSAttributedString.Key: Any] = [
            .font: Warp.Typography.title4.uiFont
        ]
        prominentButtonAppearance.normal.titleTextAttributes = prominentButtonAttributes
        prominentButtonAppearance.highlighted.titleTextAttributes = prominentButtonAttributes
        prominentButtonAppearance.disabled.titleTextAttributes = prominentButtonAttributes
        prominentButtonAppearance.focused.titleTextAttributes = prominentButtonAttributes
        appearance.prominentButtonAppearance = prominentButtonAppearance

        return appearance
    }
}

extension UINavigationBarAppearance {

    /// The navigation bar appearance used below iOS 26, where Liquid Glass does not exist.
    ///
    /// This is a direct port of what NMP already ships from
    /// `app-modules/Sources/UIAppearanceSetup/Appearance.swift`, so apps moving to the Warp API
    /// keep the navigation bar they have today rather than getting a newly invented one. The
    /// FinniversKit indirections it went through resolve to Warp tokens: `UIColor.background` and
    /// `UIColor.text` forward to `Warp.UIToken`, `UIFont.title1` to `Warp.Typography.title1`,
    /// `UIFont.body` to `Warp.Typography.body`, and `UIFont.bodyStrong` to
    /// **`Warp.Typography.title4`**, not to `Warp.Typography.bodyStrong`.
    ///
    /// Internal rather than private so tests can assert on it from any OS. The public entry points
    /// pick between this and the Liquid Glass appearance with `#available`, which would otherwise
    /// make this branch unreachable from a suite running on iOS 26.
    internal static func warpNavigationBarSolid() -> UINavigationBarAppearance {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = Warp.UIColor.token.background

        appearance.titleTextAttributes = [
            .foregroundColor: Warp.UIColor.token.text,
            .font: Warp.Typography.title4.uiFont
        ]

        appearance.largeTitleTextAttributes = [
            .foregroundColor: Warp.UIColor.token.text,
            .font: Warp.Typography.title1.uiFont
        ]

        let plainButtonAppearance = UIBarButtonItemAppearance(style: .plain)
        let plainButtonAttributes: [NSAttributedString.Key: Any] = [
            .font: Warp.Typography.body.uiFont
        ]
        plainButtonAppearance.normal.titleTextAttributes = plainButtonAttributes
        plainButtonAppearance.highlighted.titleTextAttributes = plainButtonAttributes
        plainButtonAppearance.disabled.titleTextAttributes = plainButtonAttributes
        plainButtonAppearance.focused.titleTextAttributes = plainButtonAttributes
        appearance.buttonAppearance = plainButtonAppearance

        // `prominentButtonAppearance` is the iOS 26 spelling; below it, prominence is `.done`.
        let doneButtonAppearance = UIBarButtonItemAppearance(style: .done)
        let doneButtonAttributes: [NSAttributedString.Key: Any] = [
            .font: Warp.Typography.title4.uiFont
        ]
        doneButtonAppearance.normal.titleTextAttributes = doneButtonAttributes
        doneButtonAppearance.highlighted.titleTextAttributes = doneButtonAttributes
        doneButtonAppearance.disabled.titleTextAttributes = doneButtonAttributes
        doneButtonAppearance.focused.titleTextAttributes = doneButtonAttributes
        appearance.doneButtonAppearance = doneButtonAppearance

        return appearance
    }

    /// The appearance for the running OS: Liquid Glass on iOS 26+, the solid appearance below.
    static func warpNavigationBar() -> UINavigationBarAppearance {
        if #available(iOS 26.0, *) {
            return .warpNavigationBarLiquidGlass()
        }
        return .warpNavigationBarSolid()
    }
}

extension UINavigationBar {

    /// Applies Warp navigation bar styling globally to every navigation bar.
    ///
    /// Resolves to the appearance for the running OS:
    /// - **iOS 26+:** transparent background so Liquid Glass shows through, Warp typography and
    ///   colours, Warp's chevronLeft back indicator, and a prominent button appearance.
    /// - **iOS 18 to 25:** the opaque `background` token, Warp typography and colours, and a
    ///   `.done` button appearance standing in for prominence.
    ///
    /// Call this once during app launch. For per-instance styling use the instance method on
    /// `UINavigationBar`, or the convenience method on `UINavigationController`.
    ///
    /// **Usage:**
    ///
    /// ```swift
    /// func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    ///     UINavigationBar.warpStyle()
    ///     return true
    /// }
    /// ```
    public static func warpStyle() {
        let appearance = UINavigationBarAppearance.warpNavigationBar()
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().isTranslucent = false

        if #available(iOS 26.0, *) {
            UINavigationBar.appearance().tintColor = Warp.UIColor.token.icon
        } else {
            UINavigationBar.appearance().tintColor = Warp.UIColor.token.textLink
        }
    }

    /// Applies Warp navigation bar styling to this navigation bar instance.
    ///
    /// Resolves to the appearance for the running OS, as described on ``warpStyle()``.
    ///
    /// **Usage:**
    ///
    /// ```swift
    /// let navigationBar = UINavigationBar()
    /// navigationBar.warpStyle()
    /// ```
    public func warpStyle() {
        let appearance = UINavigationBarAppearance.warpNavigationBar()
        standardAppearance = appearance
        compactAppearance = appearance
        scrollEdgeAppearance = appearance
    }

    @available(*, deprecated, renamed: "warpStyle()", message: "warpLiquidGlassStyle() did nothing below iOS 26. warpStyle() applies the solid appearance there instead.")
    public static func warpLiquidGlassStyle() {
        warpStyle()
    }

    @available(*, deprecated, renamed: "warpStyle()", message: "warpLiquidGlassStyle() did nothing below iOS 26. warpStyle() applies the solid appearance there instead.")
    public func warpLiquidGlassStyle() {
        warpStyle()
    }
}

extension UINavigationController {

    /// Applies Warp navigation bar styling to this navigation controller's navigation bar.
    ///
    /// Resolves to the appearance for the running OS, as described on
    /// ``UIKit/UINavigationBar/warpStyle()``. On iOS 26+ it additionally extends the layout under
    /// the bar so Liquid Glass has content to refract; below 26 the bar is opaque, so it does not.
    ///
    /// **Usage:**
    ///
    /// ```swift
    /// let navigationController = UINavigationController()
    /// navigationController.warpStyle()
    /// ```
    public func warpStyle() {
        navigationBar.warpStyle()

        if #available(iOS 26.0, *) {
            extendedLayoutIncludesOpaqueBars = true
        }
    }

    @available(*, deprecated, renamed: "warpStyle()", message: "warpLiquidGlassStyle() did nothing below iOS 26. warpStyle() applies the solid appearance there instead.")
    public func warpLiquidGlassStyle() {
        warpStyle()
    }
}

extension UINavigationItem {

    /// Applies the Warp navigation bar appearance to this navigation item.
    ///
    /// Sets `standardAppearance`, `compactAppearance` and `scrollEdgeAppearance` to the appearance
    /// for the running OS, as described on ``UIKit/UINavigationBar/warpStyle()``.
    public func warpStyle() {
        let appearance = UINavigationBarAppearance.warpNavigationBar()
        standardAppearance = appearance
        compactAppearance = appearance
        scrollEdgeAppearance = appearance
    }

    @available(iOS 26.0, *)
    @available(*, deprecated, renamed: "warpStyle()", message: "warpStyle() is available on every supported OS version.")
    public func warpLiquidGlassStyle() {
        warpStyle()
    }
}

extension UIViewController {

    /// Applies Warp navigation bar styling to this view controller.
    ///
    /// Resolves the navigation context, applies the appearance for the running OS to the target
    /// view controller's `navigationItem`, and on iOS 26+ extends the layout under the bar so
    /// Liquid Glass has content to refract.
    public func warpNavigationBarStyle() {
        let targetVC = resolveNavigationContext()
        targetVC.navigationItem.warpStyle()

        if #available(iOS 26.0, *) {
            targetVC.extendedLayoutIncludesOpaqueBars = true
        }
    }

    /// Traverses the parent hierarchy to find the view controller directly owned by a navigation controller.
    private func resolveNavigationContext() -> UIViewController {
        if parent == nil || parent is UINavigationController {
            return self
        }

        var currentParent = parent
        while let parent = currentParent {
            if parent.parent == nil || parent.parent is UINavigationController {
                return parent
            }
            currentParent = parent.parent
        }

        return self
    }
}
