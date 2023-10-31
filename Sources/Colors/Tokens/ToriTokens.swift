import SwiftUI

/// Source: https://docs.google.com/spreadsheets/d/1Q-Tr_dwJVfxgh3527IFjXQKqtnPPM42QeIr-M6q-zu8/edit#gid=888578831
struct ToriTokenProvider: TokenProvider {
    /// Background
    public var background: Color { Color.dynamicColor(defaultColor: ToriColors.white, darkModeColor: ToriColors.black) }
    public var backgroundHover: Color { Color.dynamicColor(defaultColor: ToriColors.gray100, darkModeColor: ToriColors.gray800) }
    public var backgroundActive: Color { Color.dynamicColor(defaultColor: ToriColors.gray200, darkModeColor: ToriColors.gray900) }
    public var backgroundDisabled: Color { Color.dynamicColor(defaultColor: ToriColors.gray300, darkModeColor: ToriColors.gray700) }
    public var backgroundSubtle: Color { Color.dynamicColor(defaultColor: ToriColors.gray50, darkModeColor: ToriColors.gray900) }
    public var backgroundSubtleHover: Color { Color.dynamicColor(defaultColor: ToriColors.gray100, darkModeColor: ToriColors.gray800) }
    public var backgroundSubtleActive: Color { Color.dynamicColor(defaultColor: ToriColors.gray200, darkModeColor: ToriColors.gray900) }
    public var backgroundSelected: Color { Color.dynamicColor(defaultColor: ToriColors.petroleum50, darkModeColor: ToriColors.petroleum900) }
    public var backgroundSelectedHover: Color { Color.dynamicColor(defaultColor: ToriColors.petroleum100, darkModeColor: ToriColors.petroleum800) }
    
    public var backgroundInverted: Color { Color.dynamicColor(defaultColor: ToriColors.gray900, darkModeColor: ToriColors.gray50) }
    
    public var backgroundButtonPrimary: Color { Color.dynamicColor(defaultColor: ToriColors.watermelon600, darkModeColor: ToriColors.watermelon600) }
    public var backgroundPrimary: Color { Color.dynamicColor(defaultColor: ToriColors.petroleum600, darkModeColor: ToriColors.petroleum500) }
    public var backgroundPrimaryHover: Color { Color.dynamicColor(defaultColor: ToriColors.petroleum700, darkModeColor: ToriColors.petroleum700) }
    public var backgroundPrimaryActive: Color { Color.dynamicColor(defaultColor: ToriColors.petroleum800, darkModeColor: ToriColors.petroleum800) }
    public var backgroundPrimarySubtle: Color { Color.dynamicColor(defaultColor: ToriColors.petroleum50, darkModeColor: ToriColors.petroleum900) }
    public var backgroundPrimarySubtleHover: Color { Color.dynamicColor(defaultColor: ToriColors.petroleum100, darkModeColor: ToriColors.petroleum800) }
    public var backgroundPrimarySubtleActive: Color { Color.dynamicColor(defaultColor: ToriColors.petroleum200, darkModeColor: ToriColors.petroleum900) }
    
    public var backgroundPositive: Color { Color.dynamicColor(defaultColor: ToriColors.green600, darkModeColor: ToriColors.green500) }
    public var backgroundPositiveHover: Color { Color.dynamicColor(defaultColor: ToriColors.green700, darkModeColor: ToriColors.green600) }
    public var backgroundPositiveActive: Color { Color.dynamicColor(defaultColor: ToriColors.green800, darkModeColor: ToriColors.green700) }
    public var backgroundPositiveSubtle: Color { Color.dynamicColor(defaultColor: ToriColors.green50, darkModeColor: ToriColors.green900) }
    public var backgroundPositiveSubtleHover: Color { Color.dynamicColor(defaultColor: ToriColors.green100, darkModeColor: ToriColors.green800) }
    public var backgroundPositiveSubtleActive: Color { Color.dynamicColor(defaultColor: ToriColors.green200, darkModeColor: ToriColors.green900) }
    public var backgroundPositiveSelected: Color { Color.dynamicColor(defaultColor: ToriColors.green50, darkModeColor: ToriColors.green900) }
    public var backgroundPositiveSelectedHover: Color { Color.dynamicColor(defaultColor: ToriColors.green100, darkModeColor: ToriColors.green800) }
    
