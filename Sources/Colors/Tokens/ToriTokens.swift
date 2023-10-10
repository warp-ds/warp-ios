import SwiftUI

/// Source: https://docs.google.com/spreadsheets/d/1Q-Tr_dwJVfxgh3527IFjXQKqtnPPM42QeIr-M6q-zu8/edit#gid=888578831
struct ToriTokenProvider: TokenProvider {
    /// Background
    var background: Color { Color.dynamicColor(defaultColor: ToriColors.white, darkModeColor: ToriColors.black) }
    var backgroundHover: Color { Color.dynamicColor(defaultColor: ToriColors.gray100, darkModeColor: ToriColors.gray800) }
    var backgroundActive: Color { Color.dynamicColor(defaultColor: ToriColors.gray200, darkModeColor: ToriColors.gray900) }
    var backgroundDisabled: Color { Color.dynamicColor(defaultColor: ToriColors.gray300, darkModeColor: ToriColors.gray700) }
    var backgroundSubtle: Color { Color.dynamicColor(defaultColor: ToriColors.gray50, darkModeColor: ToriColors.gray900) }
    var backgroundSubtleHover: Color { Color.dynamicColor(defaultColor: ToriColors.gray100, darkModeColor: ToriColors.gray800) }
    var backgroundSubtleActive: Color { Color.dynamicColor(defaultColor: ToriColors.gray200, darkModeColor: ToriColors.gray900) }
    var backgroundSelected: Color { Color.dynamicColor(defaultColor: ToriColors.petroleum50, darkModeColor: ToriColors.petroleum900) }
    var backgroundSelectedHover: Color { Color.dynamicColor(defaultColor: ToriColors.petroleum100, darkModeColor: ToriColors.petroleum800) }
                        
    var backgroundInverted: Color { Color.dynamicColor(defaultColor: ToriColors.gray900, darkModeColor: ToriColors.gray50) }
            
    var backgroundButtonPrimary: Color { Color.dynamicColor(defaultColor: ToriColors.watermelon600, darkModeColor: ToriColors.watermelon600) }
    var backgroundPrimary: Color { Color.dynamicColor(defaultColor: ToriColors.petroleum600, darkModeColor: ToriColors.petroleum500) }
    var backgroundPrimaryHover: Color { Color.dynamicColor(defaultColor: ToriColors.petroleum700, darkModeColor: ToriColors.petroleum700) }
    var backgroundPrimaryActive: Color { Color.dynamicColor(defaultColor: ToriColors.petroleum800, darkModeColor: ToriColors.petroleum800) }
    var backgroundPrimarySubtle: Color { Color.dynamicColor(defaultColor: ToriColors.petroleum50, darkModeColor: ToriColors.petroleum900) }
    var backgroundPrimarySubtleHover: Color { Color.dynamicColor(defaultColor: ToriColors.petroleum100, darkModeColor: ToriColors.petroleum800) }
    var backgroundPrimarySubtleActive: Color { Color.dynamicColor(defaultColor: ToriColors.petroleum200, darkModeColor: ToriColors.petroleum900) }
                        
    var backgroundPositive: Color { Color.dynamicColor(defaultColor: ToriColors.green600, darkModeColor: ToriColors.green500) }
    var backgroundPositiveHover: Color { Color.dynamicColor(defaultColor: ToriColors.green700, darkModeColor: ToriColors.green600) }
    var backgroundPositiveActive: Color { Color.dynamicColor(defaultColor: ToriColors.green800, darkModeColor: ToriColors.green700) }
    var backgroundPositiveSubtle: Color { Color.dynamicColor(defaultColor: ToriColors.green50, darkModeColor: ToriColors.green900) }
    var backgroundPositiveSubtleHover: Color { Color.dynamicColor(defaultColor: ToriColors.green100, darkModeColor: ToriColors.green800) }
    var backgroundPositiveSubtleActive: Color { Color.dynamicColor(defaultColor: ToriColors.green200, darkModeColor: ToriColors.green900) }
    var backgroundPositiveSelected: Color { Color.dynamicColor(defaultColor: ToriColors.green50, darkModeColor: ToriColors.green900) }
    var backgroundPositiveSelectedHover: Color { Color.dynamicColor(defaultColor: ToriColors.green100, darkModeColor: ToriColors.green800) }
                        
