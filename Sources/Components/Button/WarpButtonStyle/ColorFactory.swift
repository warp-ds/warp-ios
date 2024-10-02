import Foundation
import struct SwiftUI.Color

extension Warp.Button {
    /// Factory responsible for creating button, UI element color,
    /// based on button type and current state.
    struct ColorFactory {
        /// Button type.
        private let type: Warp.ButtonType

        /// Object responsible for providing colors in different environments and variants.
        private let colorProvider: ColorProvider

        /// Button state.
        /// Flag describing is button enabled for interactions.
        private let isEnabled: Bool
        
        /// Flag describing is button is in loading state.
        private let isLoading: Bool

        init(for type: Warp.ButtonType, consuming colorProvider: ColorProvider, isEnabled: Bool, isLoading: Bool) {
            self.type = type
            self.colorProvider = colorProvider
            self.isEnabled = isEnabled
            self.isLoading = isLoading
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
            if isLoading {
                return colorProvider.buttonLoadingText
            }

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
                    return colorProvider.buttonUtilityBackground
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
                    return colorProvider.buttonUtilityBackgroundActive
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

        /// Create background color based on button type for current state.
        func makeBackgroundColor(isPressed: Bool) -> Color {
            if isLoading {
                return .clear
            }

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
                    return colorProvider.buttonUtilityBorderActive
            }
        }

        private var disabledBorderColor: Color {
            return colorProvider.buttonDisabledQuietBorder
        }

        /// Create border color based on button type for current state.
        func makeBorderColor(isPressed: Bool) -> Color {
            if isLoading {
                return .clear
            }

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
