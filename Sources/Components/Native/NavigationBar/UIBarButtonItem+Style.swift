//
// Created by Łukasz Śliwa on 26/02/2026.
//

import UIKit

extension UIBarButtonItem {

    public enum WarpBarButtonStyle {
        case `default`
        case primary
    }

    @discardableResult
    public func warpNavigationBarButton(style: WarpBarButtonStyle = .default) -> Self {
        tintColor = UIColor(Warp.Color.buttonPrimaryBackground)
        setTitleTextAttributes([.foregroundColor: UIColor(Warp.Color.buttonPrimaryBackground)], for: .normal)
        setTitleTextAttributes([.font: Warp.Typography.body.uiFont], for: .normal)
        setTitleTextAttributes([.font: Warp.Typography.body.uiFont], for: .highlighted)

        return self
    }
}