    public var backgroundNegative: Color { Color.dynamicColor(defaultColor: ToriColors.red600, darkModeColor: ToriColors.red500) }
    public var backgroundNegativeHover: Color { Color.dynamicColor(defaultColor: ToriColors.red700, darkModeColor: ToriColors.red600) }
    public var backgroundNegativeActive: Color { Color.dynamicColor(defaultColor: ToriColors.red800, darkModeColor: ToriColors.red700) }
    public var backgroundNegativeSubtle: Color { Color.dynamicColor(defaultColor: ToriColors.red50, darkModeColor: ToriColors.red900) }
    public var backgroundNegativeSubtleHover: Color { Color.dynamicColor(defaultColor: ToriColors.red100, darkModeColor: ToriColors.red800) }
    public var backgroundNegativeSubtleActive: Color { Color.dynamicColor(defaultColor: ToriColors.red200, darkModeColor: ToriColors.red900) }
    public var backgroundNegativeSelected: Color { Color.dynamicColor(defaultColor: ToriColors.red50, darkModeColor: ToriColors.red900) }
    public var backgroundNegativeSelectedHover: Color { Color.dynamicColor(defaultColor: ToriColors.red100, darkModeColor: ToriColors.red800) }
    
    public var backgroundWarning: Color { Color.dynamicColor(defaultColor: ToriColors.yellow600, darkModeColor: ToriColors.yellow500) }
    public var backgroundWarningHover: Color { Color.dynamicColor(defaultColor: ToriColors.yellow700, darkModeColor: ToriColors.yellow600) }
    public var backgroundWarningActive: Color { Color.dynamicColor(defaultColor: ToriColors.yellow800, darkModeColor: ToriColors.yellow700) }
    public var backgroundWarningSubtle: Color { Color.dynamicColor(defaultColor: ToriColors.yellow50, darkModeColor: ToriColors.yellow900) }
    public var backgroundWarningSubtleHover: Color { Color.dynamicColor(defaultColor: ToriColors.yellow100, darkModeColor: ToriColors.yellow800) }
    public var backgroundWarningSubtleActive: Color { Color.dynamicColor(defaultColor: ToriColors.yellow200, darkModeColor: ToriColors.yellow900) }
    public var backgroundWarningSelected: Color { Color.dynamicColor(defaultColor: ToriColors.yellow50, darkModeColor: ToriColors.yellow900) }
    public var backgroundWarningSelectedHover: Color { Color.dynamicColor(defaultColor: ToriColors.yellow100, darkModeColor: ToriColors.yellow800) }
    
    public var backgroundInfo: Color { Color.dynamicColor(defaultColor: ToriColors.petroleum600, darkModeColor: ToriColors.petroleum500) }
    public var backgroundInfoHover: Color { Color.dynamicColor(defaultColor: ToriColors.petroleum700, darkModeColor: ToriColors.petroleum600) }
    public var backgroundInfoActive: Color { Color.dynamicColor(defaultColor: ToriColors.petroleum800, darkModeColor: ToriColors.petroleum700) }
    public var backgroundInfoSubtle: Color { Color.dynamicColor(defaultColor: ToriColors.petroleum800, darkModeColor: ToriColors.petroleum900) }
    public var backgroundInfoSubtleHover: Color { Color.dynamicColor(defaultColor: ToriColors.petroleum100, darkModeColor: ToriColors.petroleum800) }
    public var backgroundInfoSubtleActive: Color { Color.dynamicColor(defaultColor: ToriColors.petroleum200, darkModeColor: ToriColors.petroleum900) }
    public var backgroundInfoSelected: Color { Color.dynamicColor(defaultColor: ToriColors.petroleum50, darkModeColor: ToriColors.petroleum500) }
    
    public var backgroundNotification: Color { Color.dynamicColor(defaultColor: ToriColors.red600, darkModeColor: ToriColors.red500) }
    
    /// Border
    public var border: Color { Color.dynamicColor(defaultColor: ToriColors.gray300, darkModeColor: ToriColors.gray600) }
    public var borderHover: Color { Color.dynamicColor(defaultColor: ToriColors.gray400, darkModeColor: ToriColors.gray700) }
    public var borderActive: Color { Color.dynamicColor(defaultColor: ToriColors.gray500, darkModeColor: ToriColors.gray800) }
    public var borderDisabled: Color { Color.dynamicColor(defaultColor: ToriColors.gray300, darkModeColor: ToriColors.gray300) }
    public var borderSelected: Color { Color.dynamicColor(defaultColor: ToriColors.watermelon600, darkModeColor: ToriColors.watermelon500) }
    public var borderSelectedHover: Color { Color.dynamicColor(defaultColor: ToriColors.petroleum700, darkModeColor: ToriColors.petroleum600) }
    
