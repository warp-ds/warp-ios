import Foundation
import SwiftUI

/// `SwiftUI` Button style that will transform button label style to `Warp` design style.
public struct WarpButtonStyle: ButtonStyle {
    /// <#Description#>
    private let colorFactory: Warp.Button.ColorFactory
    
    /// <#Description#>
    private let metricsFactory: Warp.Button.MetricsFactory
    
    /// <#Description#>
    private let typographyFactory: Warp.Button.TypographyFactory

    public init(
        type: Warp.ButtonType,
        size: Warp.ButtonSize,
        colorProvider: ColorProvider,
        isEnabled: Bool
    ) {
        colorFactory = Warp.Button.ColorFactory(
            for: type,
            consuming: colorProvider,
            isEnabled: isEnabled
        )

        metricsFactory = Warp.Button.MetricsFactory(
            type: type,
            size: size,
            isEnabled: isEnabled
        )

        typographyFactory = Warp.Button.TypographyFactory(type: type)
    }

    public func makeBody(configuration: Configuration) -> some View {
        let backgroundColor = colorFactory.makeBackgroundColor(
            isPressed: configuration.isPressed
        )

        let foregroundColor = colorFactory.makeForegroundColor()

        let overlayView = createOverlayView(isPressed: configuration.isPressed)

        return configuration
            .label
            .font(typographyFactory.font)
            .foregroundColor(foregroundColor)
            .padding(.vertical, metricsFactory.verticalPadding)
            .padding(.horizontal, metricsFactory.horizontalPadding)
            .background(backgroundColor)
            .overlay(overlayView)
            .cornerRadius(metricsFactory.cornerRadius)
            .shadow(
                color: colorFactory.makeShadowColor(),
                radius: metricsFactory.shadowRadius,
                y: metricsFactory.shadowY
            )
            .lineLimit(typographyFactory.lineLimit)
            .truncationMode(typographyFactory.truncationMode)
    }

    private func createOverlayView(isPressed: Bool) -> some View {
        let borderColor = colorFactory.makeBorderColor(isPressed: isPressed)

        return RoundedRectangle(cornerRadius: metricsFactory.cornerRadius)
            .stroke(
                borderColor,
                lineWidth: metricsFactory.borderWidth
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
    /// Factory responsible for resolving button internal element UI drawing needs.
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

extension Warp.Button {
    /// Factory responsible for creating button, UI element color,
    /// based on button type and current state.
    struct ColorFactory {
        /// Button type.
        private let type: Warp.ButtonType
        
        /// Object responsible for providing colors in different environments and variants.
        private let colorProvider: ColorProvider
        
        /// Flag describing is button enabled for interactions.
        private let isEnabled: Bool

        init(for type: Warp.ButtonType, consuming colorProvider: ColorProvider, isEnabled: Bool) {
            self.type = type
            self.colorProvider = colorProvider
            self.isEnabled = isEnabled
        }

        // MARK: Foreground color

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

        /// Create foreground color based on button type for current state.
        func makeForegroundColor() -> Color {
            if !isEnabled {
                return disabledForegroundColor
            }

            return normalForegroundColor
        }

        // MARK: Background color

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

        /// Create bacground color based on button type for current state.
        func makeBackgroundColor(isPressed: Bool) -> Color {
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

        /// Create border color based on button type for current state.
        func makeBorderColor(isPressed: Bool) -> Color {
            if !isEnabled {
                return disabledBorderColor
            }

            if isPressed {
                return pressedBorderColor
            }

            return normalBorderColor
        }
        
        /// Create shadow color based on button type.
        func makeShadowColor() -> Color {
            if type == .utilityOverlay {
                // TODO: R&D + Rework
                return FinnColors.gray700.opacity(0.5)
            }

            return .clear
        }
    }
}
