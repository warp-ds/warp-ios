import SwiftUI

// Generated on Thu, 30 Jan 2025 13:44:32 GMT by https://github.com/warp-ds/tokens
struct DbaTokenProvider: TokenProvider {
    public var text: Color { Color.dynamicColor(defaultColor: DbaColors.gray900, darkModeColor: DbaColors.white) }
    public var textSubtle: Color { Color.dynamicColor(defaultColor: DbaColors.gray600, darkModeColor: DbaColors.gray400) }
    public var textStatic: Color { Color.dynamicColor(defaultColor: DbaColors.gray900, darkModeColor: DbaColors.gray900) }
    public var textPlaceholder: Color { Color.dynamicColor(defaultColor: DbaColors.gray300, darkModeColor: DbaColors.gray500) }
    public var textInverted: Color { Color.dynamicColor(defaultColor: DbaColors.white, darkModeColor: DbaColors.gray900) }
    public var textInvertedSubtle: Color { Color.dynamicColor(defaultColor: DbaColors.gray400, darkModeColor: DbaColors.gray600) }
    public var textInvertedStatic: Color { Color.dynamicColor(defaultColor: DbaColors.white, darkModeColor: DbaColors.white) }
    public var textLink: Color { Color.dynamicColor(defaultColor: DbaColors.jeanblue600, darkModeColor: DbaColors.jeanblue400) }
    public var textDisabled: Color { Color.dynamicColor(defaultColor: DbaColors.gray300, darkModeColor: DbaColors.gray500) }
    public var textNegative: Color { Color.dynamicColor(defaultColor: DbaColors.red600, darkModeColor: DbaColors.red400) }
    public var textPositive: Color { Color.dynamicColor(defaultColor: DbaColors.green600, darkModeColor: DbaColors.green500) }
    public var background: Color { Color.dynamicColor(defaultColor: DbaColors.white, darkModeColor: DbaColors.gray900) }
    public var backgroundHover: Color { Color.dynamicColor(defaultColor: DbaColors.gray100, darkModeColor: DbaColors.gray850) }
    public var backgroundActive: Color { Color.dynamicColor(defaultColor: DbaColors.gray200, darkModeColor: DbaColors.gray800) }
    public var backgroundSubtle: Color { Color.dynamicColor(defaultColor: DbaColors.gray100, darkModeColor: DbaColors.gray750) }
    public var backgroundSubtleHover: Color { Color.dynamicColor(defaultColor: DbaColors.gray200, darkModeColor: DbaColors.gray700) }
    public var backgroundSubtleActive: Color { Color.dynamicColor(defaultColor: DbaColors.gray300, darkModeColor: DbaColors.gray600) }
    public var backgroundDisabled: Color { Color.dynamicColor(defaultColor: DbaColors.gray300, darkModeColor: DbaColors.gray700) }
    public var backgroundDisabledSubtle: Color { Color.dynamicColor(defaultColor: DbaColors.gray200, darkModeColor: DbaColors.gray600) }
    public var backgroundSelected: Color { Color.dynamicColor(defaultColor: DbaColors.jeanblue50, darkModeColor: DbaColors.jeanblue900) }
    public var backgroundSelectedHover: Color { Color.dynamicColor(defaultColor: DbaColors.jeanblue100, darkModeColor: DbaColors.jeanblue800) }
    public var backgroundSelectedActive: Color { Color.dynamicColor(defaultColor: DbaColors.jeanblue200, darkModeColor: DbaColors.jeanblue700) }
    public var backgroundInverted: Color { Color.dynamicColor(defaultColor: DbaColors.gray900, darkModeColor: DbaColors.gray50) }
    public var backgroundPrimary: Color { Color.dynamicColor(defaultColor: DbaColors.jeanblue600, darkModeColor: DbaColors.jeanblue400) }
    public var backgroundPrimaryHover: Color { Color.dynamicColor(defaultColor: DbaColors.jeanblue700, darkModeColor: DbaColors.jeanblue300) }
    public var backgroundPrimaryActive: Color { Color.dynamicColor(defaultColor: DbaColors.jeanblue800, darkModeColor: DbaColors.jeanblue200) }
    public var backgroundPrimarySubtle: Color { Color.dynamicColor(defaultColor: DbaColors.jeanblue100, darkModeColor: DbaColors.jeanblue850) }
    public var backgroundPrimarySubtleHover: Color { Color.dynamicColor(defaultColor: DbaColors.jeanblue200, darkModeColor: DbaColors.jeanblue800) }
    public var backgroundPrimarySubtleActive: Color { Color.dynamicColor(defaultColor: DbaColors.jeanblue300, darkModeColor: DbaColors.jeanblue750) }
    public var backgroundSecondary: Color { Color.dynamicColor(defaultColor: DbaColors.phthaloblue600, darkModeColor: DbaColors.phthaloblue400) }
    public var backgroundSecondaryHover: Color { Color.dynamicColor(defaultColor: DbaColors.phthaloblue700, darkModeColor: DbaColors.phthaloblue300) }
    public var backgroundSecondaryActive: Color { Color.dynamicColor(defaultColor: DbaColors.phthaloblue800, darkModeColor: DbaColors.phthaloblue200) }
    public var backgroundPositive: Color { Color.dynamicColor(defaultColor: DbaColors.green600, darkModeColor: DbaColors.green500) }
    public var backgroundPositiveHover: Color { Color.dynamicColor(defaultColor: DbaColors.green700, darkModeColor: DbaColors.green400) }
    public var backgroundPositiveActive: Color { Color.dynamicColor(defaultColor: DbaColors.green800, darkModeColor: DbaColors.green300) }
    public var backgroundPositiveSubtle: Color { Color.dynamicColor(defaultColor: DbaColors.green50, darkModeColor: DbaColors.green900) }
    public var backgroundPositiveSubtleHover: Color { Color.dynamicColor(defaultColor: DbaColors.green100, darkModeColor: DbaColors.green800) }
    public var backgroundPositiveSubtleActive: Color { Color.dynamicColor(defaultColor: DbaColors.green200, darkModeColor: DbaColors.green700) }
    public var backgroundNegative: Color { Color.dynamicColor(defaultColor: DbaColors.red600, darkModeColor: DbaColors.red400) }
    public var backgroundNegativeHover: Color { Color.dynamicColor(defaultColor: DbaColors.red700, darkModeColor: DbaColors.red300) }
    public var backgroundNegativeActive: Color { Color.dynamicColor(defaultColor: DbaColors.red800, darkModeColor: DbaColors.red200) }
    public var backgroundNegativeSubtle: Color { Color.dynamicColor(defaultColor: DbaColors.red50, darkModeColor: DbaColors.red900) }
    public var backgroundNegativeSubtleHover: Color { Color.dynamicColor(defaultColor: DbaColors.red100, darkModeColor: DbaColors.red800) }
    public var backgroundNegativeSubtleActive: Color { Color.dynamicColor(defaultColor: DbaColors.red200, darkModeColor: DbaColors.red700) }
    public var backgroundWarning: Color { Color.dynamicColor(defaultColor: DbaColors.yellow600, darkModeColor: DbaColors.yellow500) }
    public var backgroundWarningHover: Color { Color.dynamicColor(defaultColor: DbaColors.yellow700, darkModeColor: DbaColors.yellow400) }
    public var backgroundWarningActive: Color { Color.dynamicColor(defaultColor: DbaColors.yellow800, darkModeColor: DbaColors.yellow300) }
    public var backgroundWarningSubtle: Color { Color.dynamicColor(defaultColor: DbaColors.yellow50, darkModeColor: DbaColors.yellow900) }
    public var backgroundWarningSubtleHover: Color { Color.dynamicColor(defaultColor: DbaColors.yellow100, darkModeColor: DbaColors.yellow800) }
    public var backgroundWarningSubtleActive: Color { Color.dynamicColor(defaultColor: DbaColors.yellow200, darkModeColor: DbaColors.yellow700) }
    public var backgroundInfo: Color { Color.dynamicColor(defaultColor: DbaColors.jeanblue600, darkModeColor: DbaColors.jeanblue500) }
    public var backgroundInfoHover: Color { Color.dynamicColor(defaultColor: DbaColors.jeanblue700, darkModeColor: DbaColors.jeanblue400) }
    public var backgroundInfoActive: Color { Color.dynamicColor(defaultColor: DbaColors.jeanblue800, darkModeColor: DbaColors.jeanblue300) }
    public var backgroundInfoSubtle: Color { Color.dynamicColor(defaultColor: DbaColors.jeanblue50, darkModeColor: DbaColors.jeanblue900) }
    public var backgroundInfoSubtleHover: Color { Color.dynamicColor(defaultColor: DbaColors.jeanblue100, darkModeColor: DbaColors.jeanblue800) }
    public var backgroundInfoSubtleActive: Color { Color.dynamicColor(defaultColor: DbaColors.jeanblue200, darkModeColor: DbaColors.phthaloblue700) }
    public var backgroundTransparent0: Color { Color.dynamicColor(defaultColor: DbaColors.transparent, darkModeColor: DbaColors.transparent) }
    public var backgroundNotification: Color { Color.dynamicColor(defaultColor: DbaColors.red600, darkModeColor: DbaColors.red500) }
    public var surfaceSunken: Color { Color.dynamicColor(defaultColor: DbaColors.gray50, darkModeColor: DbaColors.gray950) }
    public var surfaceElevated100: Color { Color.dynamicColor(defaultColor: DbaColors.white, darkModeColor: DbaColors.gray850) }
    public var surfaceElevated100Hover: Color { Color.dynamicColor(defaultColor: DbaColors.gray100, darkModeColor: DbaColors.gray800) }
    public var surfaceElevated100Active: Color { Color.dynamicColor(defaultColor: DbaColors.gray200, darkModeColor: DbaColors.gray750) }
    public var surfaceElevated200: Color { Color.dynamicColor(defaultColor: DbaColors.white, darkModeColor: DbaColors.gray800) }
    public var surfaceElevated200Hover: Color { Color.dynamicColor(defaultColor: DbaColors.gray100, darkModeColor: DbaColors.gray750) }
    public var surfaceElevated200Active: Color { Color.dynamicColor(defaultColor: DbaColors.gray200, darkModeColor: DbaColors.gray700) }
    public var surfaceElevated300: Color { Color.dynamicColor(defaultColor: DbaColors.white, darkModeColor: DbaColors.gray750) }
    public var surfaceElevated300Hover: Color { Color.dynamicColor(defaultColor: DbaColors.gray100, darkModeColor: DbaColors.gray700) }
    public var surfaceElevated300Active: Color { Color.dynamicColor(defaultColor: DbaColors.gray200, darkModeColor: DbaColors.gray600) }
    public var border: Color { Color.dynamicColor(defaultColor: DbaColors.gray300, darkModeColor: DbaColors.gray600) }
    public var borderHover: Color { Color.dynamicColor(defaultColor: DbaColors.gray400, darkModeColor: DbaColors.gray500) }
    public var borderActive: Color { Color.dynamicColor(defaultColor: DbaColors.gray500, darkModeColor: DbaColors.gray400) }
    public var borderDisabled: Color { Color.dynamicColor(defaultColor: DbaColors.gray300, darkModeColor: DbaColors.gray700) }
    public var borderSelected: Color { Color.dynamicColor(defaultColor: DbaColors.jeanblue600, darkModeColor: DbaColors.jeanblue400) }
    public var borderSelectedHover: Color { Color.dynamicColor(defaultColor: DbaColors.jeanblue700, darkModeColor: DbaColors.jeanblue300) }
    public var borderSelectedActive: Color { Color.dynamicColor(defaultColor: DbaColors.jeanblue800, darkModeColor: DbaColors.jeanblue200) }
    public var borderInverted: Color { Color.dynamicColor(defaultColor: DbaColors.white, darkModeColor: DbaColors.gray900) }
    public var borderPrimary: Color { Color.dynamicColor(defaultColor: DbaColors.jeanblue600, darkModeColor: DbaColors.jeanblue400) }
    public var borderPrimaryHover: Color { Color.dynamicColor(defaultColor: DbaColors.jeanblue700, darkModeColor: DbaColors.jeanblue300) }
    public var borderPrimaryActive: Color { Color.dynamicColor(defaultColor: DbaColors.jeanblue800, darkModeColor: DbaColors.jeanblue200) }
    public var borderPrimarySubtle: Color { Color.dynamicColor(defaultColor: DbaColors.jeanblue300, darkModeColor: DbaColors.jeanblue700) }
    public var borderPrimarySubtleHover: Color { Color.dynamicColor(defaultColor: DbaColors.jeanblue400, darkModeColor: DbaColors.jeanblue600) }
    public var borderPrimarySubtleActive: Color { Color.dynamicColor(defaultColor: DbaColors.jeanblue500, darkModeColor: DbaColors.jeanblue500) }
    public var borderSecondary: Color { Color.dynamicColor(defaultColor: DbaColors.phthaloblue600, darkModeColor: DbaColors.phthaloblue400) }
    public var borderSecondaryHover: Color { Color.dynamicColor(defaultColor: DbaColors.phthaloblue700, darkModeColor: DbaColors.phthaloblue300) }
    public var borderSecondaryActive: Color { Color.dynamicColor(defaultColor: DbaColors.phthaloblue800, darkModeColor: DbaColors.phthaloblue200) }
    public var borderPositive: Color { Color.dynamicColor(defaultColor: DbaColors.green600, darkModeColor: DbaColors.green500) }
    public var borderPositiveHover: Color { Color.dynamicColor(defaultColor: DbaColors.green700, darkModeColor: DbaColors.green400) }
    public var borderPositiveActive: Color { Color.dynamicColor(defaultColor: DbaColors.green800, darkModeColor: DbaColors.green300) }
    public var borderPositiveSubtle: Color { Color.dynamicColor(defaultColor: DbaColors.green300, darkModeColor: DbaColors.green700) }
    public var borderPositiveSubtleHover: Color { Color.dynamicColor(defaultColor: DbaColors.green400, darkModeColor: DbaColors.green600) }
    public var borderPositiveSubtleActive: Color { Color.dynamicColor(defaultColor: DbaColors.green500, darkModeColor: DbaColors.green500) }
    public var borderNegative: Color { Color.dynamicColor(defaultColor: DbaColors.red600, darkModeColor: DbaColors.red400) }
    public var borderNegativeHover: Color { Color.dynamicColor(defaultColor: DbaColors.red700, darkModeColor: DbaColors.red300) }
    public var borderNegativeActive: Color { Color.dynamicColor(defaultColor: DbaColors.red800, darkModeColor: DbaColors.red200) }
    public var borderNegativeSubtle: Color { Color.dynamicColor(defaultColor: DbaColors.red300, darkModeColor: DbaColors.red700) }
    public var borderNegativeSubtleHover: Color { Color.dynamicColor(defaultColor: DbaColors.red400, darkModeColor: DbaColors.red600) }
    public var borderNegativeSubtleActive: Color { Color.dynamicColor(defaultColor: DbaColors.red500, darkModeColor: DbaColors.red500) }
    public var borderWarning: Color { Color.dynamicColor(defaultColor: DbaColors.yellow600, darkModeColor: DbaColors.yellow500) }
    public var borderWarningHover: Color { Color.dynamicColor(defaultColor: DbaColors.yellow700, darkModeColor: DbaColors.yellow400) }
    public var borderWarningActive: Color { Color.dynamicColor(defaultColor: DbaColors.yellow800, darkModeColor: DbaColors.yellow300) }
    public var borderWarningSubtle: Color { Color.dynamicColor(defaultColor: DbaColors.yellow300, darkModeColor: DbaColors.yellow700) }
    public var borderWarningSubtleHover: Color { Color.dynamicColor(defaultColor: DbaColors.yellow400, darkModeColor: DbaColors.yellow600) }
    public var borderWarningSubtleActive: Color { Color.dynamicColor(defaultColor: DbaColors.yellow500, darkModeColor: DbaColors.yellow500) }
    public var borderInfo: Color { Color.dynamicColor(defaultColor: DbaColors.jeanblue600, darkModeColor: DbaColors.jeanblue500) }
    public var borderInfoHover: Color { Color.dynamicColor(defaultColor: DbaColors.jeanblue700, darkModeColor: DbaColors.jeanblue400) }
    public var borderInfoActive: Color { Color.dynamicColor(defaultColor: DbaColors.jeanblue800, darkModeColor: DbaColors.jeanblue300) }
    public var borderInfoSubtle: Color { Color.dynamicColor(defaultColor: DbaColors.jeanblue300, darkModeColor: DbaColors.jeanblue700) }
    public var borderInfoSubtleHover: Color { Color.dynamicColor(defaultColor: DbaColors.jeanblue400, darkModeColor: DbaColors.jeanblue600) }
    public var borderInfoSubtleActive: Color { Color.dynamicColor(defaultColor: DbaColors.jeanblue500, darkModeColor: DbaColors.jeanblue500) }
    public var borderFocus: Color { Color.dynamicColor(defaultColor: DbaColors.jeanblue400, darkModeColor: DbaColors.jeanblue300) }
    public var icon: Color { Color.dynamicColor(defaultColor: DbaColors.gray900, darkModeColor: DbaColors.white) }
    public var iconHover: Color { Color.dynamicColor(defaultColor: DbaColors.jeanblue700, darkModeColor: DbaColors.jeanblue100) }
    public var iconActive: Color { Color.dynamicColor(defaultColor: DbaColors.jeanblue800, darkModeColor: DbaColors.jeanblue200) }
    public var iconStatic: Color { Color.dynamicColor(defaultColor: DbaColors.gray900, darkModeColor: DbaColors.gray900) }
    public var iconSelected: Color { Color.dynamicColor(defaultColor: DbaColors.jeanblue600, darkModeColor: DbaColors.jeanblue400) }
    public var iconSelectedHover: Color { Color.dynamicColor(defaultColor: DbaColors.jeanblue700, darkModeColor: DbaColors.jeanblue300) }
    public var iconSelectedActive: Color { Color.dynamicColor(defaultColor: DbaColors.jeanblue800, darkModeColor: DbaColors.jeanblue200) }
    public var iconDisabled: Color { Color.dynamicColor(defaultColor: DbaColors.gray300, darkModeColor: DbaColors.gray600) }
    public var iconSubtle: Color { Color.dynamicColor(defaultColor: DbaColors.gray600, darkModeColor: DbaColors.gray400) }
    public var iconSubtleHover: Color { Color.dynamicColor(defaultColor: DbaColors.gray700, darkModeColor: DbaColors.gray300) }
    public var iconSubtleActive: Color { Color.dynamicColor(defaultColor: DbaColors.gray800, darkModeColor: DbaColors.gray200) }
    public var iconInverted: Color { Color.dynamicColor(defaultColor: DbaColors.white, darkModeColor: DbaColors.gray900) }
    public var iconInvertedHover: Color { Color.dynamicColor(defaultColor: DbaColors.gray100, darkModeColor: DbaColors.gray850) }
    public var iconInvertedActive: Color { Color.dynamicColor(defaultColor: DbaColors.gray200, darkModeColor: DbaColors.gray800) }
    public var iconInvertedStatic: Color { Color.dynamicColor(defaultColor: DbaColors.white, darkModeColor: DbaColors.white) }
    public var iconPrimary: Color { Color.dynamicColor(defaultColor: DbaColors.jeanblue600, darkModeColor: DbaColors.jeanblue400) }
    public var iconSecondary: Color { Color.dynamicColor(defaultColor: DbaColors.phthaloblue600, darkModeColor: DbaColors.phthaloblue400) }
    public var iconSecondaryHover: Color { Color.dynamicColor(defaultColor: DbaColors.phthaloblue700, darkModeColor: DbaColors.phthaloblue300) }
    public var iconSecondaryActive: Color { Color.dynamicColor(defaultColor: DbaColors.phthaloblue800, darkModeColor: DbaColors.phthaloblue200) }
    public var iconPositive: Color { Color.dynamicColor(defaultColor: DbaColors.green600, darkModeColor: DbaColors.green500) }
    public var iconNegative: Color { Color.dynamicColor(defaultColor: DbaColors.red600, darkModeColor: DbaColors.red400) }
    public var iconWarning: Color { Color.dynamicColor(defaultColor: DbaColors.yellow600, darkModeColor: DbaColors.yellow500) }
    public var iconInfo: Color { Color.dynamicColor(defaultColor: DbaColors.jeanblue600, darkModeColor: DbaColors.jeanblue500) }
    public var iconNotification: Color { Color.dynamicColor(defaultColor: DbaColors.white, darkModeColor: DbaColors.white) }
}

