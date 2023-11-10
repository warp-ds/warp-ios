import SwiftUI

/// Source: https://docs.google.com/spreadsheets/d/1Q-Tr_dwJVfxgh3527IFjXQKqtnPPM42QeIr-M6q-zu8/edit#gid=888578831
struct FinnTokenProvider: TokenProvider {
    /// Background
    public var background: Color { Color.dynamicColor(defaultColor: FinnColors.white, darkModeColor: FinnColors.black) }
    public var backgroundHover: Color { Color.dynamicColor(defaultColor: FinnColors.blueGray100, darkModeColor: FinnColors.blueGray800) }
    public var backgroundActive: Color { Color.dynamicColor(defaultColor: FinnColors.blueGray200, darkModeColor: FinnColors.blueGray900) }
    public var backgroundDisabled: Color { Color.dynamicColor(defaultColor: FinnColors.blueGray300, darkModeColor: FinnColors.blueGray700) }
    public var backgroundSubtle: Color { Color.dynamicColor(defaultColor: FinnColors.blueGray50, darkModeColor: FinnColors.gray900) }
    public var backgroundSubtleHover: Color { Color.dynamicColor(defaultColor: FinnColors.blueGray100, darkModeColor: FinnColors.blueGray800) }
    public var backgroundSubtleActive: Color { Color.dynamicColor(defaultColor: FinnColors.blueGray200, darkModeColor: FinnColors.blueGray900) }
    public var backgroundSelected: Color { Color.dynamicColor(defaultColor: FinnColors.blue50, darkModeColor: FinnColors.blue900) }
    public var backgroundSelectedHover: Color { Color.dynamicColor(defaultColor: FinnColors.blue100, darkModeColor: FinnColors.blue800) }
    
    public var backgroundInverted: Color { Color.dynamicColor(defaultColor: FinnColors.gray900, darkModeColor: FinnColors.gray50) }
    
    public var backgroundButtonPrimary: Color { Color.dynamicColor(defaultColor: FinnColors.blue600, darkModeColor: FinnColors.blue500) }
    public var backgroundPrimary: Color { Color.dynamicColor(defaultColor: FinnColors.blue600, darkModeColor: FinnColors.blue500) }
    public var backgroundPrimaryHover: Color { Color.dynamicColor(defaultColor: FinnColors.blue700, darkModeColor: FinnColors.blue600) }
    public var backgroundPrimaryActive: Color { Color.dynamicColor(defaultColor: FinnColors.blue800, darkModeColor: FinnColors.blue700) }
    public var backgroundPrimarySubtle: Color { Color.dynamicColor(defaultColor: FinnColors.blue50, darkModeColor: FinnColors.blue900) }
    public var backgroundPrimarySubtleHover: Color { Color.dynamicColor(defaultColor: FinnColors.blue100, darkModeColor: FinnColors.blue800) }
    public var backgroundPrimarySubtleActive: Color { Color.dynamicColor(defaultColor: FinnColors.blue200, darkModeColor: FinnColors.blue900) }
    
    public var backgroundPositive: Color { Color.dynamicColor(defaultColor: FinnColors.green600, darkModeColor: FinnColors.green500) }
    public var backgroundPositiveHover: Color { Color.dynamicColor(defaultColor: FinnColors.green700, darkModeColor: FinnColors.green600) }
    public var backgroundPositiveActive: Color { Color.dynamicColor(defaultColor: FinnColors.green800, darkModeColor: FinnColors.green700) }
    public var backgroundPositiveSubtle: Color { Color.dynamicColor(defaultColor: FinnColors.green50, darkModeColor: FinnColors.green900) }
    public var backgroundPositiveSubtleHover: Color { Color.dynamicColor(defaultColor: FinnColors.green100, darkModeColor: FinnColors.green800) }
    public var backgroundPositiveSubtleActive: Color { Color.dynamicColor(defaultColor: FinnColors.green200, darkModeColor: FinnColors.green900) }
    public var backgroundPositiveSelected: Color { Color.dynamicColor(defaultColor: FinnColors.green50, darkModeColor: FinnColors.green900) }
    public var backgroundPositiveSelectedHover: Color { Color.dynamicColor(defaultColor: FinnColors.green100, darkModeColor: FinnColors.green800) }
    
