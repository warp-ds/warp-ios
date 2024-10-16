import SwiftUI

extension View {
    /// Applies a corner radius to specific corners of the view.
    ///
    /// - Parameters:
    ///   - radius: The radius to apply to the specified corners.
    ///   - corners: The corners to which the radius should be applied (e.g., `.topLeft`, `.bottomRight`).
    /// - Returns: A view with the specified corners rounded.
    public func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
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
}
