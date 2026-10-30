import Foundation
import struct SwiftUI.Color
import struct SwiftUI.Font

extension Warp {
    public enum ButtonType: String, Equatable, CaseIterable, Sendable {
        case primary

        case secondary

        case quiet

        case negative

        case negativeQuiet

        case utility

        case utilityQuiet

        case utilityOverlay

        @available(*, deprecated, renamed: "negative")
        public static var critical: ButtonType { .negative }

        @available(*, deprecated, renamed: "negativeQuiet")
        public static var criticalQuiet: ButtonType { .negativeQuiet }

        /// Also accepts the legacy raw values `"critical"` and `"criticalQuiet"`,
        /// so strings stored or sent before the rename still decode.
        public init?(rawValue: String) {
            switch rawValue {
            case "primary": self = .primary
            case "secondary": self = .secondary
            case "quiet": self = .quiet
            case "negative", "critical": self = .negative
            case "negativeQuiet", "criticalQuiet": self = .negativeQuiet
            case "utility": self = .utility
            case "utilityQuiet": self = .utilityQuiet
            case "utilityOverlay": self = .utilityOverlay
            default: return nil
            }
        }

        var isUtilityRelatedButton: Bool {
            switch self {
                case .utility, .utilityQuiet, .utilityOverlay:
                    return true

                default:
                    return false
            }
        }
    }
}
