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
            .foregroundColor: Warp.UIColor.token.text,
            .font: Warp.Typography.body.uiFont
        ]
        appearance.buttonAppearance = buttonAppearance
        
        let prominentButtonAppearance = UIBarButtonItemAppearance(style: .prominent)
        let prominentButtonAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: Warp.UIColor.token.textInverted,
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

extension UINavigationBar {

    /// Applies Warp design style globally to all navigation bars with Liquid Glass styling (iOS 26+).
    ///
    /// This static method configures the global appearance of all UINavigationBar instances with:
    /// - Transparent background to allow liquid glass effects to show through
    /// - Title and subtitle text styled with Warp typography and colors
    /// - Back arrow styled with Warp's chevronLeft icon
    /// - Bar button items styled with Warp's text and icon colors
    ///
    /// **Availability:** iOS 26+. On earlier versions, this method does nothing.
    ///
    /// Call this once during app launch to apply Warp styling to all navigation bars globally.
    /// For per-instance styling, use the instance method on UINavigationBar or the convenience method on UINavigationController.
    ///
    /// **Usage:**
    ///
    /// ```swift
    /// func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    ///     UINavigationBar.warpLiquidGlassStyle()
    ///     return true
    /// }
    /// ```
    public static func warpLiquidGlassStyle() {
        guard #available(iOS 26.0, *) else { return }

        let appearance = UINavigationBarAppearance.warpNavigationBarLiquidGlass()
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().tintColor = Warp.UIColor.token.icon
        UINavigationBar.appearance().isTranslucent = false
    }

    /// Applies Warp design style to an individual navigation bar instance with Liquid Glass styling (iOS 26+).
    ///
    /// This instance method configures the appearance of a specific UINavigationBar with:
    /// - Transparent background to allow liquid glass effects to show through
    /// - Title and subtitle text styled with Warp typography and colors
    /// - Applied to standard, compact, and scroll edge appearances
    ///
    /// **Availability:** iOS 26+. On earlier versions, this method does nothing.
    ///
    /// For simpler per-instance styling, prefer using the convenience method on UINavigationController.
    ///
    /// **Usage:**
    ///
    /// ```swift
    /// let navigationBar = UINavigationBar()
    /// navigationBar.warpLiquidGlassStyle()
    /// ```
    public func warpLiquidGlassStyle() {
        guard #available(iOS 26.0, *) else { return }

        let appearance = UINavigationBarAppearance.warpNavigationBarLiquidGlass()
        standardAppearance = appearance
        compactAppearance = appearance
        scrollEdgeAppearance = appearance
    }
}

extension UINavigationController {

    /// Applies Warp design style to the navigation controller's navigation bar with Liquid Glass styling (iOS 26+).
    ///
    /// This convenience method applies Warp styling to the navigation controller's navigation bar with:
    /// - Transparent background to allow liquid glass effects to show through
    /// - Title and subtitle text styled with Warp typography and colors
    /// - Extended layout to allow content beneath navigation bar
    /// - Applied to standard, compact, and scroll edge appearances
    ///
    /// **Availability:** iOS 26+. On earlier versions, this method does nothing.
    ///
    /// **Usage:**
    ///
    /// ```swift
    /// let navigationController = UINavigationController()
    /// navigationController.warpLiquidGlassStyle()
    /// ```
    public func warpLiquidGlassStyle() {
        guard #available(iOS 26.0, *) else { return }

        navigationBar.warpLiquidGlassStyle()
        // Ensure the content extends under the navigation bar for liquid glass effect
        extendedLayoutIncludesOpaqueBars = true
    }
}

@available(iOS 26.0, *)
extension UINavigationItem {

    /// Applies Warp Liquid Glass appearance to this navigation item.
    ///
    /// Sets `standardAppearance`, `compactAppearance`, and `scrollEdgeAppearance` with
    /// transparent background and Warp typography/color tokens.
    public func warpLiquidGlassStyle() {
        let appearance = UINavigationBarAppearance.warpNavigationBarLiquidGlass()
        standardAppearance = appearance
        compactAppearance = appearance
        scrollEdgeAppearance = appearance
    }
}

extension UIViewController {

    /// Applies Warp Liquid Glass navigation bar styling to this view controller (iOS 26+).
    ///
    /// Resolves the navigation context, applies `warpLiquidGlassStyle()` to the target view
    /// controller's `navigationItem`, and sets `extendedLayoutIncludesOpaqueBars = true` on
    /// the navigation controller if one is found.
    ///
    /// On earlier OS versions this method does nothing.
    @available(iOS 26.0, *)
    public func warpNavigationBarStyle() {
        let targetVC = resolveNavigationContext()
        targetVC.navigationItem.warpLiquidGlassStyle()
        targetVC.extendedLayoutIncludesOpaqueBars = true
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