struct DbaUITokenProvider: UITokenProvider {
    public var text: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.gray900, darkModeColor: DbaUIColors.white) }
    public var textSubtle: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.gray600, darkModeColor: DbaUIColors.gray400) }
    public var textStatic: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.gray900, darkModeColor: DbaUIColors.gray900) }
    public var textPlaceholder: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.gray300, darkModeColor: DbaUIColors.gray500) }
    public var textInverted: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.white, darkModeColor: DbaUIColors.gray900) }
    public var textInvertedSubtle: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.gray400, darkModeColor: DbaUIColors.gray600) }
    public var textInvertedStatic: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.white, darkModeColor: DbaUIColors.white) }
    public var textLink: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.jeanblue600, darkModeColor: DbaUIColors.jeanblue400) }
    public var textDisabled: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.gray300, darkModeColor: DbaUIColors.gray500) }
    public var textNegative: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.red600, darkModeColor: DbaUIColors.red400) }
    public var textPositive: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.green600, darkModeColor: DbaUIColors.green500) }
    public var background: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.white, darkModeColor: DbaUIColors.gray900) }
    public var backgroundHover: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.gray100, darkModeColor: DbaUIColors.gray850) }
    public var backgroundActive: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.gray200, darkModeColor: DbaUIColors.gray800) }
    public var backgroundSubtle: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.gray100, darkModeColor: DbaUIColors.gray750) }
    public var backgroundSubtleHover: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.gray200, darkModeColor: DbaUIColors.gray700) }
    public var backgroundSubtleActive: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.gray300, darkModeColor: DbaUIColors.gray600) }
    public var backgroundDisabled: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.gray300, darkModeColor: DbaUIColors.gray700) }
    public var backgroundDisabledSubtle: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.gray200, darkModeColor: DbaUIColors.gray600) }
    public var backgroundSelected: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.jeanblue50, darkModeColor: DbaUIColors.jeanblue900) }
    public var backgroundSelectedHover: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.jeanblue100, darkModeColor: DbaUIColors.jeanblue800) }
    public var backgroundSelectedActive: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.jeanblue200, darkModeColor: DbaUIColors.jeanblue700) }
    public var backgroundInverted: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.gray900, darkModeColor: DbaUIColors.gray50) }
    public var backgroundPrimary: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.jeanblue600, darkModeColor: DbaUIColors.jeanblue400) }
    public var backgroundPrimaryHover: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.jeanblue700, darkModeColor: DbaUIColors.jeanblue300) }
    public var backgroundPrimaryActive: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.jeanblue800, darkModeColor: DbaUIColors.jeanblue200) }
    public var backgroundPrimarySubtle: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.jeanblue100, darkModeColor: DbaUIColors.jeanblue850) }
    public var backgroundPrimarySubtleHover: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.jeanblue200, darkModeColor: DbaUIColors.jeanblue800) }
    public var backgroundPrimarySubtleActive: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.jeanblue300, darkModeColor: DbaUIColors.jeanblue750) }
    public var backgroundSecondary: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.phthaloblue600, darkModeColor: DbaUIColors.phthaloblue400) }
    public var backgroundSecondaryHover: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.phthaloblue700, darkModeColor: DbaUIColors.phthaloblue300) }
    public var backgroundSecondaryActive: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.phthaloblue800, darkModeColor: DbaUIColors.phthaloblue200) }
    public var backgroundPositive: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.green600, darkModeColor: DbaUIColors.green500) }
    public var backgroundPositiveHover: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.green700, darkModeColor: DbaUIColors.green400) }
    public var backgroundPositiveActive: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.green800, darkModeColor: DbaUIColors.green300) }
    public var backgroundPositiveSubtle: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.green50, darkModeColor: DbaUIColors.green900) }
    public var backgroundPositiveSubtleHover: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.green100, darkModeColor: DbaUIColors.green800) }
    public var backgroundPositiveSubtleActive: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.green200, darkModeColor: DbaUIColors.green700) }
    public var backgroundNegative: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.red600, darkModeColor: DbaUIColors.red400) }
    public var backgroundNegativeHover: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.red700, darkModeColor: DbaUIColors.red300) }
    public var backgroundNegativeActive: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.red800, darkModeColor: DbaUIColors.red200) }
    public var backgroundNegativeSubtle: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.red50, darkModeColor: DbaUIColors.red900) }
    public var backgroundNegativeSubtleHover: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.red100, darkModeColor: DbaUIColors.red800) }
    public var backgroundNegativeSubtleActive: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.red200, darkModeColor: DbaUIColors.red700) }
    public var backgroundWarning: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.yellow600, darkModeColor: DbaUIColors.yellow500) }
    public var backgroundWarningHover: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.yellow700, darkModeColor: DbaUIColors.yellow400) }
    public var backgroundWarningActive: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.yellow800, darkModeColor: DbaUIColors.yellow300) }
    public var backgroundWarningSubtle: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.yellow50, darkModeColor: DbaUIColors.yellow900) }
    public var backgroundWarningSubtleHover: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.yellow100, darkModeColor: DbaUIColors.yellow800) }
    public var backgroundWarningSubtleActive: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.yellow200, darkModeColor: DbaUIColors.yellow700) }
    public var backgroundInfo: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.jeanblue600, darkModeColor: DbaUIColors.jeanblue500) }
    public var backgroundInfoHover: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.jeanblue700, darkModeColor: DbaUIColors.jeanblue400) }
    public var backgroundInfoActive: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.jeanblue800, darkModeColor: DbaUIColors.jeanblue300) }
    public var backgroundInfoSubtle: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.jeanblue50, darkModeColor: DbaUIColors.jeanblue900) }
    public var backgroundInfoSubtleHover: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.jeanblue100, darkModeColor: DbaUIColors.jeanblue800) }
    public var backgroundInfoSubtleActive: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.jeanblue200, darkModeColor: DbaUIColors.phthaloblue700) }
    public var backgroundTransparent0: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.transparent, darkModeColor: DbaUIColors.transparent) }
    public var backgroundNotification: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.red600, darkModeColor: DbaUIColors.red500) }
    public var surfaceSunken: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.gray50, darkModeColor: DbaUIColors.gray950) }
    public var surfaceElevated100: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.white, darkModeColor: DbaUIColors.gray850) }
    public var surfaceElevated100Hover: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.gray100, darkModeColor: DbaUIColors.gray800) }
    public var surfaceElevated100Active: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.gray200, darkModeColor: DbaUIColors.gray750) }
    public var surfaceElevated200: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.white, darkModeColor: DbaUIColors.gray800) }
    public var surfaceElevated200Hover: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.gray100, darkModeColor: DbaUIColors.gray750) }
    public var surfaceElevated200Active: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.gray200, darkModeColor: DbaUIColors.gray700) }
    public var surfaceElevated300: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.white, darkModeColor: DbaUIColors.gray750) }
    public var surfaceElevated300Hover: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.gray100, darkModeColor: DbaUIColors.gray700) }
    public var surfaceElevated300Active: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.gray200, darkModeColor: DbaUIColors.gray600) }
    public var border: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.gray300, darkModeColor: DbaUIColors.gray600) }
    public var borderHover: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.gray400, darkModeColor: DbaUIColors.gray500) }
    public var borderActive: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.gray500, darkModeColor: DbaUIColors.gray400) }
    public var borderDisabled: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.gray300, darkModeColor: DbaUIColors.gray700) }
    public var borderSelected: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.jeanblue600, darkModeColor: DbaUIColors.jeanblue400) }
    public var borderSelectedHover: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.jeanblue700, darkModeColor: DbaUIColors.jeanblue300) }
    public var borderSelectedActive: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.jeanblue800, darkModeColor: DbaUIColors.jeanblue200) }
    public var borderInverted: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.white, darkModeColor: DbaUIColors.gray900) }
    public var borderPrimary: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.jeanblue600, darkModeColor: DbaUIColors.jeanblue400) }
    public var borderPrimaryHover: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.jeanblue700, darkModeColor: DbaUIColors.jeanblue300) }
    public var borderPrimaryActive: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.jeanblue800, darkModeColor: DbaUIColors.jeanblue200) }
    public var borderPrimarySubtle: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.jeanblue300, darkModeColor: DbaUIColors.jeanblue700) }
    public var borderPrimarySubtleHover: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.jeanblue400, darkModeColor: DbaUIColors.jeanblue600) }
    public var borderPrimarySubtleActive: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.jeanblue500, darkModeColor: DbaUIColors.jeanblue500) }
    public var borderSecondary: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.phthaloblue600, darkModeColor: DbaUIColors.phthaloblue400) }
    public var borderSecondaryHover: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.phthaloblue700, darkModeColor: DbaUIColors.phthaloblue300) }
    public var borderSecondaryActive: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.phthaloblue800, darkModeColor: DbaUIColors.phthaloblue200) }
    public var borderPositive: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.green600, darkModeColor: DbaUIColors.green500) }
    public var borderPositiveHover: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.green700, darkModeColor: DbaUIColors.green400) }
    public var borderPositiveActive: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.green800, darkModeColor: DbaUIColors.green300) }
    public var borderPositiveSubtle: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.green300, darkModeColor: DbaUIColors.green700) }
    public var borderPositiveSubtleHover: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.green400, darkModeColor: DbaUIColors.green600) }
    public var borderPositiveSubtleActive: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.green500, darkModeColor: DbaUIColors.green500) }
    public var borderNegative: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.red600, darkModeColor: DbaUIColors.red400) }
    public var borderNegativeHover: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.red700, darkModeColor: DbaUIColors.red300) }
    public var borderNegativeActive: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.red800, darkModeColor: DbaUIColors.red200) }
    public var borderNegativeSubtle: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.red300, darkModeColor: DbaUIColors.red700) }
    public var borderNegativeSubtleHover: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.red400, darkModeColor: DbaUIColors.red600) }
    public var borderNegativeSubtleActive: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.red500, darkModeColor: DbaUIColors.red500) }
    public var borderWarning: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.yellow600, darkModeColor: DbaUIColors.yellow500) }
    public var borderWarningHover: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.yellow700, darkModeColor: DbaUIColors.yellow400) }
    public var borderWarningActive: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.yellow800, darkModeColor: DbaUIColors.yellow300) }
    public var borderWarningSubtle: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.yellow300, darkModeColor: DbaUIColors.yellow700) }
    public var borderWarningSubtleHover: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.yellow400, darkModeColor: DbaUIColors.yellow600) }
    public var borderWarningSubtleActive: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.yellow500, darkModeColor: DbaUIColors.yellow500) }
    public var borderInfo: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.jeanblue600, darkModeColor: DbaUIColors.jeanblue500) }
    public var borderInfoHover: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.jeanblue700, darkModeColor: DbaUIColors.jeanblue400) }
    public var borderInfoActive: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.jeanblue800, darkModeColor: DbaUIColors.jeanblue300) }
    public var borderInfoSubtle: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.jeanblue300, darkModeColor: DbaUIColors.jeanblue700) }
    public var borderInfoSubtleHover: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.jeanblue400, darkModeColor: DbaUIColors.jeanblue600) }
    public var borderInfoSubtleActive: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.jeanblue500, darkModeColor: DbaUIColors.jeanblue500) }
    public var borderFocus: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.jeanblue400, darkModeColor: DbaUIColors.jeanblue300) }
    public var icon: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.gray900, darkModeColor: DbaUIColors.white) }
    public var iconHover: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.jeanblue700, darkModeColor: DbaUIColors.jeanblue100) }
    public var iconActive: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.jeanblue800, darkModeColor: DbaUIColors.jeanblue200) }
    public var iconStatic: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.gray900, darkModeColor: DbaUIColors.gray900) }
    public var iconSelected: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.jeanblue600, darkModeColor: DbaUIColors.jeanblue400) }
    public var iconSelectedHover: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.jeanblue700, darkModeColor: DbaUIColors.jeanblue300) }
    public var iconSelectedActive: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.jeanblue800, darkModeColor: DbaUIColors.jeanblue200) }
    public var iconDisabled: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.gray300, darkModeColor: DbaUIColors.gray600) }
    public var iconSubtle: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.gray600, darkModeColor: DbaUIColors.gray400) }
    public var iconSubtleHover: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.gray700, darkModeColor: DbaUIColors.gray300) }
    public var iconSubtleActive: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.gray800, darkModeColor: DbaUIColors.gray200) }
    public var iconInverted: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.white, darkModeColor: DbaUIColors.gray900) }
    public var iconInvertedHover: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.gray100, darkModeColor: DbaUIColors.gray850) }
    public var iconInvertedActive: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.gray200, darkModeColor: DbaUIColors.gray800) }
    public var iconInvertedStatic: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.white, darkModeColor: DbaUIColors.white) }
    public var iconPrimary: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.jeanblue600, darkModeColor: DbaUIColors.jeanblue400) }
    public var iconSecondary: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.phthaloblue600, darkModeColor: DbaUIColors.phthaloblue400) }
    public var iconSecondaryHover: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.phthaloblue700, darkModeColor: DbaUIColors.phthaloblue300) }
    public var iconSecondaryActive: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.phthaloblue800, darkModeColor: DbaUIColors.phthaloblue200) }
    public var iconPositive: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.green600, darkModeColor: DbaUIColors.green500) }
    public var iconNegative: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.red600, darkModeColor: DbaUIColors.red400) }
    public var iconWarning: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.yellow600, darkModeColor: DbaUIColors.yellow500) }
    public var iconInfo: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.jeanblue600, darkModeColor: DbaUIColors.jeanblue500) }
    public var iconNotification: UIColor { UIColor.dynamicColor(defaultColor: DbaUIColors.white, darkModeColor: DbaUIColors.white) }
}