    public var backgroundNegative: Color { Color.dynamicColor(defaultColor: FinnColors.red600, darkModeColor: FinnColors.red500) }
    public var backgroundNegativeHover: Color { Color.dynamicColor(defaultColor: FinnColors.red700, darkModeColor: FinnColors.red600) }
    public var backgroundNegativeActive: Color { Color.dynamicColor(defaultColor: FinnColors.red800, darkModeColor: FinnColors.red700) }
    public var backgroundNegativeSubtle: Color { Color.dynamicColor(defaultColor: FinnColors.red50, darkModeColor: FinnColors.red900) }
    public var backgroundNegativeSubtleHover: Color { Color.dynamicColor(defaultColor: FinnColors.red100, darkModeColor: FinnColors.red800) }
    public var backgroundNegativeSubtleActive: Color { Color.dynamicColor(defaultColor: FinnColors.red200, darkModeColor: FinnColors.red900) }
    public var backgroundNegativeSelected: Color { Color.dynamicColor(defaultColor: FinnColors.red50, darkModeColor: FinnColors.red900) }
    public var backgroundNegativeSelectedHover: Color { Color.dynamicColor(defaultColor: FinnColors.red100, darkModeColor: FinnColors.red800) }
    
    public var backgroundWarning: Color { Color.dynamicColor(defaultColor: FinnColors.yellow600, darkModeColor: FinnColors.yellow500) }
    public var backgroundWarningHover: Color { Color.dynamicColor(defaultColor: FinnColors.yellow700, darkModeColor: FinnColors.yellow600) }
    public var backgroundWarningActive: Color { Color.dynamicColor(defaultColor: FinnColors.yellow800, darkModeColor: FinnColors.yellow700) }
    public var backgroundWarningSubtle: Color { Color.dynamicColor(defaultColor: FinnColors.yellow50, darkModeColor: FinnColors.yellow900) }
    public var backgroundWarningSubtleHover: Color { Color.dynamicColor(defaultColor: FinnColors.yellow100, darkModeColor: FinnColors.yellow800) }
    public var backgroundWarningSubtleActive: Color { Color.dynamicColor(defaultColor: FinnColors.yellow200, darkModeColor: FinnColors.yellow900) }
    public var backgroundWarningSelected: Color { Color.dynamicColor(defaultColor: FinnColors.yellow50, darkModeColor: FinnColors.yellow900) }
    public var backgroundWarningSelectedHover: Color { Color.dynamicColor(defaultColor: FinnColors.yellow100, darkModeColor: FinnColors.yellow800) }
    
    public var backgroundInfo: Color { Color.dynamicColor(defaultColor: FinnColors.aqua600, darkModeColor: FinnColors.aqua500) }
    public var backgroundInfoHover: Color { Color.dynamicColor(defaultColor: FinnColors.aqua700, darkModeColor: FinnColors.aqua600) }
    public var backgroundInfoActive: Color { Color.dynamicColor(defaultColor: FinnColors.aqua800, darkModeColor: FinnColors.aqua700) }
    public var backgroundInfoSubtle: Color { Color.dynamicColor(defaultColor: FinnColors.aqua50, darkModeColor: FinnColors.aqua900) }
    public var backgroundInfoSubtleHover: Color { Color.dynamicColor(defaultColor: FinnColors.aqua100, darkModeColor: FinnColors.aqua800) }
    public var backgroundInfoSubtleActive: Color { Color.dynamicColor(defaultColor: FinnColors.aqua200, darkModeColor: FinnColors.aqua900) }
    public var backgroundInfoSelected: Color { Color.dynamicColor(defaultColor: FinnColors.aqua50, darkModeColor: FinnColors.aqua500) }
    
    public var backgroundNotification: Color { Color.dynamicColor(defaultColor: FinnColors.red600, darkModeColor: FinnColors.red500) }
    
