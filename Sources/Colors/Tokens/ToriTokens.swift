import SwiftUI

/// Source: https://docs.google.com/spreadsheets/d/1Q-Tr_dwJVfxgh3527IFjXQKqtnPPM42QeIr-M6q-zu8/edit#gid=888578831
struct ToriTokenProvider: TokenProvider {
    /// Background
    public var background: Color { Color.dynamicColor(defaultColor: ToriColors.white, darkModeColor: ToriColors.black) }
    public var backgroundHover: Color { Color.dynamicColor(defaultColor: ToriColors.gray100, darkModeColor: ToriColors.gray800) }
    public var backgroundActive: Color { Color.dynamicColor(defaultColor: ToriColors.gray200, darkModeColor: ToriColors.gray900) }
    public var backgroundDisabled: Color { Color.dynamicColor(defaultColor: ToriColors.gray300, darkModeColor: ToriColors.gray700) }
    public var backgroundDisabledSubtle: Color { Color.dynamicColor(defaultColor: ToriColors.gray200, darkModeColor: ToriColors.gray900) }
    public var backgroundSubtle: Color { Color.dynamicColor(defaultColor: ToriColors.gray50, darkModeColor: ToriColors.gray900) }
    public var backgroundSubtleHover: Color { Color.dynamicColor(defaultColor: ToriColors.gray100, darkModeColor: ToriColors.gray800) }
    public var backgroundSubtleActive: Color { Color.dynamicColor(defaultColor: ToriColors.gray200, darkModeColor: ToriColors.gray900) }
    public var backgroundSelected: Color { Color.dynamicColor(defaultColor: ToriColors.blueberry50, darkModeColor: ToriColors.blueberry900) }
    public var backgroundSelectedHover: Color { Color.dynamicColor(defaultColor: ToriColors.blueberry100, darkModeColor: ToriColors.blueberry800) }
    public var backgroundSelectedActive: Color { Color.dynamicColor(defaultColor: ToriColors.blueberry200, darkModeColor: ToriColors.blueberry900) }
    
    public var backgroundInverted: Color { Color.dynamicColor(defaultColor: ToriColors.gray900, darkModeColor: ToriColors.gray50) }
    
    public var backgroundPrimary: Color { Color.dynamicColor(defaultColor: ToriColors.blueberry600, darkModeColor: ToriColors.blueberry500) }
    public var backgroundPrimaryHover: Color { Color.dynamicColor(defaultColor: ToriColors.blueberry700, darkModeColor: ToriColors.blueberry700) }
    public var backgroundPrimaryActive: Color { Color.dynamicColor(defaultColor: ToriColors.blueberry800, darkModeColor: ToriColors.blueberry800) }
    public var backgroundPrimarySubtle: Color { Color.dynamicColor(defaultColor: ToriColors.blueberry50, darkModeColor: ToriColors.blueberry900) }
    public var backgroundPrimarySubtleHover: Color { Color.dynamicColor(defaultColor: ToriColors.blueberry100, darkModeColor: ToriColors.blueberry800) }
    public var backgroundPrimarySubtleActive: Color { Color.dynamicColor(defaultColor: ToriColors.blueberry200, darkModeColor: ToriColors.blueberry900) }
    
    public var backgroundSecondary: Color { Color.dynamicColor(defaultColor: ToriColors.watermelon500, darkModeColor: ToriColors.watermelon500) }
    public var backgroundSecondaryHover: Color { Color.dynamicColor(defaultColor: ToriColors.watermelon600, darkModeColor: ToriColors.watermelon600) }
    public var backgroundSecondaryActive: Color { Color.dynamicColor(defaultColor: ToriColors.watermelon700, darkModeColor: ToriColors.watermelon700) }
    
