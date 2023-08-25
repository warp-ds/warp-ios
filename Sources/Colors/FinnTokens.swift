import SwiftUI

/// Source: https://docs.google.com/spreadsheets/d/1Q-Tr_dwJVfxgh3527IFjXQKqtnPPM42QeIr-M6q-zu8/edit#gid=888578831
struct FinnTokenProvider: TokenProvider {
    /// Background
    var background: Color { Color.dynamicColor(defaultColor: FinnColors.white, darkModeColor: FinnColors.black) }
    var backgroundHover: Color { Color.dynamicColor(defaultColor: FinnColors.blueGray100, darkModeColor: FinnColors.blueGray800) }
    var backgroundActive: Color { Color.dynamicColor(defaultColor: FinnColors.blueGray200, darkModeColor: FinnColors.blueGray900) }
    var backgroundDisabled: Color { Color.dynamicColor(defaultColor: FinnColors.blueGray300, darkModeColor: FinnColors.blueGray700) }
    var backgroundSubtle: Color { Color.dynamicColor(defaultColor: FinnColors.blueGray50, darkModeColor: FinnColors.gray900) }
    var backgroundSubtleHover: Color { Color.dynamicColor(defaultColor: FinnColors.blueGray100, darkModeColor: FinnColors.blueGray800) }
    var backgroundSubtleActive: Color { Color.dynamicColor(defaultColor: FinnColors.blueGray200, darkModeColor: FinnColors.blueGray900) }
    var backgroundSelected: Color { Color.dynamicColor(defaultColor: FinnColors.blue50, darkModeColor: FinnColors.blue900) }
    var backgroundSelectedHover: Color { Color.dynamicColor(defaultColor: FinnColors.blue100, darkModeColor: FinnColors.blue800) }
    
    var backgroundInverted: Color { Color.dynamicColor(defaultColor: FinnColors.gray900, darkModeColor: FinnColors.gray50) }
    
    var backgroundButtonPrimary: Color { Color.dynamicColor(defaultColor: FinnColors.blue600, darkModeColor: FinnColors.blue500) }
    var backgroundPrimary: Color { Color.dynamicColor(defaultColor: FinnColors.blue600, darkModeColor: FinnColors.blue500) }
    var backgroundPrimaryHover: Color { Color.dynamicColor(defaultColor: FinnColors.blue700, darkModeColor: FinnColors.blue600) }
    var backgroundPrimaryActive: Color { Color.dynamicColor(defaultColor: FinnColors.blue800, darkModeColor: FinnColors.blue700) }
    var backgroundPrimarySubtle: Color { Color.dynamicColor(defaultColor: FinnColors.blue50, darkModeColor: FinnColors.blue900) }
    var backgroundPrimarySubtleHover: Color { Color.dynamicColor(defaultColor: FinnColors.blue100, darkModeColor: FinnColors.blue800) }
    var backgroundPrimarySubtleActive: Color { Color.dynamicColor(defaultColor: FinnColors.blue200, darkModeColor: FinnColors.blue900) }
    
    var backgroundPositive: Color { Color.dynamicColor(defaultColor: FinnColors.green600, darkModeColor: FinnColors.green500) }
    var backgroundPositiveHover: Color { Color.dynamicColor(defaultColor: FinnColors.green700, darkModeColor: FinnColors.green600) }
    var backgroundPositiveActive: Color { Color.dynamicColor(defaultColor: FinnColors.green800, darkModeColor: FinnColors.green700) }
    var backgroundPositiveSubtle: Color { Color.dynamicColor(defaultColor: FinnColors.green50, darkModeColor: FinnColors.green900) }
    var backgroundPositiveSubtleHover: Color { Color.dynamicColor(defaultColor: FinnColors.green100, darkModeColor: FinnColors.green800) }
    var backgroundPositiveSubtleActive: Color { Color.dynamicColor(defaultColor: FinnColors.green200, darkModeColor: FinnColors.green900) }
    var backgroundPositiveSelected: Color { Color.dynamicColor(defaultColor: FinnColors.green50, darkModeColor: FinnColors.green900) }
    var backgroundPositiveSelectedHover: Color { Color.dynamicColor(defaultColor: FinnColors.green100, darkModeColor: FinnColors.green800) }
    