    var backgroundNegative: Color { Color.dynamicColor(defaultColor: ToriColors.red600, darkModeColor: ToriColors.red500) }
    var backgroundNegativeHover: Color { Color.dynamicColor(defaultColor: ToriColors.red700, darkModeColor: ToriColors.red600) }
    var backgroundNegativeActive: Color { Color.dynamicColor(defaultColor: ToriColors.red800, darkModeColor: ToriColors.red700) }
    var backgroundNegativeSubtle: Color { Color.dynamicColor(defaultColor: ToriColors.red50, darkModeColor: ToriColors.red900) }
    var backgroundNegativeSubtleHover: Color { Color.dynamicColor(defaultColor: ToriColors.red100, darkModeColor: ToriColors.red800) }
    var backgroundNegativeSubtleActive: Color { Color.dynamicColor(defaultColor: ToriColors.red200, darkModeColor: ToriColors.red900) }
    var backgroundNegativeSelected: Color { Color.dynamicColor(defaultColor: ToriColors.red50, darkModeColor: ToriColors.red900) }
    var backgroundNegativeSelectedHover: Color { Color.dynamicColor(defaultColor: ToriColors.red100, darkModeColor: ToriColors.red800) }
                        
    var backgroundWarning: Color { Color.dynamicColor(defaultColor: ToriColors.yellow600, darkModeColor: ToriColors.yellow500) }
    var backgroundWarningHover: Color { Color.dynamicColor(defaultColor: ToriColors.yellow700, darkModeColor: ToriColors.yellow600) }
    var backgroundWarningActive: Color { Color.dynamicColor(defaultColor: ToriColors.yellow800, darkModeColor: ToriColors.yellow700) }
    var backgroundWarningSubtle: Color { Color.dynamicColor(defaultColor: ToriColors.yellow50, darkModeColor: ToriColors.yellow900) }
    var backgroundWarningSubtleHover: Color { Color.dynamicColor(defaultColor: ToriColors.yellow100, darkModeColor: ToriColors.yellow800) }
    var backgroundWarningSubtleActive: Color { Color.dynamicColor(defaultColor: ToriColors.yellow200, darkModeColor: ToriColors.yellow900) }
    var backgroundWarningSelected: Color { Color.dynamicColor(defaultColor: ToriColors.yellow50, darkModeColor: ToriColors.yellow900) }
    var backgroundWarningSelectedHover: Color { Color.dynamicColor(defaultColor: ToriColors.yellow100, darkModeColor: ToriColors.yellow800) }
                        
    var backgroundInfo: Color { Color.dynamicColor(defaultColor: ToriColors.petroleum600, darkModeColor: ToriColors.petroleum500) }
    var backgroundInfoHover: Color { Color.dynamicColor(defaultColor: ToriColors.petroleum700, darkModeColor: ToriColors.petroleum600) }
    var backgroundInfoActive: Color { Color.dynamicColor(defaultColor: ToriColors.petroleum800, darkModeColor: ToriColors.petroleum700) }
    var backgroundInfoSubtle: Color { Color.dynamicColor(defaultColor: ToriColors.petroleum800, darkModeColor: ToriColors.petroleum900) }
    var backgroundInfoSubtleHover: Color { Color.dynamicColor(defaultColor: ToriColors.petroleum100, darkModeColor: ToriColors.petroleum800) }
    var backgroundInfoSubtleActive: Color { Color.dynamicColor(defaultColor: ToriColors.petroleum200, darkModeColor: ToriColors.petroleum900) }
    var backgroundInfoSelected: Color { Color.dynamicColor(defaultColor: ToriColors.petroleum50, darkModeColor: ToriColors.petroleum500) }
                        
    var backgroundNotification: Color { Color.dynamicColor(defaultColor: ToriColors.red600, darkModeColor: ToriColors.red500) }
                        
    /// Border
    var border: Color { Color.dynamicColor(defaultColor: ToriColors.gray300, darkModeColor: ToriColors.gray600) }
    var borderHover: Color { Color.dynamicColor(defaultColor: ToriColors.gray400, darkModeColor: ToriColors.gray700) }
    var borderActive: Color { Color.dynamicColor(defaultColor: ToriColors.gray500, darkModeColor: ToriColors.gray800) }
    var borderDisabled: Color { Color.dynamicColor(defaultColor: ToriColors.gray300, darkModeColor: ToriColors.gray300) }
    var borderSelected: Color { Color.dynamicColor(defaultColor: ToriColors.watermelon600, darkModeColor: ToriColors.watermelon500) }
    var borderSelectedHover: Color { Color.dynamicColor(defaultColor: ToriColors.petroleum700, darkModeColor: ToriColors.petroleum600) }
                        