    public var backgroundPositive: Color { Color.dynamicColor(defaultColor: ToriColors.green600, darkModeColor: ToriColors.green500) }
    public var backgroundPositiveHover: Color { Color.dynamicColor(defaultColor: ToriColors.green700, darkModeColor: ToriColors.green600) }
    public var backgroundPositiveActive: Color { Color.dynamicColor(defaultColor: ToriColors.green800, darkModeColor: ToriColors.green700) }
    public var backgroundPositiveSubtle: Color { Color.dynamicColor(defaultColor: ToriColors.green50, darkModeColor: ToriColors.green900) }
    public var backgroundPositiveSubtleHover: Color { Color.dynamicColor(defaultColor: ToriColors.green100, darkModeColor: ToriColors.green800) }
    public var backgroundPositiveSubtleActive: Color { Color.dynamicColor(defaultColor: ToriColors.green200, darkModeColor: ToriColors.green900) }
    public var backgroundPositiveSelected: Color { Color.dynamicColor(defaultColor: ToriColors.green50, darkModeColor: ToriColors.green900) }
    public var backgroundPositiveSelectedHover: Color { Color.dynamicColor(defaultColor: ToriColors.green100, darkModeColor: ToriColors.green800) }
    public var backgroundPositiveSelectedActive: Color { Color.dynamicColor(defaultColor: ToriColors.green200, darkModeColor: ToriColors.green900) }
    
    public var backgroundNegative: Color { Color.dynamicColor(defaultColor: ToriColors.red600, darkModeColor: ToriColors.red500) }
    public var backgroundNegativeHover: Color { Color.dynamicColor(defaultColor: ToriColors.red700, darkModeColor: ToriColors.red600) }
    public var backgroundNegativeActive: Color { Color.dynamicColor(defaultColor: ToriColors.red800, darkModeColor: ToriColors.red700) }
    public var backgroundNegativeSubtle: Color { Color.dynamicColor(defaultColor: ToriColors.red50, darkModeColor: ToriColors.red900) }
    public var backgroundNegativeSubtleHover: Color { Color.dynamicColor(defaultColor: ToriColors.red100, darkModeColor: ToriColors.red800) }
    public var backgroundNegativeSubtleActive: Color { Color.dynamicColor(defaultColor: ToriColors.red200, darkModeColor: ToriColors.red900) }
    public var backgroundNegativeSelected: Color { Color.dynamicColor(defaultColor: ToriColors.red50, darkModeColor: ToriColors.red900) }
    public var backgroundNegativeSelectedHover: Color { Color.dynamicColor(defaultColor: ToriColors.red100, darkModeColor: ToriColors.red800) }
    public var backgroundNegativeSelectedActive: Color { Color.dynamicColor(defaultColor: ToriColors.red200, darkModeColor: ToriColors.red900) }
    
    public var backgroundWarning: Color { Color.dynamicColor(defaultColor: ToriColors.yellow600, darkModeColor: ToriColors.yellow500) }
    public var backgroundWarningHover: Color { Color.dynamicColor(defaultColor: ToriColors.yellow700, darkModeColor: ToriColors.yellow600) }
    public var backgroundWarningActive: Color { Color.dynamicColor(defaultColor: ToriColors.yellow800, darkModeColor: ToriColors.yellow700) }
    public var backgroundWarningSubtle: Color { Color.dynamicColor(defaultColor: ToriColors.yellow50, darkModeColor: ToriColors.yellow900) }
    public var backgroundWarningSubtleHover: Color { Color.dynamicColor(defaultColor: ToriColors.yellow100, darkModeColor: ToriColors.yellow800) }
    public var backgroundWarningSubtleActive: Color { Color.dynamicColor(defaultColor: ToriColors.yellow200, darkModeColor: ToriColors.yellow900) }
    public var backgroundWarningSelected: Color { Color.dynamicColor(defaultColor: ToriColors.yellow50, darkModeColor: ToriColors.yellow900) }
    public var backgroundWarningSelectedHover: Color { Color.dynamicColor(defaultColor: ToriColors.yellow100, darkModeColor: ToriColors.yellow800) }
    public var backgroundWarningSelectedActive: Color { Color.dynamicColor(defaultColor: ToriColors.yellow200, darkModeColor: ToriColors.yellow900) }
    