    var backgroundNegative: Color { Color.dynamicColor(defaultColor: FinnColors.red600, darkModeColor: FinnColors.red500) }
    var backgroundNegativeHover: Color { Color.dynamicColor(defaultColor: FinnColors.red700, darkModeColor: FinnColors.red600) }
    var backgroundNegativeActive: Color { Color.dynamicColor(defaultColor: FinnColors.red800, darkModeColor: FinnColors.red700) }
    var backgroundNegativeSubtle: Color { Color.dynamicColor(defaultColor: FinnColors.red50, darkModeColor: FinnColors.red900) }
    var backgroundNegativeSubtleHover: Color { Color.dynamicColor(defaultColor: FinnColors.red100, darkModeColor: FinnColors.red800) }
    var backgroundNegativeSubtleActive: Color { Color.dynamicColor(defaultColor: FinnColors.red200, darkModeColor: FinnColors.red900) }
    var backgroundNegativeSelected: Color { Color.dynamicColor(defaultColor: FinnColors.red50, darkModeColor: FinnColors.red900) }
    var backgroundNegativeSelectedHover: Color { Color.dynamicColor(defaultColor: FinnColors.red100, darkModeColor: FinnColors.red800) }
    
    var backgroundWarning: Color { Color.dynamicColor(defaultColor: FinnColors.yellow600, darkModeColor: FinnColors.yellow500) }
    var backgroundWarningHover: Color { Color.dynamicColor(defaultColor: FinnColors.yellow700, darkModeColor: FinnColors.yellow600) }
    var backgroundWarningActive: Color { Color.dynamicColor(defaultColor: FinnColors.yellow800, darkModeColor: FinnColors.yellow700) }
    var backgroundWarningSubtle: Color { Color.dynamicColor(defaultColor: FinnColors.yellow50, darkModeColor: FinnColors.yellow900) }
    var backgroundWarningSubtleHover: Color { Color.dynamicColor(defaultColor: FinnColors.yellow100, darkModeColor: FinnColors.yellow800) }
    var backgroundWarningSubtleActive: Color { Color.dynamicColor(defaultColor: FinnColors.yellow200, darkModeColor: FinnColors.yellow900) }
    var backgroundWarningSelected: Color { Color.dynamicColor(defaultColor: FinnColors.yellow50, darkModeColor: FinnColors.yellow900) }
    var backgroundWarningSelectedHover: Color { Color.dynamicColor(defaultColor: FinnColors.yellow100, darkModeColor: FinnColors.yellow800) }
    
    var backgroundInfo: Color { Color.dynamicColor(defaultColor: FinnColors.aqua600, darkModeColor: FinnColors.aqua500) }
    var backgroundInfoHover: Color { Color.dynamicColor(defaultColor: FinnColors.aqua700, darkModeColor: FinnColors.aqua600) }
    var backgroundInfoActive: Color { Color.dynamicColor(defaultColor: FinnColors.aqua800, darkModeColor: FinnColors.aqua700) }
    var backgroundInfoSubtle: Color { Color.dynamicColor(defaultColor: FinnColors.aqua50, darkModeColor: FinnColors.aqua900) }
    var backgroundInfoSubtleHover: Color { Color.dynamicColor(defaultColor: FinnColors.aqua100, darkModeColor: FinnColors.aqua800) }
    var backgroundInfoSubtleActive: Color { Color.dynamicColor(defaultColor: FinnColors.aqua200, darkModeColor: FinnColors.aqua900) }
    var backgroundInfoSelected: Color { Color.dynamicColor(defaultColor: FinnColors.aqua50, darkModeColor: FinnColors.aqua500) }
    
    var backgroundNotification: Color { Color.dynamicColor(defaultColor: FinnColors.red600, darkModeColor: FinnColors.red500) }
    
    /// Border
    var border: Color { Color.dynamicColor(defaultColor: FinnColors.blueGray300, darkModeColor: FinnColors.blueGray600) }
    var borderHover: Color { Color.dynamicColor(defaultColor: FinnColors.blueGray400, darkModeColor: FinnColors.blueGray700) }
    var borderActive: Color { Color.dynamicColor(defaultColor: FinnColors.blueGray500, darkModeColor: FinnColors.blueGray800) }
    var borderDisabled: Color { Color.dynamicColor(defaultColor: FinnColors.blueGray300, darkModeColor: FinnColors.blueGray300) }
    var borderSelected: Color { Color.dynamicColor(defaultColor: FinnColors.blue600, darkModeColor: FinnColors.blue500) }
    var borderSelectedHover: Color { Color.dynamicColor(defaultColor: FinnColors.blue700, darkModeColor: FinnColors.blue600) }
                
