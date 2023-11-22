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
