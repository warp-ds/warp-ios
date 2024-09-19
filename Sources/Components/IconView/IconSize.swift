import SwiftUI

extension Warp {
    /// Icon sizes that can be used in `IconView`.
    ///
    /// `IconSize` defines three standard sizes: `small` (16x16), `default` (24x24), and `large` (32x32).
    public enum IconSize: String, CaseIterable {
        case small
        case `default`
        case large
        
        /// The corresponding size in `CGFloat` for the icon.
        ///
        /// - Returns: The width and height of the icon in points.
        public var value: CGFloat {
            switch self {
            case .small:
                return 16
            case .default:
                return 24
            case .large:
                return 32
            }
        }
    }
}