    var borderButtonPrimary: Color { Color.dynamicColor(defaultColor: FinnColors.blue600, darkModeColor: FinnColors.blue500) }
    var borderButtonSecondary: Color { Color.dynamicColor(defaultColor: FinnColors.blueGray300, darkModeColor: FinnColors.blueGray600) }
    var borderPrimary: Color { Color.dynamicColor(defaultColor: FinnColors.blue600, darkModeColor: FinnColors.blue500) }
    var borderPrimaryHover: Color { Color.dynamicColor(defaultColor: FinnColors.blue700, darkModeColor: FinnColors.blue600) }
    var borderPrimaryActive: Color { Color.dynamicColor(defaultColor: FinnColors.blue800, darkModeColor: FinnColors.blue700) }
    var borderPrimarySubtle: Color { Color.dynamicColor(defaultColor: FinnColors.blue300, darkModeColor: FinnColors.blue700) }
    var borderPrimarySubtleHover: Color { Color.dynamicColor(defaultColor: FinnColors.blue400, darkModeColor: FinnColors.blue800) }
    var borderPrimarySubtleActive: Color { Color.dynamicColor(defaultColor: FinnColors.blue500, darkModeColor: FinnColors.blue900) }
                        
    var borderPositive: Color { Color.dynamicColor(defaultColor: FinnColors.green600, darkModeColor: FinnColors.green500) }
    var borderPositiveHover: Color { Color.dynamicColor(defaultColor: FinnColors.green700, darkModeColor: FinnColors.green600) }
    var borderPositiveActive: Color { Color.dynamicColor(defaultColor: FinnColors.green800, darkModeColor: FinnColors.green700) }
    var borderPositiveSubtle: Color { Color.dynamicColor(defaultColor: FinnColors.green300, darkModeColor: FinnColors.green700) }
    var borderPositiveSubtleHover: Color { Color.dynamicColor(defaultColor: FinnColors.green400, darkModeColor: FinnColors.green800) }
    var borderPositiveSubtleActive: Color { Color.dynamicColor(defaultColor: FinnColors.green500, darkModeColor: FinnColors.green900) }
                        
    var borderNegative: Color { Color.dynamicColor(defaultColor: FinnColors.red600, darkModeColor: FinnColors.red500) }
    var borderNegativeHover: Color { Color.dynamicColor(defaultColor: FinnColors.red700, darkModeColor: FinnColors.red600) }
    var borderNegativeActive: Color { Color.dynamicColor(defaultColor: FinnColors.red800, darkModeColor: FinnColors.red700) }
    var borderNegativeSubtle: Color { Color.dynamicColor(defaultColor: FinnColors.red300, darkModeColor: FinnColors.red700) }
    var borderNegativeSubtleHover: Color { Color.dynamicColor(defaultColor: FinnColors.red400, darkModeColor: FinnColors.red800) }
    var borderNegativeSubtleActive: Color { Color.dynamicColor(defaultColor: FinnColors.red500, darkModeColor: FinnColors.red900) }
                        
    var borderWarning: Color { Color.dynamicColor(defaultColor: FinnColors.yellow600, darkModeColor: FinnColors.yellow500) }
    var borderWarningHover: Color { Color.dynamicColor(defaultColor: FinnColors.yellow700, darkModeColor: FinnColors.yellow600) }
    var borderWarningActive: Color { Color.dynamicColor(defaultColor: FinnColors.yellow800, darkModeColor: FinnColors.yellow700) }
    var borderWarningSubtle: Color { Color.dynamicColor(defaultColor: FinnColors.yellow300, darkModeColor: FinnColors.yellow700) }
    var borderWarningSubtleHover: Color { Color.dynamicColor(defaultColor: FinnColors.yellow400, darkModeColor: FinnColors.yellow800) }
    var borderWarningSubtleActive: Color { Color.dynamicColor(defaultColor: FinnColors.yellow500, darkModeColor: FinnColors.yellow900) }
                        
    var borderInfo: Color { Color.dynamicColor(defaultColor: FinnColors.aqua600, darkModeColor: FinnColors.aqua500) }
    var borderInfoHover: Color { Color.dynamicColor(defaultColor: FinnColors.aqua700, darkModeColor: FinnColors.aqua600) }
    var borderInfoActive: Color { Color.dynamicColor(defaultColor: FinnColors.aqua800, darkModeColor: FinnColors.aqua700) }
    var borderInfoSubtle: Color { Color.dynamicColor(defaultColor: FinnColors.aqua300, darkModeColor: FinnColors.aqua700) }
    var borderInfoSubtleHover: Color { Color.dynamicColor(defaultColor: FinnColors.aqua400, darkModeColor: FinnColors.aqua800) }
    var borderInfoSubtleActive: Color { Color.dynamicColor(defaultColor: FinnColors.aqua500, darkModeColor: FinnColors.aqua900) }
                        
