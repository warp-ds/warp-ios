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
                return colorProvider.token.textInverted
                
            case .secondary:
                return colorProvider.token.textLink
                
            case .tertiary:
                return colorProvider.token.textLink
                
            case .critical:
                return colorProvider.token.textInverted
                
            case .criticalTertiary:
                return colorProvider.token.textNegative
                
            case .utility:
                return colorProvider.token.text
                
            case .utilityTertiary:
                return colorProvider.token.text
                
            case .utilityOverlay:
                return colorProvider.token.text
            }
        }
        
        private var disabledForegroundColor: Color {
            return colorProvider.token.textInverted
        }
        
        /// Create foreground color based on button type for current state.
        func makeForegroundColor() -> Color {
            if isLoading {
                return colorProvider.token.text
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
                return colorProvider.token.background
                
            case .tertiary:
                return colorProvider.token.backgroundTransparent0
                
            case .critical:
                return colorProvider.token.backgroundNegative
                
            case .criticalTertiary:
                return colorProvider.token.backgroundTransparent0

            case .utility:
                return colorProvider.token.background
                
            case .utilityTertiary:
                return colorProvider.token.backgroundTransparent0

            case .utilityOverlay:
                return colorProvider.token.surfaceElevated300
            }
        }
        
        private var pressedBackgroundColor: Color {
            switch type {
            case .primary:
                return colorProvider.buttonPrimaryBackgroundActive
                
            case .secondary:
                return colorProvider.token.backgroundActive
                
            case .tertiary:
                return colorProvider.token.backgroundActive
                
            case .critical:
                return colorProvider.token.backgroundNegativeActive
                
            case .criticalTertiary:
                return colorProvider.token.backgroundNegativeSubtleActive
                
            case .utility:
                return colorProvider.token.backgroundActive
                
            case .utilityTertiary:
                return colorProvider.token.backgroundActive
                
            case .utilityOverlay:
                return colorProvider.token.surfaceElevated300Active
            }
        }
        
        private var disabledBackgroundColor: Color {
            return colorProvider.token.backgroundDisabled
        }
        
        /// Create background color based on button type for current state.
        func makeBackgroundColor(isPressed: Bool) -> Color {
            if isLoading {
                return colorProvider.token.backgroundTransparent0
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
            case .secondary, .utility:
                return colorProvider.token.border
                
            default:
                return colorProvider.token.backgroundTransparent0
            }
        }
        
        private var pressedBorderColor: Color {
            switch type {
            case .secondary, .utility:
                return colorProvider.token.borderActive
                
            default:
                return colorProvider.token.backgroundTransparent0
            }
        }
        
        private var disabledBorderColor: Color {
            return colorProvider.token.backgroundTransparent0
        }
        
        /// Create border color based on button type for current state.
        func makeBorderColor(isPressed: Bool) -> Color {
            if isLoading {
                return colorProvider.token.backgroundTransparent0
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
