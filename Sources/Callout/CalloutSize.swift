import SwiftUI

extension Warp {
    public enum CalloutSize {
        case small
        case `default`

        public var typography: Warp.Typography {
            switch self {
            case .small:
                Typography.caption
            case .default:
                Typography.body
            }
        }

        public var cornerRadius: Double {
            switch self {
            case .small:
                6
            case .default:
                8
            }
        }

        public var verticalPadding: Double {
            switch self {
            case .small:
                8
            case .default:
                7
            }
        }
    }
}