    /// Border
    public var border: Color { Color.dynamicColor(defaultColor: FinnColors.blueGray300, darkModeColor: FinnColors.blueGray600) }
    public var borderHover: Color { Color.dynamicColor(defaultColor: FinnColors.blueGray400, darkModeColor: FinnColors.blueGray700) }
    public var borderActive: Color { Color.dynamicColor(defaultColor: FinnColors.blueGray500, darkModeColor: FinnColors.blueGray800) }
    public var borderDisabled: Color { Color.dynamicColor(defaultColor: FinnColors.blueGray300, darkModeColor: FinnColors.blueGray300) }
    public var borderSelected: Color { Color.dynamicColor(defaultColor: FinnColors.blue600, darkModeColor: FinnColors.blue500) }
    public var borderSelectedHover: Color { Color.dynamicColor(defaultColor: FinnColors.blue700, darkModeColor: FinnColors.blue600) }
    
    public var borderButtonPrimary: Color { Color.dynamicColor(defaultColor: FinnColors.blue600, darkModeColor: FinnColors.blue500) }
    public var borderButtonSecondary: Color { Color.dynamicColor(defaultColor: FinnColors.blueGray300, darkModeColor: FinnColors.blueGray600) }
    public var borderPrimary: Color { Color.dynamicColor(defaultColor: FinnColors.blue600, darkModeColor: FinnColors.blue500) }
    public var borderPrimaryHover: Color { Color.dynamicColor(defaultColor: FinnColors.blue700, darkModeColor: FinnColors.blue600) }
    public var borderPrimaryActive: Color { Color.dynamicColor(defaultColor: FinnColors.blue800, darkModeColor: FinnColors.blue700) }
    public var borderPrimarySubtle: Color { Color.dynamicColor(defaultColor: FinnColors.blue300, darkModeColor: FinnColors.blue700) }
    public var borderPrimarySubtleHover: Color { Color.dynamicColor(defaultColor: FinnColors.blue400, darkModeColor: FinnColors.blue800) }
    public var borderPrimarySubtleActive: Color { Color.dynamicColor(defaultColor: FinnColors.blue500, darkModeColor: FinnColors.blue900) }
    
    public var borderPositive: Color { Color.dynamicColor(defaultColor: FinnColors.green600, darkModeColor: FinnColors.green500) }
    public var borderPositiveHover: Color { Color.dynamicColor(defaultColor: FinnColors.green700, darkModeColor: FinnColors.green600) }
    public var borderPositiveActive: Color { Color.dynamicColor(defaultColor: FinnColors.green800, darkModeColor: FinnColors.green700) }
    public var borderPositiveSubtle: Color { Color.dynamicColor(defaultColor: FinnColors.green300, darkModeColor: FinnColors.green700) }
    public var borderPositiveSubtleHover: Color { Color.dynamicColor(defaultColor: FinnColors.green400, darkModeColor: FinnColors.green800) }
    public var borderPositiveSubtleActive: Color { Color.dynamicColor(defaultColor: FinnColors.green500, darkModeColor: FinnColors.green900) }
    
    public var borderNegative: Color { Color.dynamicColor(defaultColor: FinnColors.red600, darkModeColor: FinnColors.red500) }
    public var borderNegativeHover: Color { Color.dynamicColor(defaultColor: FinnColors.red700, darkModeColor: FinnColors.red600) }
    public var borderNegativeActive: Color { Color.dynamicColor(defaultColor: FinnColors.red800, darkModeColor: FinnColors.red700) }
    public var borderNegativeSubtle: Color { Color.dynamicColor(defaultColor: FinnColors.red300, darkModeColor: FinnColors.red700) }
    public var borderNegativeSubtleHover: Color { Color.dynamicColor(defaultColor: FinnColors.red400, darkModeColor: FinnColors.red800) }
    public var borderNegativeSubtleActive: Color { Color.dynamicColor(defaultColor: FinnColors.red500, darkModeColor: FinnColors.red900) }
    
    public var borderWarning: Color { Color.dynamicColor(defaultColor: FinnColors.yellow600, darkModeColor: FinnColors.yellow500) }
    public var borderWarningHover: Color { Color.dynamicColor(defaultColor: FinnColors.yellow700, darkModeColor: FinnColors.yellow600) }
    public var borderWarningActive: Color { Color.dynamicColor(defaultColor: FinnColors.yellow800, darkModeColor: FinnColors.yellow700) }
    public var borderWarningSubtle: Color { Color.dynamicColor(defaultColor: FinnColors.yellow300, darkModeColor: FinnColors.yellow700) }
    public var borderWarningSubtleHover: Color { Color.dynamicColor(defaultColor: FinnColors.yellow400, darkModeColor: FinnColors.yellow800) }
    public var borderWarningSubtleActive: Color { Color.dynamicColor(defaultColor: FinnColors.yellow500, darkModeColor: FinnColors.yellow900) }
    
