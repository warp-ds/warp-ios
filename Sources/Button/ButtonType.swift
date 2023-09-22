import Foundation
import struct SwiftUI.Color

public extension Warp {
    enum ButtonType: WarpButtonTypeColor {
        case primary,
             secondary,
             tertiary,
             critical,
             criticalTertiary,
             utility,
             utilityTertiary,
             utilityOverlay

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
    }
}

public enum WarpButtonType: WarpButtonTypeColor {
    case primary,
         secondary,
         tertiary,
         critical,
         criticalTertiary,
         utility,
         utilityTertiary,
         utilityOverlay

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
    }
