import SwiftUI

extension View {
    /// Applies a corner radius to specific corners of the view.
    ///
    /// - Parameters:
    ///   - radius: The radius to apply to the specified corners.
    ///   - corners: The corners to which the radius should be applied (e.g., `.topLeft`, `.bottomRight`).
    /// - Returns: A view with the specified corners rounded.
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        ModifiedContent(content: self, modifier: CornerRadiusStyle(radius: radius, corners: corners))
    }
    
    /// Converts the SwiftUI `View` into a corresponding `UIView`.
    ///
    /// This is useful for embedding SwiftUI views within UIKit environments.
    /// The resulting `UIView` will have a clear background color.
    ///
    /// - Returns: A `UIView` that contains the SwiftUI view.
    public var uiView: UIView {
        let vc = UIHostingController(rootView: self)
        vc.view.backgroundColor = .clear
        return vc.view
    }
    
    /// Applies a card-like background to the view with customizable color and corner radius.
    ///
    /// This modifier adds a background to the view using a rounded rectangle with a shadow effect.
    /// The default color is `Warp.Token.surfaceElevated200`, and the corner radius is set to
    /// `Warp.Spacing.spacing200`, but both can be customized.
    ///
    /// - Parameters:
    ///   - color: The color to be used for the background. Defaults to `Warp.Token.surfaceElevated200`.
    ///   - cornerRadius: The radius of the rounded corners. Defaults to `Warp.Spacing.spacing200`.
    /// - Returns: A view with the applied card-like background and shadow.
    public func withCardBackground(
        _ color: Color = Warp.Token.surfaceElevated200,
        cornerRadius: CGFloat = Warp.Spacing.spacing200
    ) -> some View {
        self.background {
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(color)
                .addShadow(.small)
        }
    }
    
    /// Applies a background suitable for a bottom sheet with rounded top corners and a large shadow.
    ///
    /// This modifier adds a background with customizable color and rounded top corners,
    /// mimicking a bottom sheet appearance. It also applies a large shadow effect and ignores
    /// the safe area to extend the view fully.
    ///
    /// - Parameters:
    ///   - color: The background color for the bottom sheet. Defaults to `Warp.Token.surfaceElevated100`.
    ///   - cornerRadius: The radius for the rounded top corners. Defaults to `Warp.Spacing.spacing200`.
    /// - Returns: A view with the applied bottom sheet background, rounded top corners, and shadow.
    public func withBottomSheetBackground(
        _ color: Color = Warp.Token.surfaceElevated100,
        cornerRadius: CGFloat = Warp.Spacing.spacing200
    ) -> some View {
        self.background {
            color
                .cornerRadius(cornerRadius, corners: [.topLeft, .topRight])
                .ignoresSafeArea(.all)
                .addShadow(.large)
        }
    }
}
