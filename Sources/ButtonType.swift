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
    }
}

// MARK: Color factory
extension Warp.ButtonType {
    /// <#Description#>
    func makeForegroundColor(consuming colorProvider: ColorProvider) -> Color {
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
    func makeDisabledForegroundColor(consuming colorProvider: ColorProvider) -> Color {
        switch self {
            case .primary:
                return colorProvider.buttonPrimaryTextDisabled

            case .secondary:
                return colorProvider.buttonDisabledText
                // Wrong color palette, using default.
                // return colorProvider.buttonSecondaryTextDisabled

            case .tertiary:
                return colorProvider.buttonDisabledText
                // Wrong color palette, using default.
                // return colorProvider.buttonDisabledQuietText

            case .critical, .criticalTertiary:
                return colorProvider.buttonDisabledText

            case .utility, .utilityTertiary, .utilityOverlay:
                return colorProvider.buttonDisabledText
                // Wrong color palette, using default.
                //return colorProvider.buttonUtilityTextDisabled
        }
    }

    /// <#Description#>
    func makeBackgroundColor(consuming colorProvider: ColorProvider) -> Color {
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
    func makePressedBackgroundColor(consuming colorProvider: ColorProvider) -> Color {
        switch self {
            case .primary:
                return colorProvider.buttonPrimaryBackgroundActive

            case .secondary:
                return colorProvider.buttonSecondaryBackgroundActive

            case .tertiary:
                return colorProvider.buttonQuietBackgroundActive

            case .critical:
                return colorProvider.buttonNegativeBackgroundActive

            case .criticalTertiary:
                return colorProvider.buttonNegativeQuietBackgroundActive

            case .utility:
                return colorProvider.buttonUtilityBackgroundActive

            case .utilityTertiary:
                return colorProvider.buttonUtilityQuietBackgroundActive

            case .utilityOverlay:
                return colorProvider.buttonUtilityOverlayBackground
        }
    }

    /// <#Description#>
    func makeDisabledBackgroundColor(consuming colorProvider: ColorProvider) -> Color {
        switch self {
            case .primary:
                return colorProvider.buttonPrimaryBackgroundDisabled

            case .secondary:
                return colorProvider.buttonSecondaryBackgroundDisabled

            case .tertiary, .critical, .criticalTertiary:
                return colorProvider.buttonDisabledBackground

            case .utility, .utilityTertiary, .utilityOverlay:
                return colorProvider.buttonUtilityBackgroundDisabled
        }
    }

    /// <#Description#>
    func makeBorderColor(consuming colorProvider: ColorProvider) -> Color {
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
    func makePressedBorderColor(consuming colorProvider: ColorProvider) -> Color {
        switch self {
            case .primary:
                return colorProvider.buttonPrimaryBorderActive

            case .secondary:
                return colorProvider.buttonSecondaryBorderActive

            case .tertiary:
                return .clear

            case .critical:
                return colorProvider.buttonNegativeBorderActive

            case .criticalTertiary:
                return colorProvider.buttonNegativeQuietBorderActive

            case .utility:
                return colorProvider.buttonUtilityBorderActive

            case .utilityTertiary:
                return colorProvider.buttonUtilityQuietBorderActive

            case .utilityOverlay:
                return colorProvider.buttonUtilityOverlayBackground
        }
    }
}

// MARK: Typography

extension Warp.ButtonType {
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