    public var borderButtonPrimary: Color { Color.dynamicColor(defaultColor: ToriColors.watermelon600, darkModeColor: ToriColors.watermelon500) }
    public var borderButtonSecondary: Color { Color.dynamicColor(defaultColor: ToriColors.petroleum600, darkModeColor: ToriColors.petroleum500) }
    public var borderPrimary: Color { Color.dynamicColor(defaultColor: ToriColors.petroleum600, darkModeColor: ToriColors.petroleum500) }
    public var borderPrimaryHover: Color { Color.dynamicColor(defaultColor: ToriColors.petroleum700, darkModeColor: ToriColors.petroleum600) }
    public var borderPrimaryActive: Color { Color.dynamicColor(defaultColor: ToriColors.petroleum800, darkModeColor: ToriColors.petroleum700) }
    public var borderPrimarySubtle: Color { Color.dynamicColor(defaultColor: ToriColors.petroleum300, darkModeColor: ToriColors.petroleum700) }
    public var borderPrimarySubtleHover: Color { Color.dynamicColor(defaultColor: ToriColors.petroleum400, darkModeColor: ToriColors.petroleum800) }
    public var borderPrimarySubtleActive: Color { Color.dynamicColor(defaultColor: ToriColors.petroleum500, darkModeColor: ToriColors.petroleum900) }
    
    public var borderPositive: Color { Color.dynamicColor(defaultColor: ToriColors.green600, darkModeColor: ToriColors.green500) }
    public var borderPositiveHover: Color { Color.dynamicColor(defaultColor: ToriColors.green700, darkModeColor: ToriColors.green600) }
    public var borderPositiveActive: Color { Color.dynamicColor(defaultColor: ToriColors.green800, darkModeColor: ToriColors.green700) }
    public var borderPositiveSubtle: Color { Color.dynamicColor(defaultColor: ToriColors.green300, darkModeColor: ToriColors.green700) }
    public var borderPositiveSubtleHover: Color { Color.dynamicColor(defaultColor: ToriColors.green400, darkModeColor: ToriColors.green800) }
    public var borderPositiveSubtleActive: Color { Color.dynamicColor(defaultColor: ToriColors.green500, darkModeColor: ToriColors.green900) }
    
    public var borderNegative: Color { Color.dynamicColor(defaultColor: ToriColors.red600, darkModeColor: ToriColors.red500) }
    public var borderNegativeHover: Color { Color.dynamicColor(defaultColor: ToriColors.red700, darkModeColor: ToriColors.red600) }
    public var borderNegativeActive: Color { Color.dynamicColor(defaultColor: ToriColors.red800, darkModeColor: ToriColors.red700) }
    public var borderNegativeSubtle: Color { Color.dynamicColor(defaultColor: ToriColors.red300, darkModeColor: ToriColors.red700) }
    public var borderNegativeSubtleHover: Color { Color.dynamicColor(defaultColor: ToriColors.red400, darkModeColor: ToriColors.red800) }
    public var borderNegativeSubtleActive: Color { Color.dynamicColor(defaultColor: ToriColors.red500, darkModeColor: ToriColors.red900) }
    
    public var borderWarning: Color { Color.dynamicColor(defaultColor: ToriColors.yellow600, darkModeColor: ToriColors.yellow500) }
    public var borderWarningHover: Color { Color.dynamicColor(defaultColor: ToriColors.yellow700, darkModeColor: ToriColors.yellow600) }
    public var borderWarningActive: Color { Color.dynamicColor(defaultColor: ToriColors.yellow800, darkModeColor: ToriColors.yellow700) }
    public var borderWarningSubtle: Color { Color.dynamicColor(defaultColor: ToriColors.yellow300, darkModeColor: ToriColors.yellow700) }
    public var borderWarningSubtleHover: Color { Color.dynamicColor(defaultColor: ToriColors.yellow400, darkModeColor: ToriColors.yellow800) }
    public var borderWarningSubtleActive: Color { Color.dynamicColor(defaultColor: ToriColors.yellow500, darkModeColor: ToriColors.yellow900) }
    
    public var borderInfo: Color { Color.dynamicColor(defaultColor: ToriColors.petroleum600, darkModeColor: ToriColors.petroleum500) }
    public var borderInfoHover: Color { Color.dynamicColor(defaultColor: ToriColors.petroleum700, darkModeColor: ToriColors.petroleum600) }
    public var borderInfoActive: Color { Color.dynamicColor(defaultColor: ToriColors.petroleum800, darkModeColor: ToriColors.petroleum700) }
    public var borderInfoSubtle: Color { Color.dynamicColor(defaultColor: ToriColors.petroleum300, darkModeColor: ToriColors.petroleum700) }
    public var borderInfoSubtleHover: Color { Color.dynamicColor(defaultColor: ToriColors.petroleum400, darkModeColor: ToriColors.petroleum800) }
    public var borderInfoSubtleActive: Color { Color.dynamicColor(defaultColor: ToriColors.petroleum500, darkModeColor: ToriColors.petroleum900) }
    