    public var borderInfo: Color { Color.dynamicColor(defaultColor: FinnColors.aqua600, darkModeColor: FinnColors.aqua500) }
    public var borderInfoHover: Color { Color.dynamicColor(defaultColor: FinnColors.aqua700, darkModeColor: FinnColors.aqua600) }
    public var borderInfoActive: Color { Color.dynamicColor(defaultColor: FinnColors.aqua800, darkModeColor: FinnColors.aqua700) }
    public var borderInfoSubtle: Color { Color.dynamicColor(defaultColor: FinnColors.aqua300, darkModeColor: FinnColors.aqua700) }
    public var borderInfoSubtleHover: Color { Color.dynamicColor(defaultColor: FinnColors.aqua400, darkModeColor: FinnColors.aqua800) }
    public var borderInfoSubtleActive: Color { Color.dynamicColor(defaultColor: FinnColors.aqua500, darkModeColor: FinnColors.aqua900) }
    
    /// Icon
    public var icon: Color { Color.dynamicColor(defaultColor: FinnColors.gray700, darkModeColor: FinnColors.white) }
    public var iconHover: Color { Color.dynamicColor(defaultColor: FinnColors.blue600, darkModeColor: FinnColors.gray100) }
    public var iconActive: Color { Color.dynamicColor(defaultColor: FinnColors.blue700, darkModeColor: FinnColors.gray200) }
    public var iconSelected: Color { Color.dynamicColor(defaultColor: FinnColors.blue600, darkModeColor: FinnColors.blue500) }
    public var iconSelectedHover: Color { Color.dynamicColor(defaultColor: FinnColors.blue700, darkModeColor: FinnColors.blue600) }
    public var iconDisabled: Color { Color.dynamicColor(defaultColor: FinnColors.blueGray300, darkModeColor: FinnColors.blueGray600) }
    public var iconSubtle: Color { Color.dynamicColor(defaultColor: FinnColors.blueGray400, darkModeColor: FinnColors.blueGray100) }
    public var iconSubtleHover: Color { Color.dynamicColor(defaultColor: FinnColors.blueGray500, darkModeColor: FinnColors.blueGray200) }
    public var iconSubtleActive: Color { Color.dynamicColor(defaultColor: FinnColors.blueGray600, darkModeColor: FinnColors.blueGray300) }
    public var iconInverted: Color { Color.dynamicColor(defaultColor: FinnColors.white, darkModeColor: FinnColors.black) }
    public var iconInvertedHover: Color { Color.dynamicColor(defaultColor: FinnColors.blueGray100, darkModeColor: FinnColors.blueGray800) }
    public var iconInvertedActive: Color { Color.dynamicColor(defaultColor: FinnColors.blueGray200, darkModeColor: FinnColors.blueGray900) }
    public var iconPrimary: Color { Color.dynamicColor(defaultColor: FinnColors.blue600, darkModeColor: FinnColors.blue500) }
    public var iconPositive: Color { Color.dynamicColor(defaultColor: FinnColors.green600, darkModeColor: FinnColors.green500) }
    public var iconNegative: Color { Color.dynamicColor(defaultColor: FinnColors.red600, darkModeColor: FinnColors.red500) }
    public var iconWarning: Color { Color.dynamicColor(defaultColor: FinnColors.yellow600, darkModeColor: FinnColors.yellow500) }
    public var iconInfo: Color { Color.dynamicColor(defaultColor: FinnColors.aqua600, darkModeColor: FinnColors.aqua500) }
    
    public var iconNotification: Color { Color.dynamicColor(defaultColor: FinnColors.white, darkModeColor: FinnColors.white) }
    