    var borderButtonPrimary: Color { Color.dynamicColor(defaultColor: ToriColors.watermelon600, darkModeColor: ToriColors.watermelon500) }
    var borderButtonSecondary: Color { Color.dynamicColor(defaultColor: ToriColors.petroleum600, darkModeColor: ToriColors.petroleum500) }
    var borderPrimary: Color { Color.dynamicColor(defaultColor: ToriColors.petroleum600, darkModeColor: ToriColors.petroleum500) }
    var borderPrimaryHover: Color { Color.dynamicColor(defaultColor: ToriColors.petroleum700, darkModeColor: ToriColors.petroleum600) }
    var borderPrimaryActive: Color { Color.dynamicColor(defaultColor: ToriColors.petroleum800, darkModeColor: ToriColors.petroleum700) }
    var borderPrimarySubtle: Color { Color.dynamicColor(defaultColor: ToriColors.petroleum300, darkModeColor: ToriColors.petroleum700) }
    var borderPrimarySubtleHover: Color { Color.dynamicColor(defaultColor: ToriColors.petroleum400, darkModeColor: ToriColors.petroleum800) }
    var borderPrimarySubtleActive: Color { Color.dynamicColor(defaultColor: ToriColors.petroleum500, darkModeColor: ToriColors.petroleum900) }
                        
    var borderPositive: Color { Color.dynamicColor(defaultColor: ToriColors.green600, darkModeColor: ToriColors.green500) }
    var borderPositiveHover: Color { Color.dynamicColor(defaultColor: ToriColors.green700, darkModeColor: ToriColors.green600) }
    var borderPositiveActive: Color { Color.dynamicColor(defaultColor: ToriColors.green800, darkModeColor: ToriColors.green700) }
    var borderPositiveSubtle: Color { Color.dynamicColor(defaultColor: ToriColors.green300, darkModeColor: ToriColors.green700) }
    var borderPositiveSubtleHover: Color { Color.dynamicColor(defaultColor: ToriColors.green400, darkModeColor: ToriColors.green800) }
    var borderPositiveSubtleActive: Color { Color.dynamicColor(defaultColor: ToriColors.green500, darkModeColor: ToriColors.green900) }
                        
    var borderNegative: Color { Color.dynamicColor(defaultColor: ToriColors.red600, darkModeColor: ToriColors.red500) }
    var borderNegativeHover: Color { Color.dynamicColor(defaultColor: ToriColors.red700, darkModeColor: ToriColors.red600) }
    var borderNegativeActive: Color { Color.dynamicColor(defaultColor: ToriColors.red800, darkModeColor: ToriColors.red700) }
    var borderNegativeSubtle: Color { Color.dynamicColor(defaultColor: ToriColors.red300, darkModeColor: ToriColors.red700) }
    var borderNegativeSubtleHover: Color { Color.dynamicColor(defaultColor: ToriColors.red400, darkModeColor: ToriColors.red800) }
    var borderNegativeSubtleActive: Color { Color.dynamicColor(defaultColor: ToriColors.red500, darkModeColor: ToriColors.red900) }
                        
    var borderWarning: Color { Color.dynamicColor(defaultColor: ToriColors.yellow600, darkModeColor: ToriColors.yellow500) }
    var borderWarningHover: Color { Color.dynamicColor(defaultColor: ToriColors.yellow700, darkModeColor: ToriColors.yellow600) }
    var borderWarningActive: Color { Color.dynamicColor(defaultColor: ToriColors.yellow800, darkModeColor: ToriColors.yellow700) }
    var borderWarningSubtle: Color { Color.dynamicColor(defaultColor: ToriColors.yellow300, darkModeColor: ToriColors.yellow700) }
    var borderWarningSubtleHover: Color { Color.dynamicColor(defaultColor: ToriColors.yellow400, darkModeColor: ToriColors.yellow800) }
    var borderWarningSubtleActive: Color { Color.dynamicColor(defaultColor: ToriColors.yellow500, darkModeColor: ToriColors.yellow900) }
                        