    /// Icon
    public var icon: Color { Color.dynamicColor(defaultColor: ToriColors.gray900, darkModeColor: ToriColors.white) }
    public var iconHover: Color { Color.dynamicColor(defaultColor: ToriColors.gray900, darkModeColor: ToriColors.gray100) }
    public var iconActive: Color { Color.dynamicColor(defaultColor: ToriColors.gray900, darkModeColor: ToriColors.gray200) }
    public var iconSelected: Color { Color.dynamicColor(defaultColor: ToriColors.petroleum600, darkModeColor: ToriColors.petroleum500) }
    public var iconSelectedHover: Color { Color.dynamicColor(defaultColor: ToriColors.petroleum700, darkModeColor: ToriColors.petroleum600) }
    public var iconDisabled: Color { Color.dynamicColor(defaultColor: ToriColors.gray300, darkModeColor: ToriColors.gray600) }
    public var iconSubtle: Color { Color.dynamicColor(defaultColor: ToriColors.gray400, darkModeColor: ToriColors.gray100) }
    public var iconSubtleHover: Color { Color.dynamicColor(defaultColor: ToriColors.gray500, darkModeColor: ToriColors.gray200) }
    public var iconSubtleActive: Color { Color.dynamicColor(defaultColor: ToriColors.gray600, darkModeColor: ToriColors.gray300) }
    public var iconInverted: Color { Color.dynamicColor(defaultColor: ToriColors.white, darkModeColor: ToriColors.black) }
    public var iconInvertedHover: Color { Color.dynamicColor(defaultColor: ToriColors.gray100, darkModeColor: ToriColors.gray800) }
    public var iconInvertedActive: Color { Color.dynamicColor(defaultColor: ToriColors.gray200, darkModeColor: ToriColors.gray900) }
    public var iconPrimary: Color { Color.dynamicColor(defaultColor: ToriColors.petroleum600, darkModeColor: ToriColors.petroleum500) }
    public var iconPositive: Color { Color.dynamicColor(defaultColor: ToriColors.green600, darkModeColor: ToriColors.green500) }
    public var iconNegative: Color { Color.dynamicColor(defaultColor: ToriColors.red600, darkModeColor: ToriColors.red500) }
    public var iconWarning: Color { Color.dynamicColor(defaultColor: ToriColors.yellow600, darkModeColor: ToriColors.yellow500) }
    public var iconInfo: Color { Color.dynamicColor(defaultColor: ToriColors.petroleum600, darkModeColor: ToriColors.petroleum500) }
    
    public var iconNotification: Color { Color.dynamicColor(defaultColor: ToriColors.white, darkModeColor: ToriColors.white) }
    
    /// Text
    public var text: Color { Color.dynamicColor(defaultColor: ToriColors.gray900, darkModeColor: ToriColors.white) }
    public var textSubtle: Color { Color.dynamicColor(defaultColor: ToriColors.gray500, darkModeColor: ToriColors.gray100) }
    public var textPlaceholder: Color { Color.dynamicColor(defaultColor: ToriColors.gray300, darkModeColor: ToriColors.gray500) }
    public var textInverted: Color { Color.dynamicColor(defaultColor: ToriColors.white, darkModeColor: ToriColors.white) }
    public var textInvertedSubtle: Color { Color.dynamicColor(defaultColor: ToriColors.gray50, darkModeColor: ToriColors.gray800) }
    public var textLink: Color { Color.dynamicColor(defaultColor: ToriColors.petroleum600, darkModeColor: ToriColors.petroleum500) }
    public var textDisabled: Color { Color.dynamicColor(defaultColor: ToriColors.gray300, darkModeColor: ToriColors.gray500) }
    public var textNegative: Color { Color.dynamicColor(defaultColor: ToriColors.red600, darkModeColor: ToriColors.red500) }
    public var textPositive: Color { Color.dynamicColor(defaultColor: ToriColors.green600, darkModeColor: ToriColors.green500) }
    public var textNotification: Color { Color.dynamicColor(defaultColor: ToriColors.white, darkModeColor: ToriColors.white) }
}
