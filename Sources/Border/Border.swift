import CoreFoundation

extension Warp {
    public enum Border: CGFloat {
        /// Border radius of 2 points.
        case borderRadius25
        /// Border radius of 4 points.
        case borderRadius50
        /// Border radius of 8 points.
        case borderRadius100
        /// Border radius of 16 points.
        case borderRadius200

        /// Border width of 1 points.
        case borderWidth12
        /// Border width of 2 points.
        case borderWidth25
        /// Border width of 4 points.
        case borderWidth50

        var description: CGFloat {
            switch self {
            case .borderRadius25:
                return 2
            case .borderRadius50:
                return 4
            case .borderRadius100:
                return 8
            case .borderRadius200:
                return 16
            case .borderWidth12:
                return 1
            case .borderWidth25:
                return 2
            case .borderWidth50:
                return 4
            }
        }
    }
}
