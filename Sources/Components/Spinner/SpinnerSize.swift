import Foundation

extension Warp {
    public enum SpinnerSize: Hashable {
        case small
        case `default`
        case large
        case custom(Double)
        
        var value: Double {
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
    }
}
