import UIKit

extension UINavigationBar {

    /// Applies Warp design style globally to all navigation bars, making them suitable for use with liquid glass layouts.
    ///
    /// This static method configures the global appearance of all UINavigationBar instances with:
    /// - Transparent background to allow liquid glass effects to show through
    /// - Title text styled with Warp's text color and title4 typography
    /// - Back arrow styled with Warp's arrowLeft icon
    /// - Bar button items styled with Warp's text and icon colors
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
        if #available(iOS 26.0, *) {
            appearance.subtitleTextAttributes = [
                .foregroundColor: Warp.UIColor.token.textSubtle,
                .font: Warp.Typography.title6.uiFont
            ]
        }

        let backImage = Warp.Icon.arrowLeft.uiImage
        appearance.setBackIndicatorImage(backImage, transitionMaskImage: backImage)

        let plainButtonAppearance = UIBarButtonItemAppearance(style: .plain)
        plainButtonAppearance.normal.titleTextAttributes = [
            .foregroundColor: Warp.UIColor.token.text,
            .font: Warp.Typography.title4.uiFont
        ]
        appearance.buttonAppearance = plainButtonAppearance

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance

        let tint = Warp.UIColor.token.icon
        UINavigationBar.appearance().tintColor = tint
    }

    /// Applies Warp design style to an individual navigation bar instance, making it suitable for use with liquid glass layouts.
    ///
    /// This instance method configures the appearance of a specific UINavigationBar with:
    /// - Transparent background to allow liquid glass effects to show through
    /// - Title text styled with Warp's text color and title4 typography
    /// - Applied to standard, compact, and scroll edge appearances
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
        let appearance = UINavigationBar.appearance().standardAppearance.copy()
        appearance.configureWithTransparentBackground()
        appearance.largeTitleTextAttributes = [
            .foregroundColor: Warp.UIColor.token.text,
            .font: Warp.Typography.title1.uiFont
        ]
        appearance.titleTextAttributes = [
            .foregroundColor: Warp.UIColor.token.text,
            .font:  Warp.Typography.title4.uiFont
        ]
        if #available(iOS 26.0, *) {
            appearance.subtitleTextAttributes = [
                .foregroundColor: Warp.UIColor.token.textSubtle,
                .font: Warp.Typography.title6.uiFont
            ]
        }
        standardAppearance = appearance
        compactAppearance = appearance
        scrollEdgeAppearance = appearance
    }
}

extension UINavigationController {

    /// Applies Warp design style to the navigation controller's navigation bar, making it suitable for use with liquid glass layouts.
    ///
    /// This convenience method applies Warp styling to the navigation controller's navigation bar with:
    /// - Transparent background to allow liquid glass effects to show through
    /// - Title text styled with Warp's text color and title4 typography
    /// - Applied to standard, compact, and scroll edge appearances
    ///
    /// **Usage:**
    ///
    /// ```swift
    /// let navigationController = UINavigationController()
    /// navigationController.warpLiquidGlassStyle()
    /// ```
    public func warpLiquidGlassStyle() {
        navigationBar.warpLiquidGlassStyle()
    }
}
