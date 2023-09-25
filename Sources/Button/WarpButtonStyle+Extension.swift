import Foundation
import SwiftUI

/// `SwiftUI` Button style that will transform button label style to `Warp` design style.
public struct WarpButtonStyle: ButtonStyle {
    /// <#Description#>
    private let type: Warp.ButtonType

    /// <#Description#>
    private let size: Warp.ButtonSize
    
    /// <#Description#>
    private let isEnabled: Bool
    
    /// <#Description#>
    private let colorProvider: ColorProvider

    public init(
        type: Warp.ButtonType,
        size: Warp.ButtonSize,
        colorProvider: ColorProvider,
        isEnabled: Bool
    ) {
        self.type = type
        self.size = size
        self.colorProvider = colorProvider
        self.isEnabled = isEnabled
    }

    private var backgroundColor: Color {
        if isEnabled {
            return type.backgroundColor
        }

        return type.disabledBackgroundColor
    }

    private var pressedBackgroundColor: Color {
        type.pressedBackgroundColor
    }

    private var foregroundColor: Color {
        if isEnabled {
            return type.foregroundColor
        }

        return type.disabledForegroundColor
    }

    private var borderColor: Color {
        if isEnabled {
            return type.borderColor
        }

        return colorProvider.buttonDisabledQuietBorder
    }

    private var pressedBorderColor: Color {
        return type.pressedBorderColor
    }

    private var shadowRadius: CGFloat {
        switch type {
            case .utilityOverlay:
                return isEnabled ? 2: 0

            default:
                return 0
        }
    }

    private var shadowY: CGFloat {
        switch type {
            case .utilityOverlay:
                return isEnabled ? 1: 0

            default:
                return 0
        }
    }

    private var lineLimit: Int {
        /*type == .critical ? Int.max : */
        1
    }

    private var truncationMode: Text.TruncationMode {
        /*type == .primary ? .tail : */
        .middle
    }

    public func makeBody(configuration: Configuration) -> some View {
        let _backgroundColor = {
            if configuration.isPressed {
                return pressedBackgroundColor
            }

            return backgroundColor
        }()

        let overlayView = createOverlayView(isPressed: configuration.isPressed)

        return configuration
            .label
            .foregroundColor(foregroundColor)
            .padding(.vertical, type.verticalPadding(from: size))
            .padding(.horizontal, type.horizontalPadding(from: size))
            .background(_backgroundColor)
            .overlay(overlayView)
            .cornerRadius(type.cornerRadius)
            .shadow(
                color: FinnColors.gray700.opacity(0.5),
                radius: shadowRadius,
                y: shadowY
            )
            .lineLimit(lineLimit)
            .truncationMode(truncationMode)
    }

    private func createOverlayView(isPressed: Bool) -> some View {
        let _borderColor = {
            if isPressed {
                return pressedBorderColor
            }

            return borderColor
        }()

        return RoundedRectangle(cornerRadius: type.cornerRadius)
            .stroke(
                _borderColor,
                lineWidth: type.borderWidth
            )
    }
}

/// Syntactic sugar to ease using warp button style.
public extension ButtonStyle where Self == WarpButtonStyle {
    static func warp(
        type: Warp.ButtonType,
        size: Warp.ButtonSize,
        colorProvider: ColorProvider,
        isEnabled: Bool
    ) -> Self {
        return WarpButtonStyle(
            type: type,
            size: size,
            colorProvider: colorProvider,
            isEnabled: isEnabled
        )
    }
}

extension Warp.Button {
    struct TypographyFactory {
        private let type: Warp.ButtonType

        init(type: Warp.ButtonType) {
            self.type = type
        }

        /// <#Description#>
        var font: Font {
            let font: Font

            if type.isUtilityRelatedButton {
                font = .caption
            } else {
                font = .callout
            }

            return font.weight(fontWeight)
        }

        private var fontWeight: Font.Weight {
            if type.isUtilityRelatedButton {
                return .regular
            }

            return .medium
        }
        
        /// <#Description#>
        var lineLimit: Int {
            /*type == .critical ? Int.max : */
            1
        }
        
        /// <#Description#>
        var truncationMode: Text.TruncationMode {
            /*type == .primary ? .tail : */
            .middle
        }
    }
}

extension Warp.Button {
    struct MetricsFactory {
        private let type: Warp.ButtonType

        private let size: Warp.ButtonSize

        private let isEnabled: Bool

        init(type: Warp.ButtonType, size: Warp.ButtonSize, isEnabled: Bool) {
            self.type = type
            self.size = size
            self.isEnabled = isEnabled
        }
        
        /// <#Description#>
        var shadowRadius: CGFloat {
            switch type {
                case .utilityOverlay:
                    return isEnabled ? 2: 0

                default:
                    return 0
            }
        }
        
        /// <#Description#>
        var shadowY: CGFloat {
            switch type {
                case .utilityOverlay:
                    return isEnabled ? 1: 0

                default:
                    return 0
            }
        }

        /// <#Description#>
        var borderWidth: CGFloat {
            switch type {
                case .utility:
                    return 2

                default:
                    return 4
            }
        }

        /// <#Description#>
        var cornerRadius: CGFloat {
            switch type {
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
        var verticalPadding: CGFloat {
            if type.isUtilityRelatedButton {
                return utilityButtonDefaultPadding
            }

            if size == .big {
                return 13
            }

            return 8
        }

        /// Button label horizontal margin.
        var horizontalPadding: CGFloat {
            if type.isUtilityRelatedButton {
                return utilityButtonDefaultPadding
            }

            if size == .big {
                return 16
            }

            return 12
        }
    }
}

// ColorProviderProxy
extension Warp.Button {
    struct ColorFactory {
        private let type: Warp.ButtonType

        private let colorProvider: ColorProvider

        init(for type: Warp.ButtonType, consuming colorProvider: ColorProvider) {
            self.type = type
            self.colorProvider = colorProvider
        }

        // MARK: Foreground color

        /// <#Description#>
        private var normalForegroundColor: Color {
            switch type {
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
        private var disabledForegroundColor: Color {
            switch type {
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

        func makeForegroundColor(isEnabled: Bool) -> Color {
            if !isEnabled {
                return disabledForegroundColor
            }

            return normalForegroundColor
        }

        // MARK: Background color

        /// <#Description#>
        private var normalBackgroundColor: Color {
            switch type {
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
        private var pressedBackgroundColor: Color {
            switch type {
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
        private var disabledBackgroundColor: Color {
            switch type {
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

        func makeBackgroundColor(isEnabled: Bool, isPressed: Bool) -> Color {
            if !isEnabled {
                return disabledBackgroundColor
            }

            if isPressed {
                return pressedBackgroundColor
            }

            return normalBackgroundColor
        }

        // MARK: Border color

        private var normalBorderColor: Color {
            switch type {
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

        private var pressedBorderColor: Color {
            switch type {
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

        private var disabledBorderColor: Color {
            return colorProvider.buttonDisabledQuietBorder
        }

        /// <#Description#>
        func makeBorderColor(isEnabled: Bool, isPressed: Bool) -> Color {
            if !isEnabled {
                return disabledBorderColor
            }

            if isPressed {
                return pressedBorderColor
            }

            return normalBorderColor
        }
    }
}
