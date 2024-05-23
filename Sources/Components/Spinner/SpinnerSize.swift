import Foundation

public enum SpinnerSize {
    case small
    case `default`
    case larger
    case custom(Double)
    
    var value: Double {
        switch self {
        case .small:
            return 16
        case .default:
            return 24
        case .larger:
            return 32
        case .custom(let size):
            return size
        }
    }
}
