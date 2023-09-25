import Foundation
import struct SwiftUI.Color
import struct SwiftUI.Font

extension Warp {
    /// Warp button styles, that has been designed for certain scenarios.
    public enum ButtonType: Equatable {
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

        private var isUtilityRelatedButton: Bool {
            switch self {
                case .utility, .utilityTertiary, .utilityOverlay:
                    return true

                default:
                    return false
            }
        }
    }
}

// MARK: UI Metrics

extension Warp.ButtonType {
    /// <#Description#>
    var borderWidth: CGFloat {
        switch self {
            case .utility:
                return 2

            default:
                return 4
        }
    }

    /// <#Description#>
    var cornerRadius: CGFloat {
        switch self {
            case .utility:
                return 4

            default:
                return 8
        }
    }

    private var utilityButtonDefaultPadding: CGFloat {
        return 8
    }

    /// Button label vertical margin.
    func getVerticalPadding(for size: Warp.ButtonSize) -> CGFloat {
        if isUtilityRelatedButton {
            return utilityButtonDefaultPadding
        }

        if size == .big {
            return 13
        }

        return 8
    }

    /// Button label horizontal margin.
    func getHorizontalPadding(for size: Warp.ButtonSize) -> CGFloat {
        if isUtilityRelatedButton {
            return utilityButtonDefaultPadding
        }

        if size == .big {
            return 16
        }

        return 12
    }
}