    public var backgroundInfo: Color { Color.dynamicColor(defaultColor: ToriColors.blue600, darkModeColor: ToriColors.blue500) }
    public var backgroundInfoHover: Color { Color.dynamicColor(defaultColor: ToriColors.blue700, darkModeColor: ToriColors.blue600) }
    public var backgroundInfoActive: Color { Color.dynamicColor(defaultColor: ToriColors.blue800, darkModeColor: ToriColors.blue700) }
    public var backgroundInfoSubtle: Color { Color.dynamicColor(defaultColor: ToriColors.blue50, darkModeColor: ToriColors.blue900) }
    public var backgroundInfoSubtleHover: Color { Color.dynamicColor(defaultColor: ToriColors.blue100, darkModeColor: ToriColors.blue800) }
    public var backgroundInfoSubtleActive: Color { Color.dynamicColor(defaultColor: ToriColors.blue200, darkModeColor: ToriColors.blue900) }
    public var backgroundInfoSelected: Color { Color.dynamicColor(defaultColor: ToriColors.blue50, darkModeColor: ToriColors.blue500) }
    public var backgroundInfoSelectedHover: Color { Color.dynamicColor(defaultColor: ToriColors.blue100, darkModeColor: ToriColors.blue600) }
    public var backgroundInfoSelectedActive: Color { Color.dynamicColor(defaultColor: ToriColors.blue200, darkModeColor: ToriColors.blue500) }
    
    public var backgroundNotification: Color { Color.dynamicColor(defaultColor: ToriColors.red600, darkModeColor: ToriColors.red500) }
    
    /// Border
    public var border: Color { Color.dynamicColor(defaultColor: ToriColors.gray300, darkModeColor: ToriColors.gray600) }
    public var borderHover: Color { Color.dynamicColor(defaultColor: ToriColors.gray400, darkModeColor: ToriColors.gray700) }
    public var borderActive: Color { Color.dynamicColor(defaultColor: ToriColors.gray500, darkModeColor: ToriColors.gray800) }
    public var borderDisabled: Color { Color.dynamicColor(defaultColor: ToriColors.gray300, darkModeColor: ToriColors.gray300) }
    public var borderSelected: Color { Color.dynamicColor(defaultColor: ToriColors.blueberry600, darkModeColor: ToriColors.blueberry500) }
    public var borderSelectedHover: Color { Color.dynamicColor(defaultColor: ToriColors.blueberry700, darkModeColor: ToriColors.blueberry600) }
    public var borderSelectedActive: Color { Color.dynamicColor(defaultColor: ToriColors.blueberry800, darkModeColor: ToriColors.blueberry500) }
    public var borderFocus: Color { Color.dynamicColor(defaultColor: ToriColors.blue300, darkModeColor: ToriColors.blue300) }
    
    public var borderPrimary: Color { Color.dynamicColor(defaultColor: ToriColors.blueberry600, darkModeColor: ToriColors.blueberry500) }
    public var borderPrimaryHover: Color { Color.dynamicColor(defaultColor: ToriColors.blueberry700, darkModeColor: ToriColors.blueberry600) }
    public var borderPrimaryActive: Color { Color.dynamicColor(defaultColor: ToriColors.blueberry800, darkModeColor: ToriColors.blueberry700) }
    public var borderPrimarySubtle: Color { Color.dynamicColor(defaultColor: ToriColors.blueberry300, darkModeColor: ToriColors.blueberry700) }
    public var borderPrimarySubtleHover: Color { Color.dynamicColor(defaultColor: ToriColors.blueberry400, darkModeColor: ToriColors.blueberry800) }
    public var borderPrimarySubtleActive: Color { Color.dynamicColor(defaultColor: ToriColors.blueberry500, darkModeColor: ToriColors.blueberry900) }
    
