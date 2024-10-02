import SwiftUI

/// Source: https://docs.google.com/spreadsheets/d/1Q-Tr_dwJVfxgh3527IFjXQKqtnPPM42QeIr-M6q-zu8/edit#gid=888578831
struct BlocketTokenProvider: TokenProvider {
    /// Surface
    public var surfaceSunken: Color { Color.dynamicColor(defaultColor: BlocketColors.gray50, darkModeColor: BlocketColors.gray950) }
    public var surfaceElevated100: Color { Color.dynamicColor(defaultColor: BlocketColors.white, darkModeColor: BlocketColors.gray850) }
    public var surfaceElevated100Hover: Color { Color.dynamicColor(defaultColor: BlocketColors.gray100, darkModeColor: BlocketColors.gray800) }
    public var surfaceElevated100Active: Color { Color.dynamicColor(defaultColor: BlocketColors.gray200, darkModeColor: BlocketColors.gray750) }
    public var surfaceElevated200: Color { Color.dynamicColor(defaultColor: BlocketColors.white, darkModeColor: BlocketColors.gray800) }
    public var surfaceElevated200Hover: Color { Color.dynamicColor(defaultColor: BlocketColors.gray100, darkModeColor: BlocketColors.gray750) }
    public var surfaceElevated200Active: Color { Color.dynamicColor(defaultColor: BlocketColors.gray200, darkModeColor: BlocketColors.gray700) }
    public var surfaceElevated300: Color { Color.dynamicColor(defaultColor: BlocketColors.white, darkModeColor: BlocketColors.gray750) }
    public var surfaceElevated300Hover: Color { Color.dynamicColor(defaultColor: BlocketColors.gray100, darkModeColor: BlocketColors.gray700) }
    public var surfaceElevated300Active: Color { Color.dynamicColor(defaultColor: BlocketColors.gray200, darkModeColor: BlocketColors.gray600) }
    
    
    /// Background
    public var background: Color { Color.dynamicColor(defaultColor: BlocketColors.white, darkModeColor: BlocketColors.gray900) }
    public var backgroundHover: Color { Color.dynamicColor(defaultColor: BlocketColors.gray100, darkModeColor: BlocketColors.gray850) }
    public var backgroundActive: Color { Color.dynamicColor(defaultColor: BlocketColors.gray200, darkModeColor: BlocketColors.gray800) }
    public var backgroundDisabled: Color { Color.dynamicColor(defaultColor: BlocketColors.gray300, darkModeColor: BlocketColors.gray700) }
    public var backgroundDisabledSubtle: Color { Color.dynamicColor(defaultColor: BlocketColors.gray200, darkModeColor: BlocketColors.gray600) }
    public var backgroundSubtle: Color { Color.dynamicColor(defaultColor: BlocketColors.gray100, darkModeColor: BlocketColors.gray750) }
    public var backgroundSubtleHover: Color { Color.dynamicColor(defaultColor: BlocketColors.gray200, darkModeColor: BlocketColors.gray700) }
    public var backgroundSubtleActive: Color { Color.dynamicColor(defaultColor: BlocketColors.gray300, darkModeColor: BlocketColors.gray600) }
    public var backgroundSelected: Color { Color.dynamicColor(defaultColor: BlocketColors.blue50, darkModeColor: BlocketColors.blue900) }
    public var backgroundSelectedHover: Color { Color.dynamicColor(defaultColor: BlocketColors.blue100, darkModeColor: BlocketColors.blue800) }
    public var backgroundSelectedActive: Color { Color.dynamicColor(defaultColor: BlocketColors.blue200, darkModeColor: BlocketColors.blue700) }
    
    public var backgroundInverted: Color { Color.dynamicColor(defaultColor: BlocketColors.gray900, darkModeColor: BlocketColors.gray50) }
    
    public var backgroundPrimary: Color { Color.dynamicColor(defaultColor: BlocketColors.blue600, darkModeColor: BlocketColors.blue400) }
    public var backgroundPrimaryHover: Color { Color.dynamicColor(defaultColor: BlocketColors.blue700, darkModeColor: BlocketColors.blue300) }
    public var backgroundPrimaryActive: Color { Color.dynamicColor(defaultColor: BlocketColors.blue800, darkModeColor: BlocketColors.blue200) }
    public var backgroundPrimarySubtle: Color { Color.dynamicColor(defaultColor: BlocketColors.blue50, darkModeColor: BlocketColors.blue800) }
    public var backgroundPrimarySubtleHover: Color { Color.dynamicColor(defaultColor: BlocketColors.blue100, darkModeColor: BlocketColors.blue700) }
    public var backgroundPrimarySubtleActive: Color { Color.dynamicColor(defaultColor: BlocketColors.blue200, darkModeColor: BlocketColors.blue600) }
    