    /// Text
    public var text: Color { Color.dynamicColor(defaultColor: FinnColors.gray700, darkModeColor: FinnColors.white) }
    public var textSubtle: Color { Color.dynamicColor(defaultColor: FinnColors.gray500, darkModeColor: FinnColors.gray100) }
    public var textPlaceholder: Color { Color.dynamicColor(defaultColor: FinnColors.blueGray300, darkModeColor: FinnColors.blueGray500) }
    public var textInverted: Color { Color.dynamicColor(defaultColor: FinnColors.white, darkModeColor: FinnColors.white) }
    public var textInvertedSubtle: Color { Color.dynamicColor(defaultColor: FinnColors.gray50, darkModeColor: FinnColors.gray800) }
    public var textLink: Color { Color.dynamicColor(defaultColor: FinnColors.blue600, darkModeColor: FinnColors.blue500) }
    public var textDisabled: Color { Color.dynamicColor(defaultColor: FinnColors.blueGray300, darkModeColor: FinnColors.blueGray500) }
    public var textNegative: Color { Color.dynamicColor(defaultColor: FinnColors.red600, darkModeColor: FinnColors.red500) }
    public var textPositive: Color { Color.dynamicColor(defaultColor: FinnColors.green600, darkModeColor: FinnColors.green500) }
    public var textNotification: Color { Color.dynamicColor(defaultColor: FinnColors.white, darkModeColor: FinnColors.white) }
}

