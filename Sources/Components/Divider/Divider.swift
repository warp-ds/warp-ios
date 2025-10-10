import SwiftUI

extension Warp {



    /// Dividers are thin lines that group content in lists and layouts.
    /// They can be customized with different orientations, styles, colors, and thicknesses.
    /// 
    /// **Usage:**
    /// ```swift
    /// Warp.Divider(orientation: .horizontal, style: .solid)
    /// Warp.Divider(orientation: .vertical, style: .dashed)
    /// ```
    public struct Divider: View {
        // MARK: - WARP Style      
        let color = Warp.Token.border
        let thickness: CGFloat = Warp.Border.borderWidth12

        /// Orientation for the divider: horizontal or vertical.
        public enum Orientation {
            case horizontal
            case vertical
        }

        /// Line style for the divider: solid or dashed.
        public enum LineStyle {
            case solid
            case dashed
        }

        let orientation: Orientation
        let style: LineStyle

        /// Creates a divider with specified orientation and style.
        /// - Parameters:
        ///   - orientation: The orientation of the divider, either horizontal or vertical. Default is horizontal.
        ///   - style: The line style of the divider, either solid or dashed. Default is solid.
        public init(
            orientation: Orientation = .horizontal,
            style: LineStyle = .solid
        ) {
            self.orientation = orientation
            self.style = style
        }

      public var body: some View {
            Rectangle()
                .fill(SwiftUI.Color.clear)
                .frame(
                    width: orientation == .vertical ? thickness : nil,
                    height: orientation == .horizontal ? thickness : nil
                )
                .overlay(
                    Rectangle()
                        .strokeBorder(
                            style: StrokeStyle(
                                lineWidth: thickness,
                                dash: style == .dashed ? [2, 2] : []
                            )
                        )
                        .foregroundColor(color)
                )
                .fixedSize(horizontal: orientation == .vertical, vertical: orientation == .horizontal)
        }
    }
}