    public var backgroundSecondary: Color { Color.dynamicColor(defaultColor: BlocketColors.coral500, darkModeColor: BlocketColors.coral500) }
    public var backgroundSecondaryHover: Color { Color.dynamicColor(defaultColor: BlocketColors.coral600, darkModeColor: BlocketColors.coral400) }
    public var backgroundSecondaryActive: Color { Color.dynamicColor(defaultColor: BlocketColors.coral700, darkModeColor: BlocketColors.coral300) }
    
    public var backgroundPositive: Color { Color.dynamicColor(defaultColor: BlocketColors.green600, darkModeColor: BlocketColors.green500) }
    public var backgroundPositiveHover: Color { Color.dynamicColor(defaultColor: BlocketColors.green700, darkModeColor: BlocketColors.green400) }
    public var backgroundPositiveActive: Color { Color.dynamicColor(defaultColor: BlocketColors.green800, darkModeColor: BlocketColors.green300) }
    public var backgroundPositiveSubtle: Color { Color.dynamicColor(defaultColor: BlocketColors.green50, darkModeColor: BlocketColors.green900) }
    public var backgroundPositiveSubtleHover: Color { Color.dynamicColor(defaultColor: BlocketColors.green100, darkModeColor: BlocketColors.green800) }
    public var backgroundPositiveSubtleActive: Color { Color.dynamicColor(defaultColor: BlocketColors.green200, darkModeColor: BlocketColors.green700) }
    
    public var backgroundNegative: Color { Color.dynamicColor(defaultColor: BlocketColors.red600, darkModeColor: BlocketColors.red300) }
    public var backgroundNegativeHover: Color { Color.dynamicColor(defaultColor: BlocketColors.red700, darkModeColor: BlocketColors.red200) }
    public var backgroundNegativeActive: Color { Color.dynamicColor(defaultColor: BlocketColors.red800, darkModeColor: BlocketColors.red100) }
    public var backgroundNegativeSubtle: Color { Color.dynamicColor(defaultColor: BlocketColors.red50, darkModeColor: BlocketColors.red900) }
    public var backgroundNegativeSubtleHover: Color { Color.dynamicColor(defaultColor: BlocketColors.red100, darkModeColor: BlocketColors.red800) }
    public var backgroundNegativeSubtleActive: Color { Color.dynamicColor(defaultColor: BlocketColors.red200, darkModeColor: BlocketColors.red700) }
    
    public var backgroundWarning: Color { Color.dynamicColor(defaultColor: BlocketColors.yellow600, darkModeColor: BlocketColors.yellow500) }
    public var backgroundWarningHover: Color { Color.dynamicColor(defaultColor: BlocketColors.yellow700, darkModeColor: BlocketColors.yellow400) }
    public var backgroundWarningActive: Color { Color.dynamicColor(defaultColor: BlocketColors.yellow800, darkModeColor: BlocketColors.yellow300) }
    public var backgroundWarningSubtle: Color { Color.dynamicColor(defaultColor: BlocketColors.yellow50, darkModeColor: BlocketColors.yellow900) }
    public var backgroundWarningSubtleHover: Color { Color.dynamicColor(defaultColor: BlocketColors.yellow100, darkModeColor: BlocketColors.yellow800) }
    public var backgroundWarningSubtleActive: Color { Color.dynamicColor(defaultColor: BlocketColors.yellow200, darkModeColor: BlocketColors.yellow700) }
    
    public var backgroundInfo: Color { Color.dynamicColor(defaultColor: BlocketColors.blue600, darkModeColor: BlocketColors.blue500) }
    public var backgroundInfoHover: Color { Color.dynamicColor(defaultColor: BlocketColors.blue700, darkModeColor: BlocketColors.blue400) }
    public var backgroundInfoActive: Color { Color.dynamicColor(defaultColor: BlocketColors.blue800, darkModeColor: BlocketColors.blue300) }
    public var backgroundInfoSubtle: Color { Color.dynamicColor(defaultColor: BlocketColors.blue50, darkModeColor: BlocketColors.blue900) }
    public var backgroundInfoSubtleHover: Color { Color.dynamicColor(defaultColor: BlocketColors.blue100, darkModeColor: BlocketColors.blue800) }
    public var backgroundInfoSubtleActive: Color { Color.dynamicColor(defaultColor: BlocketColors.blue200, darkModeColor: BlocketColors.blue700) }
    
