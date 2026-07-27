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
    /// - Parameters:
    ///   - color: The color to be used for the background. Defaults to `token.surfaceElevated200` from the environment theme.
    ///   - cornerRadius: The radius of the rounded corners. Defaults to `Warp.Spacing.spacing200`.
    ///   - isPressed: A value indicating whether the view is currently in a pressed state and should update its shadow accordingly. Defaults to `false`.
    /// - Returns: A view with the applied card-like background and shadow.
    public func withCardBackground(
        _ color: Color? = nil,
        cornerRadius: CGFloat = Warp.Spacing.spacing200,
        isPressed: Bool = false
    ) -> some View {
        modifier(CardBackgroundModifier(color: color, cornerRadius: cornerRadius, isPressed: isPressed))
    }

    /// Applies a background suitable for a bottom sheet with rounded top corners and a large shadow.
    ///
    /// - Parameters:
    ///   - color: The background color for the bottom sheet. Defaults to `token.surfaceElevated100` from the environment theme.
    ///   - cornerRadius: The radius for the rounded top corners. Defaults to `Warp.Spacing.spacing200`.
    /// - Returns: A view with the applied bottom sheet background, rounded top corners, and shadow.
    public func withBottomSheetBackground(
        _ color: Color? = nil,
        cornerRadius: CGFloat = Warp.Spacing.spacing200
    ) -> some View {
        modifier(BottomSheetBackgroundModifier(color: color, cornerRadius: cornerRadius))
    }
}

private struct CardBackgroundModifier: ViewModifier {
    @Environment(\.warpTheme) private var theme

    private var token: TokenProvider { theme.token }

    let color: Color?
    let cornerRadius: CGFloat
    let isPressed: Bool

    func body(content: Content) -> some View {
        content.background {
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(color ?? token.surfaceElevated200)
                .addShadow(.small, isPressed: isPressed)
        }
    }
}

private struct BottomSheetBackgroundModifier: ViewModifier {
    @Environment(\.warpTheme) private var theme

    private var token: TokenProvider { theme.token }

    let color: Color?
    let cornerRadius: CGFloat

    func body(content: Content) -> some View {
        content.background {
            (color ?? token.surfaceElevated100)
                .cornerRadius(cornerRadius, corners: [.topLeft, .topRight])
                .ignoresSafeArea(.all)
                .addShadow(.large)
        }
    }
}