    var borderInfo: Color { Color.dynamicColor(defaultColor: ToriColors.petroleum600, darkModeColor: ToriColors.petroleum500) }
    var borderInfoHover: Color { Color.dynamicColor(defaultColor: ToriColors.petroleum700, darkModeColor: ToriColors.petroleum600) }
    var borderInfoActive: Color { Color.dynamicColor(defaultColor: ToriColors.petroleum800, darkModeColor: ToriColors.petroleum700) }
    var borderInfoSubtle: Color { Color.dynamicColor(defaultColor: ToriColors.petroleum300, darkModeColor: ToriColors.petroleum700) }
    var borderInfoSubtleHover: Color { Color.dynamicColor(defaultColor: ToriColors.petroleum400, darkModeColor: ToriColors.petroleum800) }
    var borderInfoSubtleActive: Color { Color.dynamicColor(defaultColor: ToriColors.petroleum500, darkModeColor: ToriColors.petroleum900) }
                        
    /// Icon
    var icon: Color { Color.dynamicColor(defaultColor: ToriColors.gray900, darkModeColor: ToriColors.white) }
    var iconHover: Color { Color.dynamicColor(defaultColor: ToriColors.gray900, darkModeColor: ToriColors.gray100) }
    var iconActive: Color { Color.dynamicColor(defaultColor: ToriColors.gray900, darkModeColor: ToriColors.gray200) }
    var iconSelected: Color { Color.dynamicColor(defaultColor: ToriColors.petroleum600, darkModeColor: ToriColors.petroleum500) }
    var iconSelectedHover: Color { Color.dynamicColor(defaultColor: ToriColors.petroleum700, darkModeColor: ToriColors.petroleum600) }
    var iconDisabled: Color { Color.dynamicColor(defaultColor: ToriColors.gray300, darkModeColor: ToriColors.gray600) }
    var iconSubtle: Color { Color.dynamicColor(defaultColor: ToriColors.gray400, darkModeColor: ToriColors.gray100) }
    var iconSubtleHover: Color { Color.dynamicColor(defaultColor: ToriColors.gray500, darkModeColor: ToriColors.gray200) }
    var iconSubtleActive: Color { Color.dynamicColor(defaultColor: ToriColors.gray600, darkModeColor: ToriColors.gray300) }
    var iconInverted: Color { Color.dynamicColor(defaultColor: ToriColors.white, darkModeColor: ToriColors.black) }
    var iconInvertedHover: Color { Color.dynamicColor(defaultColor: ToriColors.gray100, darkModeColor: ToriColors.gray800) }
    var iconInvertedActive: Color { Color.dynamicColor(defaultColor: ToriColors.gray200, darkModeColor: ToriColors.gray900) }
    var iconPrimary: Color { Color.dynamicColor(defaultColor: ToriColors.petroleum600, darkModeColor: ToriColors.petroleum500) }
    var iconPositive: Color { Color.dynamicColor(defaultColor: ToriColors.green600, darkModeColor: ToriColors.green500) }
    var iconNegative: Color { Color.dynamicColor(defaultColor: ToriColors.red600, darkModeColor: ToriColors.red500) }
    var iconWarning: Color { Color.dynamicColor(defaultColor: ToriColors.yellow600, darkModeColor: ToriColors.yellow500) }
    var iconInfo: Color { Color.dynamicColor(defaultColor: ToriColors.petroleum600, darkModeColor: ToriColors.petroleum500) }
                        
    var iconNotification: Color { Color.dynamicColor(defaultColor: ToriColors.white, darkModeColor: ToriColors.white) }
                        
    /// Text
    var text: Color { Color.dynamicColor(defaultColor: ToriColors.gray900, darkModeColor: ToriColors.white) }
    var textSubtle: Color { Color.dynamicColor(defaultColor: ToriColors.gray500, darkModeColor: ToriColors.gray100) }
    var textPlaceholder: Color { Color.dynamicColor(defaultColor: ToriColors.gray300, darkModeColor: ToriColors.gray500) }
    var textInverted: Color { Color.dynamicColor(defaultColor: ToriColors.white, darkModeColor: ToriColors.white) }
    var textInvertedSubtle: Color { Color.dynamicColor(defaultColor: ToriColors.gray50, darkModeColor: ToriColors.gray800) }
    var textLink: Color { Color.dynamicColor(defaultColor: ToriColors.petroleum600, darkModeColor: ToriColors.petroleum500) }
    var textDisabled: Color { Color.dynamicColor(defaultColor: ToriColors.gray300, darkModeColor: ToriColors.gray500) }
    var textNegative: Color { Color.dynamicColor(defaultColor: ToriColors.red600, darkModeColor: ToriColors.red500) }
    var textPositive: Color { Color.dynamicColor(defaultColor: ToriColors.green600, darkModeColor: ToriColors.green500) }
    var textNotification: Color { Color.dynamicColor(defaultColor: ToriColors.white, darkModeColor: ToriColors.white) }
}