    public var backgroundNotification: Color { Color.dynamicColor(defaultColor: BlocketColors.coral600, darkModeColor: BlocketColors.coral500) }
    
    
    /// Border
    public var border: Color { Color.dynamicColor(defaultColor: BlocketColors.gray300, darkModeColor: BlocketColors.gray600) }
    public var borderHover: Color { Color.dynamicColor(defaultColor: BlocketColors.gray400, darkModeColor: BlocketColors.gray500) }
    public var borderActive: Color { Color.dynamicColor(defaultColor: BlocketColors.gray500, darkModeColor: BlocketColors.gray400) }
    public var borderDisabled: Color { Color.dynamicColor(defaultColor: BlocketColors.gray300, darkModeColor: BlocketColors.gray700) }
    public var borderSelected: Color { Color.dynamicColor(defaultColor: BlocketColors.blue600, darkModeColor: BlocketColors.blue400) }
    public var borderSelectedHover: Color { Color.dynamicColor(defaultColor: BlocketColors.blue700, darkModeColor: BlocketColors.blue300) }
    public var borderSelectedActive: Color { Color.dynamicColor(defaultColor: BlocketColors.blue800, darkModeColor: BlocketColors.blue200) }
    public var borderFocus: Color { Color.dynamicColor(defaultColor: BlocketColors.blue300, darkModeColor: BlocketColors.blue300) }
    
    public var borderPrimary: Color { Color.dynamicColor(defaultColor: BlocketColors.blue600, darkModeColor: BlocketColors.blue400) }
    public var borderPrimaryHover: Color { Color.dynamicColor(defaultColor: BlocketColors.blue700, darkModeColor: BlocketColors.blue300) }
    public var borderPrimaryActive: Color { Color.dynamicColor(defaultColor: BlocketColors.blue800, darkModeColor: BlocketColors.blue200) }
    public var borderPrimarySubtle: Color { Color.dynamicColor(defaultColor: BlocketColors.blue300, darkModeColor: BlocketColors.blue700) }
    public var borderPrimarySubtleHover: Color { Color.dynamicColor(defaultColor: BlocketColors.blue400, darkModeColor: BlocketColors.blue600) }
    public var borderPrimarySubtleActive: Color { Color.dynamicColor(defaultColor: BlocketColors.blue500, darkModeColor: BlocketColors.blue500) }
    
    public var borderSecondary: Color { Color.dynamicColor(defaultColor: BlocketColors.coral500, darkModeColor: BlocketColors.coral500) }
    public var borderSecondaryHover: Color { Color.dynamicColor(defaultColor: BlocketColors.coral600, darkModeColor: BlocketColors.coral400) }
    public var borderSecondaryActive: Color { Color.dynamicColor(defaultColor: BlocketColors.coral700, darkModeColor: BlocketColors.coral300) }
    
    public var borderPositive: Color { Color.dynamicColor(defaultColor: BlocketColors.green600, darkModeColor: BlocketColors.green500) }
    public var borderPositiveHover: Color { Color.dynamicColor(defaultColor: BlocketColors.green700, darkModeColor: BlocketColors.green400) }
    public var borderPositiveActive: Color { Color.dynamicColor(defaultColor: BlocketColors.green800, darkModeColor: BlocketColors.green300) }
    public var borderPositiveSubtle: Color { Color.dynamicColor(defaultColor: BlocketColors.green300, darkModeColor: BlocketColors.green700) }
    public var borderPositiveSubtleHover: Color { Color.dynamicColor(defaultColor: BlocketColors.green400, darkModeColor: BlocketColors.green600) }
    public var borderPositiveSubtleActive: Color { Color.dynamicColor(defaultColor: BlocketColors.green500, darkModeColor: BlocketColors.green500) }
    