struct FinnUITokenProvider: UITokenProvider {
    /// Background
    public var background: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.white, darkModeColor: FinnUIColors.black) }
    public var backgroundHover: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.blueGray100, darkModeColor: FinnUIColors.blueGray800) }
    public var backgroundActive: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.blueGray200, darkModeColor: FinnUIColors.blueGray900) }
    public var backgroundDisabled: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.blueGray300, darkModeColor: FinnUIColors.blueGray700) }
    public var backgroundSubtle: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.blueGray50, darkModeColor: FinnUIColors.gray900) }
    public var backgroundSubtleHover: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.blueGray100, darkModeColor: FinnUIColors.blueGray800) }
    public var backgroundSubtleActive: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.blueGray200, darkModeColor: FinnUIColors.blueGray900) }
    public var backgroundSelected: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.blue50, darkModeColor: FinnUIColors.blue900) }
    public var backgroundSelectedHover: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.blue100, darkModeColor: FinnUIColors.blue800) }
    
    public var backgroundInverted: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.gray900, darkModeColor: FinnUIColors.gray50) }
    
    public var backgroundButtonPrimary: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.blue600, darkModeColor: FinnUIColors.blue500) }
    public var backgroundPrimary: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.blue600, darkModeColor: FinnUIColors.blue500) }
    public var backgroundPrimaryHover: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.blue700, darkModeColor: FinnUIColors.blue600) }
    public var backgroundPrimaryActive: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.blue800, darkModeColor: FinnUIColors.blue700) }
    public var backgroundPrimarySubtle: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.blue50, darkModeColor: FinnUIColors.blue900) }
    public var backgroundPrimarySubtleHover: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.blue100, darkModeColor: FinnUIColors.blue800) }
    public var backgroundPrimarySubtleActive: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.blue200, darkModeColor: FinnUIColors.blue900) }
    
    public var backgroundPositive: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.green600, darkModeColor: FinnUIColors.green500) }
    public var backgroundPositiveHover: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.green700, darkModeColor: FinnUIColors.green600) }
    public var backgroundPositiveActive: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.green800, darkModeColor: FinnUIColors.green700) }
    public var backgroundPositiveSubtle: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.green50, darkModeColor: FinnUIColors.green900) }
    public var backgroundPositiveSubtleHover: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.green100, darkModeColor: FinnUIColors.green800) }
    public var backgroundPositiveSubtleActive: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.green200, darkModeColor: FinnUIColors.green900) }
    public var backgroundPositiveSelected: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.green50, darkModeColor: FinnUIColors.green900) }
    public var backgroundPositiveSelectedHover: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.green100, darkModeColor: FinnUIColors.green800) }
    
    public var backgroundNegative: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.red600, darkModeColor: FinnUIColors.red500) }
    public var backgroundNegativeHover: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.red700, darkModeColor: FinnUIColors.red600) }
    public var backgroundNegativeActive: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.red800, darkModeColor: FinnUIColors.red700) }
    public var backgroundNegativeSubtle: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.red50, darkModeColor: FinnUIColors.red900) }
    public var backgroundNegativeSubtleHover: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.red100, darkModeColor: FinnUIColors.red800) }
    public var backgroundNegativeSubtleActive: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.red200, darkModeColor: FinnUIColors.red900) }
    public var backgroundNegativeSelected: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.red50, darkModeColor: FinnUIColors.red900) }
    public var backgroundNegativeSelectedHover: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.red100, darkModeColor: FinnUIColors.red800) }
    
    public var backgroundWarning: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.yellow600, darkModeColor: FinnUIColors.yellow500) }
    public var backgroundWarningHover: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.yellow700, darkModeColor: FinnUIColors.yellow600) }
    public var backgroundWarningActive: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.yellow800, darkModeColor: FinnUIColors.yellow700) }
    public var backgroundWarningSubtle: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.yellow50, darkModeColor: FinnUIColors.yellow900) }
    public var backgroundWarningSubtleHover: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.yellow100, darkModeColor: FinnUIColors.yellow800) }
    public var backgroundWarningSubtleActive: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.yellow200, darkModeColor: FinnUIColors.yellow900) }
    public var backgroundWarningSelected: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.yellow50, darkModeColor: FinnUIColors.yellow900) }
    public var backgroundWarningSelectedHover: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.yellow100, darkModeColor: FinnUIColors.yellow800) }
    
    public var backgroundInfo: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.aqua600, darkModeColor: FinnUIColors.aqua500) }
    public var backgroundInfoHover: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.aqua700, darkModeColor: FinnUIColors.aqua600) }
    public var backgroundInfoActive: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.aqua800, darkModeColor: FinnUIColors.aqua700) }
    public var backgroundInfoSubtle: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.aqua50, darkModeColor: FinnUIColors.aqua900) }
    public var backgroundInfoSubtleHover: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.aqua100, darkModeColor: FinnUIColors.aqua800) }
    public var backgroundInfoSubtleActive: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.aqua200, darkModeColor: FinnUIColors.aqua900) }
    public var backgroundInfoSelected: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.aqua50, darkModeColor: FinnUIColors.aqua500) }
    
    public var backgroundNotification: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.red600, darkModeColor: FinnUIColors.red500) }
    
    /// Border
    public var border: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.blueGray300, darkModeColor: FinnUIColors.blueGray600) }
    public var borderHover: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.blueGray400, darkModeColor: FinnUIColors.blueGray700) }
    public var borderActive: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.blueGray500, darkModeColor: FinnUIColors.blueGray800) }
    public var borderDisabled: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.blueGray300, darkModeColor: FinnUIColors.blueGray300) }
    public var borderSelected: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.blue600, darkModeColor: FinnUIColors.blue500) }
    public var borderSelectedHover: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.blue700, darkModeColor: FinnUIColors.blue600) }
    
    public var borderButtonPrimary: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.blue600, darkModeColor: FinnUIColors.blue500) }
    public var borderButtonSecondary: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.blueGray300, darkModeColor: FinnUIColors.blueGray600) }
    public var borderPrimary: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.blue600, darkModeColor: FinnUIColors.blue500) }
    public var borderPrimaryHover: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.blue700, darkModeColor: FinnUIColors.blue600) }
    public var borderPrimaryActive: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.blue800, darkModeColor: FinnUIColors.blue700) }
    public var borderPrimarySubtle: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.blue300, darkModeColor: FinnUIColors.blue700) }
    public var borderPrimarySubtleHover: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.blue400, darkModeColor: FinnUIColors.blue800) }
    public var borderPrimarySubtleActive: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.blue500, darkModeColor: FinnUIColors.blue900) }
    
    public var borderPositive: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.green600, darkModeColor: FinnUIColors.green500) }
    public var borderPositiveHover: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.green700, darkModeColor: FinnUIColors.green600) }
    public var borderPositiveActive: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.green800, darkModeColor: FinnUIColors.green700) }
    public var borderPositiveSubtle: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.green300, darkModeColor: FinnUIColors.green700) }
    public var borderPositiveSubtleHover: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.green400, darkModeColor: FinnUIColors.green800) }
    public var borderPositiveSubtleActive: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.green500, darkModeColor: FinnUIColors.green900) }
    
    public var borderNegative: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.red600, darkModeColor: FinnUIColors.red500) }
    public var borderNegativeHover: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.red700, darkModeColor: FinnUIColors.red600) }
    public var borderNegativeActive: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.red800, darkModeColor: FinnUIColors.red700) }
    public var borderNegativeSubtle: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.red300, darkModeColor: FinnUIColors.red700) }
    public var borderNegativeSubtleHover: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.red400, darkModeColor: FinnUIColors.red800) }
    public var borderNegativeSubtleActive: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.red500, darkModeColor: FinnUIColors.red900) }
    
    public var borderWarning: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.yellow600, darkModeColor: FinnUIColors.yellow500) }
    public var borderWarningHover: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.yellow700, darkModeColor: FinnUIColors.yellow600) }
    public var borderWarningActive: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.yellow800, darkModeColor: FinnUIColors.yellow700) }
    public var borderWarningSubtle: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.yellow300, darkModeColor: FinnUIColors.yellow700) }
    public var borderWarningSubtleHover: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.yellow400, darkModeColor: FinnUIColors.yellow800) }
    public var borderWarningSubtleActive: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.yellow500, darkModeColor: FinnUIColors.yellow900) }
    
    public var borderInfo: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.aqua600, darkModeColor: FinnUIColors.aqua500) }
    public var borderInfoHover: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.aqua700, darkModeColor: FinnUIColors.aqua600) }
    public var borderInfoActive: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.aqua800, darkModeColor: FinnUIColors.aqua700) }
    public var borderInfoSubtle: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.aqua300, darkModeColor: FinnUIColors.aqua700) }
    public var borderInfoSubtleHover: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.aqua400, darkModeColor: FinnUIColors.aqua800) }
    public var borderInfoSubtleActive: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.aqua500, darkModeColor: FinnUIColors.aqua900) }
    
    /// Icon
    public var icon: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.gray700, darkModeColor: FinnUIColors.white) }
    public var iconHover: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.blue600, darkModeColor: FinnUIColors.gray100) }
    public var iconActive: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.blue700, darkModeColor: FinnUIColors.gray200) }
    public var iconSelected: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.blue600, darkModeColor: FinnUIColors.blue500) }
    public var iconSelectedHover: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.blue700, darkModeColor: FinnUIColors.blue600) }
    public var iconDisabled: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.blueGray300, darkModeColor: FinnUIColors.blueGray600) }
    public var iconSubtle: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.blueGray400, darkModeColor: FinnUIColors.blueGray100) }
    public var iconSubtleHover: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.blueGray500, darkModeColor: FinnUIColors.blueGray200) }
    public var iconSubtleActive: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.blueGray600, darkModeColor: FinnUIColors.blueGray300) }
    public var iconInverted: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.white, darkModeColor: FinnUIColors.black) }
    public var iconInvertedHover: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.blueGray100, darkModeColor: FinnUIColors.blueGray800) }
    public var iconInvertedActive: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.blueGray200, darkModeColor: FinnUIColors.blueGray900) }
    public var iconPrimary: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.blue600, darkModeColor: FinnUIColors.blue500) }
    public var iconPositive: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.green600, darkModeColor: FinnUIColors.green500) }
    public var iconNegative: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.red600, darkModeColor: FinnUIColors.red500) }
    public var iconWarning: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.yellow600, darkModeColor: FinnUIColors.yellow500) }
    public var iconInfo: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.aqua600, darkModeColor: FinnUIColors.aqua500) }
    
    public var iconNotification: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.white, darkModeColor: FinnUIColors.white) }
    
    /// Text
    public var text: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.gray700, darkModeColor: FinnUIColors.white) }
    public var textSubtle: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.gray500, darkModeColor: FinnUIColors.gray100) }
    public var textPlaceholder: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.blueGray300, darkModeColor: FinnUIColors.blueGray500) }
    public var textInverted: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.white, darkModeColor: FinnUIColors.white) }
    public var textInvertedSubtle: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.gray50, darkModeColor: FinnUIColors.gray800) }
    public var textLink: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.blue600, darkModeColor: FinnUIColors.blue500) }
    public var textDisabled: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.blueGray300, darkModeColor: FinnUIColors.blueGray500) }
    public var textNegative: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.red600, darkModeColor: FinnUIColors.red500) }
    public var textPositive: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.green600, darkModeColor: FinnUIColors.green500) }
    public var textNotification: UIColor { UIColor.dynamicColor(defaultColor: FinnUIColors.white, darkModeColor: FinnUIColors.white) }
}
