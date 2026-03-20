//
// Created by Łukasz Śliwa on 26/02/2026.
//

import UIKit

extension UINavigationBar {

    /// Applies Warp design style to the navigation bar, making it suitable for use in a liquid glass style.
    /// This method configures the navigation bar's appearance to have a transparent background, sets the title text attributes to use Warp's text color and title4 typography, and applies Warp's icon color to the bar button items.
    public static func warpLiquidGlassStyle() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.titleTextAttributes = [
            .foregroundColor: Warp.UIColor.token.text,
            .font: Warp.Typography.title4.uiFont
        ]

        let backImage = Warp.Icon.arrowLeft.uiImage
        appearance.setBackIndicatorImage(backImage, transitionMaskImage: backImage)

        // Apply Warp token to bar button items
        let plainButtonAppearance = UIBarButtonItemAppearance(style: .plain)
        plainButtonAppearance.normal.titleTextAttributes = [
            .foregroundColor: Warp.UIColor.token.text,
            .font: Warp.Typography.title4.uiFont
        ]
        appearance.buttonAppearance = plainButtonAppearance
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance

        // Color the icons
        let tint = Warp.UIColor.token.icon
        UINavigationBar.appearance().tintColor = tint
    }

    /// Applies Warp design style to the navigation bar instance, making it suitable for use in a liquid glass style.
    public func warpLiquidGlassStyle() {
        let appearance = UINavigationBar.appearance().standardAppearance.copy()
        appearance.configureWithTransparentBackground()
        appearance.titleTextAttributes = [
            .foregroundColor: Warp.UIColor.token.text,
            .font:  Warp.Typography.title4.uiFont
        ]
        standardAppearance = appearance
        compactAppearance = appearance
        scrollEdgeAppearance = appearance
    }
}

extension UINavigationController {

    /// Applies Warp design style to the navigation controller's navigation bar, making it suitable for use in a liquid glass style.
    public func warpLiquidGlassStyle() {
        navigationBar.warpLiquidGlassStyle()
    }
}
