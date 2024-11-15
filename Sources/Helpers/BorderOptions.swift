import SwiftUI

/// An option set representing the sides of a view where a border can be applied.
///
/// `BorderOptions` provides specific options to add borders to the top, bottom, leading, and trailing sides of a view.
/// It allows for combining multiple sides, such as `.top` and `.bottom`, or using `.all` to apply borders to all sides.
///
/// Example usage:
/// ```swift
/// BorderOptions([.top, .leading]) // Adds a border to the top and leading sides
/// ```
///
/// - Parameters:
///   - top: Applies a border to the top edge.
///   - bottom: Applies a border to the bottom edge.
///   - leading: Applies a border to the leading (left) edge.
///   - trailing: Applies a border to the trailing (right) edge.
///   - all: Applies borders to all four edges.
public struct BorderOptions: OptionSet {
    public let rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    /// Border on the top edge.
    static let top = BorderOptions(rawValue: 1 << 0)
    
    /// Border on the bottom edge.
    static let bottom = BorderOptions(rawValue: 1 << 1)
    
    /// Border on the leading (left) edge.
    static let leading = BorderOptions(rawValue: 1 << 2)
    
    /// Border on the trailing (right) edge.
    static let trailing = BorderOptions(rawValue: 1 << 3)
    
    /// Borders on all four edges.
    static let all: BorderOptions = [.top, .bottom, .leading, .trailing]
}

extension View {
    /// Adds a customizable border to specified sides of a view.
    ///
    /// This modifier allows you to apply borders to one or more sides of a view with a specified color and width.
    /// Unlike SwiftUI's built-in `border`, this version lets you control which sides have borders.
    ///
    /// Example usage:
    /// ```swift
    /// Text("Bordered View")
    ///     .border(Color.blue, width: 2, sides: [.top, .leading])
    /// ```
    ///
    /// - Parameters:
    ///   - color: The color of the border. Defaults to `Warp.Color.token.border`.
    ///   - width: The thickness of the border. Defaults to `1`.
    ///   - sides: A `BorderOptions` option set specifying the sides where the border should be applied.
    /// - Returns: A view with borders on the specified sides.
    public func border(_ color: Color = Warp.Color.token.border, width: CGFloat = 1, sides: BorderOptions) -> some View {
        overlay(
            VStack(spacing: 0) {
                // Add a border on the top side if specified
                if sides.contains(.top) {
                    Rectangle()
                        .fill(color)
                        .frame(height: width)
                }
                
                HStack(spacing: 0) {
                    // Add a border on the leading side if specified
                    if sides.contains(.leading) {
                        Rectangle()
                            .fill(color)
                            .frame(width: width)
                    }
                    
                    Spacer()
                    
                    // Add a border on the trailing side if specified
                    if sides.contains(.trailing) {
                        Rectangle()
                            .fill(color)
                            .frame(width: width)
                    }
                }
                
                // Add a border on the bottom side if specified
                if sides.contains(.bottom) {
                    Rectangle()
                        .fill(color)
                        .frame(height: width)
                }
            }
        )
    }
}
