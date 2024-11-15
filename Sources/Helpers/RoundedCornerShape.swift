import SwiftUI

/// A custom shape that allows rounding specific corners of a rectangle with a specified radius.
///
/// `RoundedCornerShape` provides the ability to selectively round certain corners of a view,
/// such as only the top-left and top-right corners, which is not natively supported in SwiftUI's `RoundedRectangle`.
///
/// Example usage:
/// ```swift
/// RoundedCornerShape(corners: [.topLeft, .bottomRight], radius: 10)
///     .fill(Color.blue)
///     .frame(width: 100, height: 100)
/// ```
///
/// - Parameters:
///   - corners: The specific corners to round, specified as a `UIRectCorner` option set (e.g., `.topLeft`, `.bottomRight`).
///   - radius: The corner radius to apply to the specified corners.
struct RoundedCornerShape: Shape {
    /// The corners of the rectangle to apply the rounding to.
    var corners: UIRectCorner
    
    /// The radius of the rounded corners.
    var radius: CGFloat

    /// Creates a path for the specified rounded corners in the given rectangle.
    ///
    /// - Parameter rect: The rectangle in which to apply the rounded corners.
    /// - Returns: A `Path` object defining the shape with the specified rounded corners.
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
