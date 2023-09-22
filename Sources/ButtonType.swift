import Foundation
import struct SwiftUI.Color
import struct SwiftUI.Font

protocol WarpButtonTypeColor {
    var foregroundColor: Color { get }
    var backgroundColor: Color { get }
    var disabledBackgroundColor: Color { get }
    var borderColor: Color { get }
}

extension Warp {
    /// <#Description#>
    public enum ButtonType: WarpButtonTypeColor {
        /// <#Description#>
        case primary

        /// <#Description#>
        case secondary

        /// <#Description#>
        case tertiary

        /// <#Description#>
        case critical

        /// <#Description#>
        case criticalTertiary

        /// <#Description#>
        case utility

        /// <#Description#>
        case utilityTertiary

        /// <#Description#>
        case utilityOverlay
        
        /// <#Description#>
        var foregroundColor: Color {
            let colorProvider = Config.colorProvider

            switch self {
                case .primary:
                    return colorProvider.buttonPrimaryText

                case .secondary:
                    return colorProvider.buttonSecondaryText

                case .tertiary:
                    return colorProvider.buttonQuietText

                case .critical:
                    return colorProvider.buttonNegativeText

                case .criticalTertiary:
                    return colorProvider.buttonNegativeQuietText

                case .utility:
                    return colorProvider.buttonUtilityText

                case .utilityTertiary:
                    return colorProvider.buttonUtilityQuietText

                case .utilityOverlay:
                    return colorProvider.buttonUtilityQuietText
            }
        }
        
        /// <#Description#>
        var backgroundColor: Color {
            let colorProvider = Config.colorProvider

            switch self {
                case .primary:
                    return colorProvider.buttonPrimaryBackground

                case .secondary:
                    return colorProvider.buttonSecondaryBackground

                case .tertiary:
                    return colorProvider.buttonQuietBackground

                case .critical:
                    return colorProvider.buttonNegativeBackground

                case .criticalTertiary:
                    return colorProvider.buttonNegativeQuietBackground

                case .utility:
                    return colorProvider.buttonUtilityBackground

                case .utilityTertiary:
                    return colorProvider.buttonUtilityQuietBackground

                case .utilityOverlay:
                    return colorProvider.buttonUtilityOverlayBackground
            }
        }
        
        /// <#Description#>
        var disabledBackgroundColor: Color {
            let colorProvider = Config.colorProvider

            switch self {
                case .primary:
                    return colorProvider.buttonDisabledBackground

                case .secondary:
                    return colorProvider.buttonDisabledBackground

                case .tertiary:
                    return colorProvider.buttonDisabledBackground

                case .critical:
                    return colorProvider.buttonDisabledBackground

                case .criticalTertiary:
                    return colorProvider.buttonDisabledBackground

                case .utility:
                    return colorProvider.buttonDisabledBackground

                case .utilityTertiary:
                    return colorProvider.buttonDisabledBackground

                case .utilityOverlay:
                    return colorProvider.buttonDisabledBackground
            }
        }
        
        /// <#Description#>
        var borderColor: Color {
            lazy var colorProvider = Config.colorProvider

            switch self {
                case .primary:
                    return colorProvider.buttonPrimaryBorder

                case .secondary:
                    return colorProvider.buttonSecondaryBorder

                case .tertiary:
                    return colorProvider.buttonQuietBackground

                case .critical:
                    return colorProvider.buttonNegativeBorder

                case .criticalTertiary:
                    return colorProvider.buttonNegativeQuietBorder

                case .utility:
                    return colorProvider.buttonUtilityBorder

                default:
                    return .clear
            }
        }
        
        /// <#Description#>
        var fontWeight: Font.Weight {
            switch self {
                case .utility, .utilityTertiary, .utilityOverlay:
                    return .regular

                default:
                    return .medium
            }
        }
        
        /// <#Description#>
        var fontSize: Font {
            switch self {
                case .utility, .utilityTertiary, .utilityOverlay:
                    return .caption

                default:
                    return .callout
            }
        }
        
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
        
        /// <#Description#>
        func verticalPadding(from size: Warp.ButtonSize) -> CGFloat {
            switch self {
                case .utility, .utilityTertiary, .utilityOverlay:
                    return 8

                default:
                    return size == .big ? 13 : 8
            }
        }
        
        /// <#Description#>
        func horizontalPadding(from size: Warp.ButtonSize) -> CGFloat {
            switch self {
                case .utility, .utilityTertiary, .utilityOverlay:
                    return 8

                default:
                    return size == .big ? 16 : 12
            }
        }
    }
}
