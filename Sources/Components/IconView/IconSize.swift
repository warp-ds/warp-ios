import SwiftUI

extension Warp {
    /// Icon sizes that can be used in `IconView`.
    public enum IconSize: String, CaseIterable {
        case small
        case `default`
        case large
        
        /// The corresponding CGSize for the icon size.
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