    /// Icon
    var icon: Color { Color.dynamicColor(defaultColor: FinnColors.gray700, darkModeColor: FinnColors.white) }
    var iconHover: Color { Color.dynamicColor(defaultColor: FinnColors.blue600, darkModeColor: FinnColors.gray100) }
    var iconActive: Color { Color.dynamicColor(defaultColor: FinnColors.blue700, darkModeColor: FinnColors.gray200) }
    var iconSelected: Color { Color.dynamicColor(defaultColor: FinnColors.blue600, darkModeColor: FinnColors.blue500) }
    var iconSelectedHover: Color { Color.dynamicColor(defaultColor: FinnColors.blue700, darkModeColor: FinnColors.blue600) }
    var iconDisabled: Color { Color.dynamicColor(defaultColor: FinnColors.blueGray300, darkModeColor: FinnColors.blueGray600) }
    var iconSubtle: Color { Color.dynamicColor(defaultColor: FinnColors.blueGray400, darkModeColor: FinnColors.blueGray100) }
    var iconSubtleHover: Color { Color.dynamicColor(defaultColor: FinnColors.blueGray500, darkModeColor: FinnColors.blueGray200) }
    var iconSubtleActive: Color { Color.dynamicColor(defaultColor: FinnColors.blueGray600, darkModeColor: FinnColors.blueGray300) }
    var iconInverted: Color { Color.dynamicColor(defaultColor: FinnColors.white, darkModeColor: FinnColors.black) }
    var iconInvertedHover: Color { Color.dynamicColor(defaultColor: FinnColors.blueGray100, darkModeColor: FinnColors.blueGray800) }
    var iconInvertedActive: Color { Color.dynamicColor(defaultColor: FinnColors.blueGray200, darkModeColor: FinnColors.blueGray900) }
    var iconPrimary: Color { Color.dynamicColor(defaultColor: FinnColors.blue600, darkModeColor: FinnColors.blue500) }
    var iconPositive: Color { Color.dynamicColor(defaultColor: FinnColors.green600, darkModeColor: FinnColors.green500) }
    var iconNegative: Color { Color.dynamicColor(defaultColor: FinnColors.red600, darkModeColor: FinnColors.red500) }
    var iconWarning: Color { Color.dynamicColor(defaultColor: FinnColors.yellow600, darkModeColor: FinnColors.yellow500) }
    var iconInfo: Color { Color.dynamicColor(defaultColor: FinnColors.aqua600, darkModeColor: FinnColors.aqua500) }
                        
    var iconNotification: Color { Color.dynamicColor(defaultColor: FinnColors.white, darkModeColor: FinnColors.white) }
                        
    /// Text
    var text: Color { Color.dynamicColor(defaultColor: FinnColors.gray700, darkModeColor: FinnColors.white) }
    var textSubtle: Color { Color.dynamicColor(defaultColor: FinnColors.gray500, darkModeColor: FinnColors.gray100) }
    var textPlaceholder: Color { Color.dynamicColor(defaultColor: FinnColors.blueGray300, darkModeColor: FinnColors.blueGray500) }
    var textInverted: Color { Color.dynamicColor(defaultColor: FinnColors.white, darkModeColor: FinnColors.white) }
    var textInvertedSubtle: Color { Color.dynamicColor(defaultColor: FinnColors.gray50, darkModeColor: FinnColors.gray800) }
    var textLink: Color { Color.dynamicColor(defaultColor: FinnColors.blue600, darkModeColor: FinnColors.blue500) }
    var textDisabled: Color { Color.dynamicColor(defaultColor: FinnColors.blueGray300, darkModeColor: FinnColors.blueGray500) }
    var textNegative: Color { Color.dynamicColor(defaultColor: FinnColors.red600, darkModeColor: FinnColors.red500) }
    var textPositive: Color { Color.dynamicColor(defaultColor: FinnColors.green600, darkModeColor: FinnColors.green500) }
    var textNotification: Color { Color.dynamicColor(defaultColor: FinnColors.white, darkModeColor: FinnColors.white) }
}
