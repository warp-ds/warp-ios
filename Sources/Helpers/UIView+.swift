import UIKit

public extension UIView {
    /// Applies a card-like background to the view with customizable color and corner radius.
    ///
    /// This method sets the background color, applies a corner radius, and adds a small shadow effect
    /// to the view, mimicking a card appearance. The default color and corner radius values are taken
    /// from the `Warp.UIToken` and `Warp.Spacing` design tokens.
    ///
    /// - Parameters:
    ///   - color: The background color for the card. Defaults to `Warp.UIToken.surfaceElevated200`.
    ///   - cornerRadius: The radius for the rounded corners. Defaults to `Warp.Spacing.spacing200`.
    func addCardBackground(
        _ color: UIColor = Warp.UIToken.surfaceElevated200,
        cornerRadius: CGFloat = Warp.Spacing.spacing200
    ) {
        self.backgroundColor = color
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = false
        self.addShadow(.small)
    }
    
    /// Applies a background suitable for a bottom sheet with rounded top corners and a large shadow.
    ///
    /// This method sets the background color, rounds the top corners of the view, and adds a large shadow
    /// to mimic a bottom sheet appearance. The rounded corners are created using a `UIBezierPath` and
    /// a `CAShapeLayer`, ensuring that only the top corners are rounded.
    ///
    /// - Parameters:
    ///   - color: The background color for the bottom sheet. Defaults to `Warp.UIToken.surfaceElevated100`.
    ///   - cornerRadius: The radius for the rounded top corners. Defaults to `Warp.Spacing.spacing200`.
    func addBottomSheetBackground(
        _ color: UIColor =  Warp.UIToken.surfaceElevated100,
        cornerRadius: CGFloat = Warp.Spacing.spacing200
    ) {
        self.backgroundColor = color
        let maskPath = UIBezierPath(roundedRect: self.bounds,
                                    byRoundingCorners: [.topLeft, .topRight],
                                    cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        let maskLayer = CAShapeLayer()
        maskLayer.path = maskPath.cgPath
        self.layer.mask = maskLayer
        self.layer.masksToBounds = false
        self.addShadow(.large)
    }
}
