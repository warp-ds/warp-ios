import SwiftUI

@MainActor extension Warp {
    public enum CalloutSize {
        case small
        case `default`

        public var textStyle: Warp.TextStyle {
            switch self {
            case .small:
                .caption
            case .default:
                .body
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

        public func verticalPadding(for edge: Edge, arrowHeight: Double) -> Double {
            let additionalPadding = edge == .top || edge == .bottom ? arrowHeight / 2 : 0
            return switch self {
            case .small:
                7 + additionalPadding
            case .default:
                8 + additionalPadding
            }
        }
    }
}
