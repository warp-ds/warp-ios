import Foundation
import struct SwiftUI.Color
import struct SwiftUI.Font

extension Warp {
    /// Warp button styles, that has been designed for certain scenarios.
    public enum ButtonType: Equatable, Sendable {
        /// Primary button style as default `SwiftUI` button style.
        case primary

        /// Style as subtitle/caption buttons.
        case secondary

        /// Style for plain buttons without borders.
        case tertiary

        /// Style as red alert/destructive button.
        case critical

        /// Style for plain red alert/destructive buttons without borders.
        case criticalTertiary

        /// <#Description#>
        case utility

        /// <#Description#>
        case utilityTertiary

        /// <#Description#>
        case utilityOverlay

        var isUtilityRelatedButton: Bool {
            switch self {
                case .utility, .utilityTertiary, .utilityOverlay:
                    return true

                default:
                    return false
            }
        }
    }
}
