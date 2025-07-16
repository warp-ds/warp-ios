import Foundation
import struct SwiftUI.Color
import struct SwiftUI.Font

extension Warp {
    /// Warp button styles, that has been designed for certain scenarios.
    public enum ButtonType: String, Equatable, CaseIterable {
        /// Primary button style, used for the main action on a screen.
        case primary

        /// Secondary button style, typically used for less prominent actions, styled as subtitle or caption buttons.
        case secondary

        /// Quiet button style, used for plain buttons without borders, suitable for actions with minimal emphasis.
        case quiet

        /// Critical button style, used for red alert or destructive actions that require attention.
        case critical

        /// Critical Quiet button style, used for plain red alert or destructive buttons without borders.
        case criticalQuiet

        /// Utility button style, used for supplementary or supporting actions, often with a neutral appearance.
        case utility

        /// Utility Quiet button style, used for plain buttons related to supplementary or supporting actions without borders.
        case utilityQuiet

        /// Utility overlay button style, used for actions that overlay other content, often with a transparent or semi-transparent background.
        case utilityOverlay

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