    public var borderNegative: Color { Color.dynamicColor(defaultColor: BlocketColors.red600, darkModeColor: BlocketColors.red300) }
    public var borderNegativeHover: Color { Color.dynamicColor(defaultColor: BlocketColors.red700, darkModeColor: BlocketColors.red200) }
    public var borderNegativeActive: Color { Color.dynamicColor(defaultColor: BlocketColors.red800, darkModeColor: BlocketColors.red100) }
    public var borderNegativeSubtle: Color { Color.dynamicColor(defaultColor: BlocketColors.red300, darkModeColor: BlocketColors.red700) }
    public var borderNegativeSubtleHover: Color { Color.dynamicColor(defaultColor: BlocketColors.red400, darkModeColor: BlocketColors.red600) }
    public var borderNegativeSubtleActive: Color { Color.dynamicColor(defaultColor: BlocketColors.red500, darkModeColor: BlocketColors.red500) }
    
    public var borderWarning: Color { Color.dynamicColor(defaultColor: BlocketColors.yellow600, darkModeColor: BlocketColors.yellow500) }
    public var borderWarningHover: Color { Color.dynamicColor(defaultColor: BlocketColors.yellow700, darkModeColor: BlocketColors.yellow400) }
    public var borderWarningActive: Color { Color.dynamicColor(defaultColor: BlocketColors.yellow800, darkModeColor: BlocketColors.yellow300) }
    public var borderWarningSubtle: Color { Color.dynamicColor(defaultColor: BlocketColors.yellow300, darkModeColor: BlocketColors.yellow700) }
    public var borderWarningSubtleHover: Color { Color.dynamicColor(defaultColor: BlocketColors.yellow400, darkModeColor: BlocketColors.yellow600) }
    public var borderWarningSubtleActive: Color { Color.dynamicColor(defaultColor: BlocketColors.yellow500, darkModeColor: BlocketColors.yellow500) }
    
    public var borderInfo: Color { Color.dynamicColor(defaultColor: BlocketColors.blue600, darkModeColor: BlocketColors.blue500) }
    public var borderInfoHover: Color { Color.dynamicColor(defaultColor: BlocketColors.blue700, darkModeColor: BlocketColors.blue400) }
    public var borderInfoActive: Color { Color.dynamicColor(defaultColor: BlocketColors.blue800, darkModeColor: BlocketColors.blue300) }
    public var borderInfoSubtle: Color { Color.dynamicColor(defaultColor: BlocketColors.blue300, darkModeColor: BlocketColors.blue700) }
    public var borderInfoSubtleHover: Color { Color.dynamicColor(defaultColor: BlocketColors.blue400, darkModeColor: BlocketColors.blue600) }
    public var borderInfoSubtleActive: Color { Color.dynamicColor(defaultColor: BlocketColors.blue500, darkModeColor: BlocketColors.blue500) }
    
