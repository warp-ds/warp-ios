import Foundation
import struct SwiftUI.Color
import struct SwiftUI.Font

extension Warp {
    /// Warp button styles, that has been designed for certain scenarios.
    public enum ButtonType: String, Equatable, CaseIterable, Sendable {
        /// Primary button style, used for the main action on a screen.
        case primary

        /// Secondary button style, typically used for less prominent actions, styled as subtitle or caption buttons.
        case secondary

        /// Quiet button style, used for plain buttons without borders, suitable for actions with minimal emphasis.
        case quiet

        /// Negative button style, used for red alert or destructive actions that require attention.
        case negative

        /// Negative Quiet button style, used for plain red alert or destructive buttons without borders.
        case negativeQuiet

        /// Utility button style, used for supplementary or supporting actions, often with a neutral appearance.
        case utility

        /// Utility Quiet button style, used for plain buttons related to supplementary or supporting actions without borders.
        case utilityQuiet

        /// Utility overlay button style, used for actions that overlay other content, often with a transparent or semi-transparent background.
        case utilityOverlay

        /// The previous name of ``negative``. Matches `.negative` in comparisons and `switch` patterns,
        /// but a `switch` that lists only the old names is no longer exhaustive.
        @available(*, deprecated, renamed: "negative")
        public static var critical: ButtonType { .negative }

        /// The previous name of ``negativeQuiet``. See ``critical``.
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
