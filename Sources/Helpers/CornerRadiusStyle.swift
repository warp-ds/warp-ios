import SwiftUI

/// A view modifier that applies a custom corner radius to specific corners of a view.
struct CornerRadiusStyle: ViewModifier {
    var radius: CGFloat
    var corners: UIRectCorner
    
    /// A shape that allows for rounding specific corners with a custom radius.
    struct CornerRadiusShape: Shape {
        var radius = CGFloat.infinity
        var corners = UIRectCorner.allCorners
        
        /// Generates the path for the shape, rounding only the specified corners with the given radius.
        ///
        /// - Parameter rect: The bounding rectangle of the shape.
        /// - Returns: A `Path` object that defines the rounded shape.
        func path(in rect: CGRect) -> Path {
            let path = UIBezierPath(
                roundedRect: rect,
                byRoundingCorners: corners,
                cornerRadii: CGSize(width: radius, height: radius)
            )
            return Path(path.cgPath)
        }
    }
    
    /// The body of the view modifier, applying the corner radius to the specified corners of the content.
    ///
    /// - Parameter content: The content view to which the corner radius is applied.
    /// - Returns: The modified view with rounded corners.
    func body(content: Content) -> some View {
        content
            .clipShape(CornerRadiusShape(radius: radius, corners: corners))
    }
}