    public var borderSecondary: Color { Color.dynamicColor(defaultColor: ToriColors.watermelon500, darkModeColor: ToriColors.watermelon500) }
    public var borderSecondaryHover: Color { Color.dynamicColor(defaultColor: ToriColors.watermelon600, darkModeColor: ToriColors.watermelon600) }
    public var borderSecondaryActive: Color { Color.dynamicColor(defaultColor: ToriColors.watermelon700, darkModeColor: ToriColors.watermelon700) }
    
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
    
    public var borderInfo: Color { Color.dynamicColor(defaultColor: ToriColors.blue600, darkModeColor: ToriColors.blue500) }
    public var borderInfoHover: Color { Color.dynamicColor(defaultColor: ToriColors.blue700, darkModeColor: ToriColors.blue600) }
    public var borderInfoActive: Color { Color.dynamicColor(defaultColor: ToriColors.blue800, darkModeColor: ToriColors.blue700) }
    public var borderInfoSubtle: Color { Color.dynamicColor(defaultColor: ToriColors.blue300, darkModeColor: ToriColors.blue700) }
    public var borderInfoSubtleHover: Color { Color.dynamicColor(defaultColor: ToriColors.blue400, darkModeColor: ToriColors.blue800) }
    public var borderInfoSubtleActive: Color { Color.dynamicColor(defaultColor: ToriColors.blue500, darkModeColor: ToriColors.blue900) }
    
    /// Icon
    public var icon: Color { Color.dynamicColor(defaultColor: ToriColors.gray900, darkModeColor: ToriColors.white) }
    public var iconHover: Color { Color.dynamicColor(defaultColor: ToriColors.gray900, darkModeColor: ToriColors.gray100) }
    public var iconActive: Color { Color.dynamicColor(defaultColor: ToriColors.gray900, darkModeColor: ToriColors.gray200) }
    public var iconSelected: Color { Color.dynamicColor(defaultColor: ToriColors.blueberry600, darkModeColor: ToriColors.blueberry500) }
    public var iconSelectedHover: Color { Color.dynamicColor(defaultColor: ToriColors.blueberry700, darkModeColor: ToriColors.blueberry600) }
    public var iconSelectedActive: Color { Color.dynamicColor(defaultColor: ToriColors.blueberry800, darkModeColor: ToriColors.blueberry500) }
    public var iconDisabled: Color { Color.dynamicColor(defaultColor: ToriColors.gray300, darkModeColor: ToriColors.gray600) }
    public var iconSubtle: Color { Color.dynamicColor(defaultColor: ToriColors.gray400, darkModeColor: ToriColors.gray100) }
    public var iconSubtleHover: Color { Color.dynamicColor(defaultColor: ToriColors.gray500, darkModeColor: ToriColors.gray200) }
    public var iconSubtleActive: Color { Color.dynamicColor(defaultColor: ToriColors.gray600, darkModeColor: ToriColors.gray300) }
    public var iconInverted: Color { Color.dynamicColor(defaultColor: ToriColors.white, darkModeColor: ToriColors.black) }
    public var iconInvertedHover: Color { Color.dynamicColor(defaultColor: ToriColors.gray100, darkModeColor: ToriColors.gray800) }
    public var iconInvertedActive: Color { Color.dynamicColor(defaultColor: ToriColors.gray200, darkModeColor: ToriColors.gray900) }
    public var iconPrimary: Color { Color.dynamicColor(defaultColor: ToriColors.blueberry600, darkModeColor: ToriColors.blueberry500) }
    public var iconSecondary: Color { Color.dynamicColor(defaultColor: ToriColors.watermelon500, darkModeColor: ToriColors.watermelon500) }
    public var iconSecondaryHover: Color { Color.dynamicColor(defaultColor: ToriColors.watermelon600, darkModeColor: ToriColors.watermelon600) }
    public var iconSecondaryActive: Color { Color.dynamicColor(defaultColor: ToriColors.watermelon700, darkModeColor: ToriColors.watermelon700) }
    public var iconPositive: Color { Color.dynamicColor(defaultColor: ToriColors.green600, darkModeColor: ToriColors.green500) }
    public var iconNegative: Color { Color.dynamicColor(defaultColor: ToriColors.red600, darkModeColor: ToriColors.red500) }
    public var iconWarning: Color { Color.dynamicColor(defaultColor: ToriColors.yellow600, darkModeColor: ToriColors.yellow500) }
    public var iconInfo: Color { Color.dynamicColor(defaultColor: ToriColors.blue600, darkModeColor: ToriColors.blue500) }
    
