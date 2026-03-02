//
// Created by Łukasz Śliwa on 26/02/2026.
//

import UIKit

extension UINavigationBar {

    public func warpLiquidGlassStyle() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.titleTextAttributes = [
            .foregroundColor: UIColor(Warp.Color.token.text),
            .font:  Warp.Typography.title4.uiFont
        ]
        standardAppearance = appearance
        scrollEdgeAppearance = appearance
    }
}

extension UINavigationController {

    public func warpLiquidGlassStyle() {
        navigationBar.warpLiquidGlassStyle()
    }
}
