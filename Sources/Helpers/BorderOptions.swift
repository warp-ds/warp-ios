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
public struct BorderOptions: OptionSet, Sendable {
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
    /// - Parameters:
    ///   - color: The color of the border. Defaults to `token.border` from the environment theme.
    ///   - width: The thickness of the border. Defaults to `1`.
    ///   - sides: A `BorderOptions` option set specifying the sides where the border should be applied.
    /// - Returns: A view with borders on the specified sides.
    public func border(_ color: Color? = nil, width: CGFloat = 1, sides: BorderOptions) -> some View {
        modifier(BorderViewModifier(color: color, width: width, sides: sides))
    }
}

private struct BorderViewModifier: ViewModifier {
    @Environment(\.warpTheme) private var theme

    private var token: TokenProvider { theme.token }

    let color: Color?
    let width: CGFloat
    let sides: BorderOptions

    func body(content: Content) -> some View {
        let resolvedColor = color ?? token.border
        return content.overlay(
            VStack(spacing: 0) {
                if sides.contains(.top) {
                    Rectangle()
                        .fill(resolvedColor)
                        .frame(height: width)
                }

                HStack(spacing: 0) {
                    if sides.contains(.leading) {
                        Rectangle()
                            .fill(resolvedColor)
                            .frame(width: width)
                    }

                    Spacer()

                    if sides.contains(.trailing) {
                        Rectangle()
                            .fill(resolvedColor)
                            .frame(width: width)
                    }
                }

                if sides.contains(.bottom) {
                    Rectangle()
                        .fill(resolvedColor)
                        .frame(height: width)
                }
            }
        )
    }
}