    public var iconNotification: Color { Color.dynamicColor(defaultColor: ToriColors.white, darkModeColor: ToriColors.white) }
    
    /// Text
    public var text: Color { Color.dynamicColor(defaultColor: ToriColors.gray900, darkModeColor: ToriColors.white) }
    public var textSubtle: Color { Color.dynamicColor(defaultColor: ToriColors.gray500, darkModeColor: ToriColors.gray100) }
    public var textPlaceholder: Color { Color.dynamicColor(defaultColor: ToriColors.gray300, darkModeColor: ToriColors.gray500) }
    public var textInverted: Color { Color.dynamicColor(defaultColor: ToriColors.white, darkModeColor: ToriColors.white) }
    public var textInvertedSubtle: Color { Color.dynamicColor(defaultColor: ToriColors.gray50, darkModeColor: ToriColors.gray800) }
    public var textLink: Color { Color.dynamicColor(defaultColor: ToriColors.blueberry600, darkModeColor: ToriColors.blueberry500) }
    public var textDisabled: Color { Color.dynamicColor(defaultColor: ToriColors.gray300, darkModeColor: ToriColors.gray500) }
    public var textNegative: Color { Color.dynamicColor(defaultColor: ToriColors.red600, darkModeColor: ToriColors.red500) }
    public var textPositive: Color { Color.dynamicColor(defaultColor: ToriColors.green600, darkModeColor: ToriColors.green500) }
    public var textNotification: Color { Color.dynamicColor(defaultColor: ToriColors.white, darkModeColor: ToriColors.white) }
}

