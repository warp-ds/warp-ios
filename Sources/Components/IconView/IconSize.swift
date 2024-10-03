import SwiftUI

extension Warp {
    /// Icon sizes that can be used in `IconView`.
    ///
    /// `IconSize` defines three standard sizes: `small` (16x16), `default` (24x24), `large` (32x32),
    /// and a `custom` size that can be specified by the user.
    public enum IconSize: Hashable {        
        case small
        case `default`
        case large
        case custom(CGFloat)
        
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
            case .custom(let size):
                return size
            }
        }
        
        /// Display name for the picker UI, used in the `IconViewSample`.
        public var displayName: String {
            switch self {
            case .small:
                return "Small"
            case .default:
                return "Default"
            case .large:
                return "Large"
            case .custom(_):
                return "Custom"
            }
        }
    }
}