    /// Icon
    public var icon: Color { Color.dynamicColor(defaultColor: BlocketColors.gray900, darkModeColor: BlocketColors.white) }
    public var iconStatic: Color { Color.dynamicColor(defaultColor: BlocketColors.gray900, darkModeColor: BlocketColors.gray900) }
    public var iconHover: Color { Color.dynamicColor(defaultColor: BlocketColors.blue800, darkModeColor: BlocketColors.blue100) }
    public var iconActive: Color { Color.dynamicColor(defaultColor: BlocketColors.blue900, darkModeColor: BlocketColors.blue200) }
    public var iconSelected: Color { Color.dynamicColor(defaultColor: BlocketColors.blue600, darkModeColor: BlocketColors.blue400) }
    public var iconSelectedHover: Color { Color.dynamicColor(defaultColor: BlocketColors.blue700, darkModeColor: BlocketColors.blue300) }
    public var iconSelectedActive: Color { Color.dynamicColor(defaultColor: BlocketColors.blue800, darkModeColor: BlocketColors.blue200) }
    public var iconDisabled: Color { Color.dynamicColor(defaultColor: BlocketColors.gray300, darkModeColor: BlocketColors.gray600) }
    public var iconSubtle: Color { Color.dynamicColor(defaultColor: BlocketColors.gray400, darkModeColor: BlocketColors.gray600) }
    public var iconSubtleHover: Color { Color.dynamicColor(defaultColor: BlocketColors.gray500, darkModeColor: BlocketColors.gray500) }
    public var iconSubtleActive: Color { Color.dynamicColor(defaultColor: BlocketColors.gray600, darkModeColor: BlocketColors.gray400) }
    public var iconInverted: Color { Color.dynamicColor(defaultColor: BlocketColors.white, darkModeColor: BlocketColors.gray900) }
    public var iconInvertedHover: Color { Color.dynamicColor(defaultColor: BlocketColors.gray100, darkModeColor: BlocketColors.gray850) }
    public var iconInvertedActive: Color { Color.dynamicColor(defaultColor: BlocketColors.gray200, darkModeColor: BlocketColors.gray800) }
    public var iconInvertedStatic: Color { Color.dynamicColor(defaultColor: BlocketColors.white, darkModeColor: BlocketColors.white) }
    public var iconPrimary: Color { Color.dynamicColor(defaultColor: BlocketColors.blue600, darkModeColor: BlocketColors.blue400) }
    public var iconSecondary: Color { Color.dynamicColor(defaultColor: BlocketColors.coral500, darkModeColor: BlocketColors.coral500) }
    public var iconSecondaryHover: Color { Color.dynamicColor(defaultColor: BlocketColors.coral600, darkModeColor: BlocketColors.coral400) }
    public var iconSecondaryActive: Color { Color.dynamicColor(defaultColor: BlocketColors.coral700, darkModeColor: BlocketColors.coral300) }
    public var iconPositive: Color { Color.dynamicColor(defaultColor: BlocketColors.green600, darkModeColor: BlocketColors.green500) }
    public var iconNegative: Color { Color.dynamicColor(defaultColor: BlocketColors.red600, darkModeColor: BlocketColors.red300) }
    public var iconWarning: Color { Color.dynamicColor(defaultColor: BlocketColors.yellow600, darkModeColor: BlocketColors.yellow500) }
    public var iconInfo: Color { Color.dynamicColor(defaultColor: BlocketColors.blue600, darkModeColor: BlocketColors.blue500) }
    
    public var iconNotification: Color { Color.dynamicColor(defaultColor: BlocketColors.white, darkModeColor: BlocketColors.white) }
    
    /// Text
    public var text: Color { Color.dynamicColor(defaultColor: BlocketColors.gray900, darkModeColor: BlocketColors.white) }
    public var textStatic: Color { Color.dynamicColor(defaultColor: BlocketColors.gray900, darkModeColor: BlocketColors.gray900) }
    public var textSubtle: Color { Color.dynamicColor(defaultColor: BlocketColors.gray600, darkModeColor: BlocketColors.gray400) }
    public var textPlaceholder: Color { Color.dynamicColor(defaultColor: BlocketColors.gray300, darkModeColor: BlocketColors.gray500) }
    public var textInverted: Color { Color.dynamicColor(defaultColor: BlocketColors.white, darkModeColor: BlocketColors.gray900) }
    public var textInvertedStatic: Color { Color.dynamicColor(defaultColor: BlocketColors.white, darkModeColor: BlocketColors.white) }
    public var textInvertedSubtle: Color { Color.dynamicColor(defaultColor: BlocketColors.gray50, darkModeColor: BlocketColors.gray800) }
    public var textLink: Color { Color.dynamicColor(defaultColor: BlocketColors.blue600, darkModeColor: BlocketColors.blue400) }
    public var textDisabled: Color { Color.dynamicColor(defaultColor: BlocketColors.gray300, darkModeColor: BlocketColors.gray500) }
    public var textNegative: Color { Color.dynamicColor(defaultColor: BlocketColors.red600, darkModeColor: BlocketColors.red300) }
    public var textPositive: Color { Color.dynamicColor(defaultColor: BlocketColors.green600, darkModeColor: BlocketColors.green500) }
    public var textNotification: Color { Color.dynamicColor(defaultColor: BlocketColors.white, darkModeColor: BlocketColors.white) }
}