struct ToriUITokenProvider: UITokenProvider {
    /// Background
    public var background: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.white, darkModeColor: ToriUIColors.black) }
    public var backgroundHover: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.gray100, darkModeColor: ToriUIColors.gray800) }
    public var backgroundActive: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.gray200, darkModeColor: ToriUIColors.gray900) }
    public var backgroundDisabled: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.gray300, darkModeColor: ToriUIColors.gray700) }
    public var backgroundDisabledSubtle: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.gray200, darkModeColor: ToriUIColors.gray900) }
    public var backgroundSubtle: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.gray50, darkModeColor: ToriUIColors.gray900) }
    public var backgroundSubtleHover: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.gray100, darkModeColor: ToriUIColors.gray800) }
    public var backgroundSubtleActive: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.gray200, darkModeColor: ToriUIColors.gray900) }
    public var backgroundSelected: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.blueberry50, darkModeColor: ToriUIColors.blueberry900) }
    public var backgroundSelectedHover: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.blueberry100, darkModeColor: ToriUIColors.blueberry800) }
    public var backgroundSelectedActive: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.blueberry200, darkModeColor: ToriUIColors.blueberry900) }
    
    public var backgroundInverted: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.gray900, darkModeColor: ToriUIColors.gray50) }
    
    public var backgroundPrimary: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.blueberry600, darkModeColor: ToriUIColors.blueberry500) }
    public var backgroundPrimaryHover: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.blueberry700, darkModeColor: ToriUIColors.blueberry700) }
    public var backgroundPrimaryActive: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.blueberry800, darkModeColor: ToriUIColors.blueberry800) }
    public var backgroundPrimarySubtle: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.blueberry50, darkModeColor: ToriUIColors.blueberry900) }
    public var backgroundPrimarySubtleHover: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.blueberry100, darkModeColor: ToriUIColors.blueberry800) }
    public var backgroundPrimarySubtleActive: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.blueberry200, darkModeColor: ToriUIColors.blueberry900) }
    
    public var backgroundSecondary: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.watermelon500, darkModeColor: ToriUIColors.watermelon500) }
    public var backgroundSecondaryHover: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.watermelon600, darkModeColor: ToriUIColors.watermelon600) }
    public var backgroundSecondaryActive: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.watermelon700, darkModeColor: ToriUIColors.watermelon700) }
    
    public var backgroundPositive: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.green600, darkModeColor: ToriUIColors.green500) }
    public var backgroundPositiveHover: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.green700, darkModeColor: ToriUIColors.green600) }
    public var backgroundPositiveActive: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.green800, darkModeColor: ToriUIColors.green700) }
    public var backgroundPositiveSubtle: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.green50, darkModeColor: ToriUIColors.green900) }
    public var backgroundPositiveSubtleHover: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.green100, darkModeColor: ToriUIColors.green800) }
    public var backgroundPositiveSubtleActive: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.green200, darkModeColor: ToriUIColors.green900) }
    public var backgroundPositiveSelected: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.green50, darkModeColor: ToriUIColors.green900) }
    public var backgroundPositiveSelectedHover: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.green100, darkModeColor: ToriUIColors.green800) }
    public var backgroundPositiveSelectedActive: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.green200, darkModeColor: ToriUIColors.green900) }
    
    public var backgroundNegative: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.red600, darkModeColor: ToriUIColors.red500) }
    public var backgroundNegativeHover: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.red700, darkModeColor: ToriUIColors.red600) }
    public var backgroundNegativeActive: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.red800, darkModeColor: ToriUIColors.red700) }
    public var backgroundNegativeSubtle: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.red50, darkModeColor: ToriUIColors.red900) }
    public var backgroundNegativeSubtleHover: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.red100, darkModeColor: ToriUIColors.red800) }
    public var backgroundNegativeSubtleActive: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.red200, darkModeColor: ToriUIColors.red900) }
    public var backgroundNegativeSelected: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.red50, darkModeColor: ToriUIColors.red900) }
    public var backgroundNegativeSelectedHover: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.red100, darkModeColor: ToriUIColors.red800) }
    public var backgroundNegativeSelectedActive: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.red200, darkModeColor: ToriUIColors.red900) }
    
    public var backgroundWarning: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.yellow600, darkModeColor: ToriUIColors.yellow500) }
    public var backgroundWarningHover: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.yellow700, darkModeColor: ToriUIColors.yellow600) }
    public var backgroundWarningActive: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.yellow800, darkModeColor: ToriUIColors.yellow700) }
    public var backgroundWarningSubtle: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.yellow50, darkModeColor: ToriUIColors.yellow900) }
    public var backgroundWarningSubtleHover: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.yellow100, darkModeColor: ToriUIColors.yellow800) }
    public var backgroundWarningSubtleActive: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.yellow200, darkModeColor: ToriUIColors.yellow900) }
    public var backgroundWarningSelected: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.yellow50, darkModeColor: ToriUIColors.yellow900) }
    public var backgroundWarningSelectedHover: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.yellow100, darkModeColor: ToriUIColors.yellow800) }
    public var backgroundWarningSelectedActive: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.yellow200, darkModeColor: ToriUIColors.yellow900) }
    
    public var backgroundInfo: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.blue600, darkModeColor: ToriUIColors.blue500) }
    public var backgroundInfoHover: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.blue700, darkModeColor: ToriUIColors.blue600) }
    public var backgroundInfoActive: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.blue800, darkModeColor: ToriUIColors.blue700) }
    public var backgroundInfoSubtle: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.blue50, darkModeColor: ToriUIColors.blue900) }
    public var backgroundInfoSubtleHover: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.blue100, darkModeColor: ToriUIColors.blue800) }
    public var backgroundInfoSubtleActive: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.blue200, darkModeColor: ToriUIColors.blue900) }
    public var backgroundInfoSelected: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.blue50, darkModeColor: ToriUIColors.blue500) }
    public var backgroundInfoSelectedHover: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.blue100, darkModeColor: ToriUIColors.blue600) }
    public var backgroundInfoSelectedActive: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.blue200, darkModeColor: ToriUIColors.blue500) }
    
    public var backgroundNotification: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.red600, darkModeColor: ToriUIColors.red500) }
    
    /// Border
    public var border: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.gray300, darkModeColor: ToriUIColors.gray600) }
    public var borderHover: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.gray400, darkModeColor: ToriUIColors.gray700) }
    public var borderActive: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.gray500, darkModeColor: ToriUIColors.gray800) }
    public var borderDisabled: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.gray300, darkModeColor: ToriUIColors.gray300) }
    public var borderSelected: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.blueberry600, darkModeColor: ToriUIColors.blueberry500) }
    public var borderSelectedHover: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.blueberry700, darkModeColor: ToriUIColors.blueberry600) }
    public var borderSelectedActive: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.blueberry800, darkModeColor: ToriUIColors.blueberry500) }
    public var borderFocus: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.blue300, darkModeColor: ToriUIColors.blue300) }
    
    public var borderPrimary: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.blueberry600, darkModeColor: ToriUIColors.blueberry500) }
    public var borderPrimaryHover: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.blueberry700, darkModeColor: ToriUIColors.blueberry600) }
    public var borderPrimaryActive: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.blueberry800, darkModeColor: ToriUIColors.blueberry700) }
    public var borderPrimarySubtle: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.blueberry300, darkModeColor: ToriUIColors.blueberry700) }
    public var borderPrimarySubtleHover: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.blueberry400, darkModeColor: ToriUIColors.blueberry800) }
    public var borderPrimarySubtleActive: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.blueberry500, darkModeColor: ToriUIColors.blueberry900) }
    
    public var borderSecondary: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.watermelon500, darkModeColor: ToriUIColors.watermelon500) }
    public var borderSecondaryHover: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.watermelon600, darkModeColor: ToriUIColors.watermelon600) }
    public var borderSecondaryActive: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.watermelon700, darkModeColor: ToriUIColors.watermelon700) }
    
    public var borderPositive: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.green600, darkModeColor: ToriUIColors.green500) }
    public var borderPositiveHover: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.green700, darkModeColor: ToriUIColors.green600) }
    public var borderPositiveActive: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.green800, darkModeColor: ToriUIColors.green700) }
    public var borderPositiveSubtle: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.green300, darkModeColor: ToriUIColors.green700) }
    public var borderPositiveSubtleHover: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.green400, darkModeColor: ToriUIColors.green800) }
    public var borderPositiveSubtleActive: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.green500, darkModeColor: ToriUIColors.green900) }
    
    public var borderNegative: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.red600, darkModeColor: ToriUIColors.red500) }
    public var borderNegativeHover: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.red700, darkModeColor: ToriUIColors.red600) }
    public var borderNegativeActive: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.red800, darkModeColor: ToriUIColors.red700) }
    public var borderNegativeSubtle: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.red300, darkModeColor: ToriUIColors.red700) }
    public var borderNegativeSubtleHover: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.red400, darkModeColor: ToriUIColors.red800) }
    public var borderNegativeSubtleActive: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.red500, darkModeColor: ToriUIColors.red900) }
    
    public var borderWarning: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.yellow600, darkModeColor: ToriUIColors.yellow500) }
    public var borderWarningHover: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.yellow700, darkModeColor: ToriUIColors.yellow600) }
    public var borderWarningActive: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.yellow800, darkModeColor: ToriUIColors.yellow700) }
    public var borderWarningSubtle: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.yellow300, darkModeColor: ToriUIColors.yellow700) }
    public var borderWarningSubtleHover: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.yellow400, darkModeColor: ToriUIColors.yellow800) }
    public var borderWarningSubtleActive: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.yellow500, darkModeColor: ToriUIColors.yellow900) }
    
    public var borderInfo: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.blue600, darkModeColor: ToriUIColors.blue500) }
    public var borderInfoHover: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.blue700, darkModeColor: ToriUIColors.blue600) }
    public var borderInfoActive: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.blue800, darkModeColor: ToriUIColors.blue700) }
    public var borderInfoSubtle: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.blue300, darkModeColor: ToriUIColors.blue700) }
    public var borderInfoSubtleHover: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.blue400, darkModeColor: ToriUIColors.blue800) }
    public var borderInfoSubtleActive: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.blue500, darkModeColor: ToriUIColors.blue900) }
    
    /// Icon
    public var icon: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.gray900, darkModeColor: ToriUIColors.white) }
    public var iconHover: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.gray900, darkModeColor: ToriUIColors.gray100) }
    public var iconActive: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.gray900, darkModeColor: ToriUIColors.gray200) }
    public var iconSelected: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.blueberry600, darkModeColor: ToriUIColors.blueberry500) }
    public var iconSelectedHover: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.blueberry700, darkModeColor: ToriUIColors.blueberry600) }
    public var iconSelectedActive: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.blueberry800, darkModeColor: ToriUIColors.blueberry500) }
    public var iconDisabled: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.gray300, darkModeColor: ToriUIColors.gray600) }
    public var iconSubtle: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.gray400, darkModeColor: ToriUIColors.gray100) }
    public var iconSubtleHover: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.gray500, darkModeColor: ToriUIColors.gray200) }
    public var iconSubtleActive: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.gray600, darkModeColor: ToriUIColors.gray300) }
    public var iconInverted: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.white, darkModeColor: ToriUIColors.black) }
    public var iconInvertedHover: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.gray100, darkModeColor: ToriUIColors.gray800) }
    public var iconInvertedActive: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.gray200, darkModeColor: ToriUIColors.gray900) }
    public var iconPrimary: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.blueberry600, darkModeColor: ToriUIColors.blueberry500) }
    public var iconSecondary: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.watermelon500, darkModeColor: ToriUIColors.watermelon500) }
    public var iconSecondaryHover: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.watermelon600, darkModeColor: ToriUIColors.watermelon600) }
    public var iconSecondaryActive: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.watermelon700, darkModeColor: ToriUIColors.watermelon700) }
    public var iconPositive: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.green600, darkModeColor: ToriUIColors.green500) }
    public var iconNegative: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.red600, darkModeColor: ToriUIColors.red500) }
    public var iconWarning: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.yellow600, darkModeColor: ToriUIColors.yellow500) }
    public var iconInfo: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.blue600, darkModeColor: ToriUIColors.blue500) }
    
    public var iconNotification: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.white, darkModeColor: ToriUIColors.white) }
    
    /// Text
    public var text: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.gray900, darkModeColor: ToriUIColors.white) }
    public var textSubtle: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.gray500, darkModeColor: ToriUIColors.gray100) }
    public var textPlaceholder: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.gray300, darkModeColor: ToriUIColors.gray500) }
    public var textInverted: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.white, darkModeColor: ToriUIColors.white) }
    public var textInvertedSubtle: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.gray50, darkModeColor: ToriUIColors.gray800) }
    public var textLink: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.blueberry600, darkModeColor: ToriUIColors.blueberry500) }
    public var textDisabled: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.gray300, darkModeColor: ToriUIColors.gray500) }
    public var textNegative: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.red600, darkModeColor: ToriUIColors.red500) }
    public var textPositive: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.green600, darkModeColor: ToriUIColors.green500) }
    public var textNotification: UIColor { UIColor.dynamicColor(defaultColor: ToriUIColors.white, darkModeColor: ToriUIColors.white) }
}