struct BlocketUITokenProvider: UITokenProvider {
    /// Surface
    public var surfaceSunken: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.gray50, darkModeColor: BlocketUIColors.gray950) }
    public var surfaceElevated100: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.white, darkModeColor: BlocketUIColors.gray850) }
    public var surfaceElevated100Hover: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.gray100, darkModeColor: BlocketUIColors.gray800) }
    public var surfaceElevated100Active: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.gray200, darkModeColor: BlocketUIColors.gray750) }
    public var surfaceElevated200: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.white, darkModeColor: BlocketUIColors.gray800) }
    public var surfaceElevated200Hover: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.gray100, darkModeColor: BlocketUIColors.gray750) }
    public var surfaceElevated200Active: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.gray200, darkModeColor: BlocketUIColors.gray700) }
    public var surfaceElevated300: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.white, darkModeColor: BlocketUIColors.gray750) }
    public var surfaceElevated300Hover: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.gray100, darkModeColor: BlocketUIColors.gray700) }
    public var surfaceElevated300Active: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.gray200, darkModeColor: BlocketUIColors.gray600) }
    
    
    /// Background
    public var background: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.white, darkModeColor: BlocketUIColors.gray900) }
    public var backgroundHover: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.gray100, darkModeColor: BlocketUIColors.gray850) }
    public var backgroundActive: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.gray200, darkModeColor: BlocketUIColors.gray800) }
    public var backgroundDisabled: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.gray300, darkModeColor: BlocketUIColors.gray700) }
    public var backgroundDisabledSubtle: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.gray200, darkModeColor: BlocketUIColors.gray600) }
    public var backgroundSubtle: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.gray100, darkModeColor: BlocketUIColors.gray750) }
    public var backgroundSubtleHover: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.gray200, darkModeColor: BlocketUIColors.gray700) }
    public var backgroundSubtleActive: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.gray300, darkModeColor: BlocketUIColors.gray600) }
    public var backgroundSelected: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.blue50, darkModeColor: BlocketUIColors.blue900) }
    public var backgroundSelectedHover: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.blue100, darkModeColor: BlocketUIColors.blue800) }
    public var backgroundSelectedActive: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.blue200, darkModeColor: BlocketUIColors.blue700) }
    
    public var backgroundInverted: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.gray900, darkModeColor: BlocketUIColors.gray50) }
    
    public var backgroundPrimary: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.blue600, darkModeColor: BlocketUIColors.blue400) }
    public var backgroundPrimaryHover: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.blue700, darkModeColor: BlocketUIColors.blue300) }
    public var backgroundPrimaryActive: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.blue800, darkModeColor: BlocketUIColors.blue200) }
    public var backgroundPrimarySubtle: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.blue50, darkModeColor: BlocketUIColors.blue800) }
    public var backgroundPrimarySubtleHover: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.blue100, darkModeColor: BlocketUIColors.blue700) }
    public var backgroundPrimarySubtleActive: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.blue200, darkModeColor: BlocketUIColors.blue600) }
    
    public var backgroundSecondary: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.coral500, darkModeColor: BlocketUIColors.coral500) }
    public var backgroundSecondaryHover: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.coral600, darkModeColor: BlocketUIColors.coral400) }
    public var backgroundSecondaryActive: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.coral700, darkModeColor: BlocketUIColors.coral300) }
    
    public var backgroundPositive: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.green600, darkModeColor: BlocketUIColors.green500) }
    public var backgroundPositiveHover: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.green700, darkModeColor: BlocketUIColors.green400) }
    public var backgroundPositiveActive: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.green800, darkModeColor: BlocketUIColors.green300) }
    public var backgroundPositiveSubtle: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.green50, darkModeColor: BlocketUIColors.green900) }
    public var backgroundPositiveSubtleHover: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.green100, darkModeColor: BlocketUIColors.green800) }
    public var backgroundPositiveSubtleActive: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.green200, darkModeColor: BlocketUIColors.green700) }
    
    public var backgroundNegative: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.red600, darkModeColor: BlocketUIColors.red300) }
    public var backgroundNegativeHover: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.red700, darkModeColor: BlocketUIColors.red200) }
    public var backgroundNegativeActive: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.red800, darkModeColor: BlocketUIColors.red100) }
    public var backgroundNegativeSubtle: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.red50, darkModeColor: BlocketUIColors.red900) }
    public var backgroundNegativeSubtleHover: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.red100, darkModeColor: BlocketUIColors.red800) }
    public var backgroundNegativeSubtleActive: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.red200, darkModeColor: BlocketUIColors.red700) }
    
    public var backgroundWarning: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.yellow600, darkModeColor: BlocketUIColors.yellow500) }
    public var backgroundWarningHover: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.yellow700, darkModeColor: BlocketUIColors.yellow400) }
    public var backgroundWarningActive: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.yellow800, darkModeColor: BlocketUIColors.yellow300) }
    public var backgroundWarningSubtle: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.yellow50, darkModeColor: BlocketUIColors.yellow900) }
    public var backgroundWarningSubtleHover: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.yellow100, darkModeColor: BlocketUIColors.yellow800) }
    public var backgroundWarningSubtleActive: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.yellow200, darkModeColor: BlocketUIColors.yellow700) }
    
    public var backgroundInfo: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.blue600, darkModeColor: BlocketUIColors.blue500) }
    public var backgroundInfoHover: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.blue700, darkModeColor: BlocketUIColors.blue400) }
    public var backgroundInfoActive: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.blue800, darkModeColor: BlocketUIColors.blue300) }
    public var backgroundInfoSubtle: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.blue50, darkModeColor: BlocketUIColors.blue900) }
    public var backgroundInfoSubtleHover: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.blue100, darkModeColor: BlocketUIColors.blue800) }
    public var backgroundInfoSubtleActive: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.blue200, darkModeColor: BlocketUIColors.blue700) }
    
    public var backgroundNotification: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.coral600, darkModeColor: BlocketUIColors.coral500) }
    
    
    /// Border
    public var border: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.gray300, darkModeColor: BlocketUIColors.gray600) }
    public var borderHover: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.gray400, darkModeColor: BlocketUIColors.gray500) }
    public var borderActive: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.gray500, darkModeColor: BlocketUIColors.gray400) }
    public var borderDisabled: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.gray300, darkModeColor: BlocketUIColors.gray700) }
    public var borderSelected: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.blue600, darkModeColor: BlocketUIColors.blue400) }
    public var borderSelectedHover: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.blue700, darkModeColor: BlocketUIColors.blue300) }
    public var borderSelectedActive: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.blue800, darkModeColor: BlocketUIColors.blue200) }
    public var borderFocus: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.blue300, darkModeColor: BlocketUIColors.blue300) }
    
    public var borderPrimary: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.blue600, darkModeColor: BlocketUIColors.blue400) }
    public var borderPrimaryHover: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.blue700, darkModeColor: BlocketUIColors.blue300) }
    public var borderPrimaryActive: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.blue800, darkModeColor: BlocketUIColors.blue200) }
    public var borderPrimarySubtle: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.blue300, darkModeColor: BlocketUIColors.blue700) }
    public var borderPrimarySubtleHover: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.blue400, darkModeColor: BlocketUIColors.blue600) }
    public var borderPrimarySubtleActive: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.blue500, darkModeColor: BlocketUIColors.blue500) }
    
    public var borderSecondary: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.coral500, darkModeColor: BlocketUIColors.coral500) }
    public var borderSecondaryHover: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.coral600, darkModeColor: BlocketUIColors.coral400) }
    public var borderSecondaryActive: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.coral700, darkModeColor: BlocketUIColors.coral300) }
    
    public var borderPositive: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.green600, darkModeColor: BlocketUIColors.green500) }
    public var borderPositiveHover: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.green700, darkModeColor: BlocketUIColors.green400) }
    public var borderPositiveActive: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.green800, darkModeColor: BlocketUIColors.green300) }
    public var borderPositiveSubtle: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.green300, darkModeColor: BlocketUIColors.green700) }
    public var borderPositiveSubtleHover: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.green400, darkModeColor: BlocketUIColors.green600) }
    public var borderPositiveSubtleActive: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.green500, darkModeColor: BlocketUIColors.green500) }
    
    public var borderNegative: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.red600, darkModeColor: BlocketUIColors.red300) }
    public var borderNegativeHover: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.red700, darkModeColor: BlocketUIColors.red200) }
    public var borderNegativeActive: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.red800, darkModeColor: BlocketUIColors.red100) }
    public var borderNegativeSubtle: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.red300, darkModeColor: BlocketUIColors.red700) }
    public var borderNegativeSubtleHover: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.red400, darkModeColor: BlocketUIColors.red600) }
    public var borderNegativeSubtleActive: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.red500, darkModeColor: BlocketUIColors.red500) }
    
    public var borderWarning: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.yellow600, darkModeColor: BlocketUIColors.yellow500) }
    public var borderWarningHover: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.yellow700, darkModeColor: BlocketUIColors.yellow400) }
    public var borderWarningActive: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.yellow800, darkModeColor: BlocketUIColors.yellow300) }
    public var borderWarningSubtle: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.yellow300, darkModeColor: BlocketUIColors.yellow700) }
    public var borderWarningSubtleHover: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.yellow400, darkModeColor: BlocketUIColors.yellow600) }
    public var borderWarningSubtleActive: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.yellow500, darkModeColor: BlocketUIColors.yellow500) }
    
    public var borderInfo: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.blue600, darkModeColor: BlocketUIColors.blue500) }
    public var borderInfoHover: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.blue700, darkModeColor: BlocketUIColors.blue400) }
    public var borderInfoActive: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.blue800, darkModeColor: BlocketUIColors.blue300) }
    public var borderInfoSubtle: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.blue300, darkModeColor: BlocketUIColors.blue700) }
    public var borderInfoSubtleHover: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.blue400, darkModeColor: BlocketUIColors.blue600) }
    public var borderInfoSubtleActive: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.blue500, darkModeColor: BlocketUIColors.blue500) }
    
    /// Icon
    public var icon: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.gray900, darkModeColor: BlocketUIColors.white) }
    public var iconStatic: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.gray900, darkModeColor: BlocketUIColors.gray900) }
    public var iconHover: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.blue800, darkModeColor: BlocketUIColors.blue100) }
    public var iconActive: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.blue900, darkModeColor: BlocketUIColors.blue200) }
    public var iconSelected: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.blue600, darkModeColor: BlocketUIColors.blue400) }
    public var iconSelectedHover: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.blue700, darkModeColor: BlocketUIColors.blue300) }
    public var iconSelectedActive: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.blue800, darkModeColor: BlocketUIColors.blue200) }
    public var iconDisabled: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.gray300, darkModeColor: BlocketUIColors.gray600) }
    public var iconSubtle: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.gray400, darkModeColor: BlocketUIColors.gray600) }
    public var iconSubtleHover: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.gray500, darkModeColor: BlocketUIColors.gray500) }
    public var iconSubtleActive: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.gray600, darkModeColor: BlocketUIColors.gray400) }
    public var iconInverted: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.white, darkModeColor: BlocketUIColors.gray900) }
    public var iconInvertedHover: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.gray100, darkModeColor: BlocketUIColors.gray850) }
    public var iconInvertedActive: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.gray200, darkModeColor: BlocketUIColors.gray800) }
    public var iconInvertedStatic: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.white, darkModeColor: BlocketUIColors.white) }
    public var iconPrimary: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.blue600, darkModeColor: BlocketUIColors.blue400) }
    public var iconSecondary: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.coral500, darkModeColor: BlocketUIColors.coral500) }
    public var iconSecondaryHover: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.coral600, darkModeColor: BlocketUIColors.coral400) }
    public var iconSecondaryActive: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.coral700, darkModeColor: BlocketUIColors.coral300) }
    public var iconPositive: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.green600, darkModeColor: BlocketUIColors.green500) }
    public var iconNegative: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.red600, darkModeColor: BlocketUIColors.red300) }
    public var iconWarning: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.yellow600, darkModeColor: BlocketUIColors.yellow500) }
    public var iconInfo: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.blue600, darkModeColor: BlocketUIColors.blue500) }
    
    public var iconNotification: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.white, darkModeColor: BlocketUIColors.white) }
    
    /// Text
    public var text: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.gray900, darkModeColor: BlocketUIColors.white) }
    public var textStatic: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.gray900, darkModeColor: BlocketUIColors.gray900) }
    public var textSubtle: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.gray600, darkModeColor: BlocketUIColors.gray400) }
    public var textPlaceholder: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.gray300, darkModeColor: BlocketUIColors.gray500) }
    public var textInverted: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.white, darkModeColor: BlocketUIColors.gray900) }
    public var textInvertedStatic: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.white, darkModeColor: BlocketUIColors.white) }
    public var textInvertedSubtle: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.gray50, darkModeColor: BlocketUIColors.gray800) }
    public var textLink: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.blue600, darkModeColor: BlocketUIColors.blue400) }
    public var textDisabled: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.gray300, darkModeColor: BlocketUIColors.gray500) }
    public var textNegative: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.red600, darkModeColor: BlocketUIColors.red300) }
    public var textPositive: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.green600, darkModeColor: BlocketUIColors.green500) }
    public var textNotification: UIColor { UIColor.dynamicColor(defaultColor: BlocketUIColors.white, darkModeColor: BlocketUIColors.white) }
}
