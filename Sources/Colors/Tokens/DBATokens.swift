import SwiftUI

/// Source: https://docs.google.com/spreadsheets/d/1Q-Tr_dwJVfxgh3527IFjXQKqtnPPM42QeIr-M6q-zu8/edit#gid=888578831
@MainActor
struct DBATokenProvider: TokenProvider {
    /// Surface
    public var surfaceSunken: Color { Color.dynamicColor(defaultColor: DBAColors.gray50, darkModeColor: DBAColors.gray950) }
    public var surfaceElevated100: Color { Color.dynamicColor(defaultColor: DBAColors.white, darkModeColor: DBAColors.gray850) }
    public var surfaceElevated100Hover: Color { Color.dynamicColor(defaultColor: DBAColors.gray100, darkModeColor: DBAColors.gray800) }
    public var surfaceElevated100Active: Color { Color.dynamicColor(defaultColor: DBAColors.gray200, darkModeColor: DBAColors.gray750) }
    public var surfaceElevated200: Color { Color.dynamicColor(defaultColor: DBAColors.white, darkModeColor: DBAColors.gray800) }
    public var surfaceElevated200Hover: Color { Color.dynamicColor(defaultColor: DBAColors.gray100, darkModeColor: DBAColors.gray750) }
    public var surfaceElevated200Active: Color { Color.dynamicColor(defaultColor: DBAColors.gray200, darkModeColor: DBAColors.gray700) }
    public var surfaceElevated300: Color { Color.dynamicColor(defaultColor: DBAColors.white, darkModeColor: DBAColors.gray750) }
    public var surfaceElevated300Hover: Color { Color.dynamicColor(defaultColor: DBAColors.gray100, darkModeColor: DBAColors.gray700) }
    public var surfaceElevated300Active: Color { Color.dynamicColor(defaultColor: DBAColors.gray200, darkModeColor: DBAColors.gray600) }


    /// Background
    public var background: Color { Color.dynamicColor(defaultColor: DBAColors.white, darkModeColor: DBAColors.gray900) }
    public var backgroundHover: Color { Color.dynamicColor(defaultColor: DBAColors.gray100, darkModeColor: DBAColors.gray850) }
    public var backgroundActive: Color { Color.dynamicColor(defaultColor: DBAColors.gray200, darkModeColor: DBAColors.gray800) }
    public var backgroundDisabled: Color { Color.dynamicColor(defaultColor: DBAColors.gray300, darkModeColor: DBAColors.gray700) }
    public var backgroundDisabledSubtle: Color { Color.dynamicColor(defaultColor: DBAColors.gray200, darkModeColor: DBAColors.gray600) }
    public var backgroundSubtle: Color { Color.dynamicColor(defaultColor: DBAColors.gray100, darkModeColor: DBAColors.gray750) }
    public var backgroundSubtleHover: Color { Color.dynamicColor(defaultColor: DBAColors.gray200, darkModeColor: DBAColors.gray700) }
    public var backgroundSubtleActive: Color { Color.dynamicColor(defaultColor: DBAColors.gray300, darkModeColor: DBAColors.gray600) }
    public var backgroundSelected: Color { Color.dynamicColor(defaultColor: DBAColors.jeanblue50, darkModeColor: DBAColors.jeanblue900) }
    public var backgroundSelectedHover: Color { Color.dynamicColor(defaultColor: DBAColors.jeanblue100, darkModeColor: DBAColors.jeanblue800) }
    public var backgroundSelectedActive: Color { Color.dynamicColor(defaultColor: DBAColors.jeanblue200, darkModeColor: DBAColors.jeanblue700) }

    public var backgroundInverted: Color { Color.dynamicColor(defaultColor: DBAColors.gray900, darkModeColor: DBAColors.gray50) }

    public var backgroundPrimary: Color { Color.dynamicColor(defaultColor: DBAColors.jeanblue600, darkModeColor: DBAColors.jeanblue400) }
    public var backgroundPrimaryHover: Color { Color.dynamicColor(defaultColor: DBAColors.jeanblue700, darkModeColor: DBAColors.jeanblue300) }
    public var backgroundPrimaryActive: Color { Color.dynamicColor(defaultColor: DBAColors.jeanblue800, darkModeColor: DBAColors.jeanblue200) }
    public var backgroundPrimarySubtle: Color { Color.dynamicColor(defaultColor: DBAColors.jeanblue50, darkModeColor: DBAColors.jeanblue800) }
    public var backgroundPrimarySubtleHover: Color { Color.dynamicColor(defaultColor: DBAColors.jeanblue100, darkModeColor: DBAColors.jeanblue700) }
    public var backgroundPrimarySubtleActive: Color { Color.dynamicColor(defaultColor: DBAColors.jeanblue200, darkModeColor: DBAColors.jeanblue600) }

    public var backgroundSecondary: Color { Color.dynamicColor(defaultColor: DBAColors.phthaloblue600, darkModeColor: DBAColors.phthaloblue400) }
    public var backgroundSecondaryHover: Color { Color.dynamicColor(defaultColor: DBAColors.phthaloblue700, darkModeColor: DBAColors.phthaloblue300) }
    public var backgroundSecondaryActive: Color { Color.dynamicColor(defaultColor: DBAColors.phthaloblue800, darkModeColor: DBAColors.phthaloblue200) }

    public var backgroundPositive: Color { Color.dynamicColor(defaultColor: DBAColors.green600, darkModeColor: DBAColors.green500) }
    public var backgroundPositiveHover: Color { Color.dynamicColor(defaultColor: DBAColors.green700, darkModeColor: DBAColors.green400) }
    public var backgroundPositiveActive: Color { Color.dynamicColor(defaultColor: DBAColors.green800, darkModeColor: DBAColors.green300) }
    public var backgroundPositiveSubtle: Color { Color.dynamicColor(defaultColor: DBAColors.green50, darkModeColor: DBAColors.green900) }
    public var backgroundPositiveSubtleHover: Color { Color.dynamicColor(defaultColor: DBAColors.green100, darkModeColor: DBAColors.green800) }
    public var backgroundPositiveSubtleActive: Color { Color.dynamicColor(defaultColor: DBAColors.green200, darkModeColor: DBAColors.green700) }

    public var backgroundNegative: Color { Color.dynamicColor(defaultColor: DBAColors.red600, darkModeColor: DBAColors.red300) }
    public var backgroundNegativeHover: Color { Color.dynamicColor(defaultColor: DBAColors.red700, darkModeColor: DBAColors.red200) }
    public var backgroundNegativeActive: Color { Color.dynamicColor(defaultColor: DBAColors.red800, darkModeColor: DBAColors.red100) }
    public var backgroundNegativeSubtle: Color { Color.dynamicColor(defaultColor: DBAColors.red50, darkModeColor: DBAColors.red900) }
    public var backgroundNegativeSubtleHover: Color { Color.dynamicColor(defaultColor: DBAColors.red100, darkModeColor: DBAColors.red800) }
    public var backgroundNegativeSubtleActive: Color { Color.dynamicColor(defaultColor: DBAColors.red200, darkModeColor: DBAColors.red700) }

    public var backgroundWarning: Color { Color.dynamicColor(defaultColor: DBAColors.yellow600, darkModeColor: DBAColors.yellow500) }
    public var backgroundWarningHover: Color { Color.dynamicColor(defaultColor: DBAColors.yellow700, darkModeColor: DBAColors.yellow400) }
    public var backgroundWarningActive: Color { Color.dynamicColor(defaultColor: DBAColors.yellow800, darkModeColor: DBAColors.yellow300) }
    public var backgroundWarningSubtle: Color { Color.dynamicColor(defaultColor: DBAColors.yellow50, darkModeColor: DBAColors.yellow900) }
    public var backgroundWarningSubtleHover: Color { Color.dynamicColor(defaultColor: DBAColors.yellow100, darkModeColor: DBAColors.yellow800) }
    public var backgroundWarningSubtleActive: Color { Color.dynamicColor(defaultColor: DBAColors.yellow200, darkModeColor: DBAColors.yellow700) }

    public var backgroundInfo: Color { Color.dynamicColor(defaultColor: DBAColors.jeanblue600, darkModeColor: DBAColors.jeanblue500) }
    public var backgroundInfoHover: Color { Color.dynamicColor(defaultColor: DBAColors.jeanblue700, darkModeColor: DBAColors.jeanblue400) }
    public var backgroundInfoActive: Color { Color.dynamicColor(defaultColor: DBAColors.jeanblue800, darkModeColor: DBAColors.jeanblue300) }
    public var backgroundInfoSubtle: Color { Color.dynamicColor(defaultColor: DBAColors.jeanblue50, darkModeColor: DBAColors.jeanblue900) }
    public var backgroundInfoSubtleHover: Color { Color.dynamicColor(defaultColor: DBAColors.jeanblue100, darkModeColor: DBAColors.jeanblue800) }
    public var backgroundInfoSubtleActive: Color { Color.dynamicColor(defaultColor: DBAColors.jeanblue200, darkModeColor: DBAColors.jeanblue700) }

    public var backgroundNotification: Color { Color.dynamicColor(defaultColor: DBAColors.red600, darkModeColor: DBAColors.red500) }


    /// Border
    public var border: Color { Color.dynamicColor(defaultColor: DBAColors.gray300, darkModeColor: DBAColors.gray600) }
    public var borderHover: Color { Color.dynamicColor(defaultColor: DBAColors.gray400, darkModeColor: DBAColors.gray500) }
    public var borderActive: Color { Color.dynamicColor(defaultColor: DBAColors.gray500, darkModeColor: DBAColors.gray400) }
    public var borderDisabled: Color { Color.dynamicColor(defaultColor: DBAColors.gray300, darkModeColor: DBAColors.gray700) }
    public var borderSelected: Color { Color.dynamicColor(defaultColor: DBAColors.jeanblue600, darkModeColor: DBAColors.jeanblue400) }
    public var borderSelectedHover: Color { Color.dynamicColor(defaultColor: DBAColors.jeanblue700, darkModeColor: DBAColors.jeanblue300) }
    public var borderSelectedActive: Color { Color.dynamicColor(defaultColor: DBAColors.jeanblue800, darkModeColor: DBAColors.jeanblue200) }
    public var borderFocus: Color { Color.dynamicColor(defaultColor: DBAColors.jeanblue300, darkModeColor: DBAColors.jeanblue300) }

    public var borderPrimary: Color { Color.dynamicColor(defaultColor: DBAColors.jeanblue600, darkModeColor: DBAColors.jeanblue400) }
    public var borderPrimaryHover: Color { Color.dynamicColor(defaultColor: DBAColors.jeanblue700, darkModeColor: DBAColors.jeanblue300) }
    public var borderPrimaryActive: Color { Color.dynamicColor(defaultColor: DBAColors.jeanblue800, darkModeColor: DBAColors.jeanblue200) }
    public var borderPrimarySubtle: Color { Color.dynamicColor(defaultColor: DBAColors.jeanblue300, darkModeColor: DBAColors.jeanblue700) }
    public var borderPrimarySubtleHover: Color { Color.dynamicColor(defaultColor: DBAColors.jeanblue400, darkModeColor: DBAColors.jeanblue600) }
    public var borderPrimarySubtleActive: Color { Color.dynamicColor(defaultColor: DBAColors.jeanblue500, darkModeColor: DBAColors.jeanblue500) }

    public var borderSecondary: Color { Color.dynamicColor(defaultColor: DBAColors.phthaloblue600, darkModeColor: DBAColors.phthaloblue400) }
    public var borderSecondaryHover: Color { Color.dynamicColor(defaultColor: DBAColors.phthaloblue700, darkModeColor: DBAColors.phthaloblue300) }
    public var borderSecondaryActive: Color { Color.dynamicColor(defaultColor: DBAColors.phthaloblue800, darkModeColor: DBAColors.phthaloblue200) }

    public var borderPositive: Color { Color.dynamicColor(defaultColor: DBAColors.green600, darkModeColor: DBAColors.green500) }
    public var borderPositiveHover: Color { Color.dynamicColor(defaultColor: DBAColors.green700, darkModeColor: DBAColors.green400) }
    public var borderPositiveActive: Color { Color.dynamicColor(defaultColor: DBAColors.green800, darkModeColor: DBAColors.green300) }
    public var borderPositiveSubtle: Color { Color.dynamicColor(defaultColor: DBAColors.green300, darkModeColor: DBAColors.green700) }
    public var borderPositiveSubtleHover: Color { Color.dynamicColor(defaultColor: DBAColors.green400, darkModeColor: DBAColors.green600) }
    public var borderPositiveSubtleActive: Color { Color.dynamicColor(defaultColor: DBAColors.green500, darkModeColor: DBAColors.green500) }

    public var borderNegative: Color { Color.dynamicColor(defaultColor: DBAColors.red600, darkModeColor: DBAColors.red300) }
    public var borderNegativeHover: Color { Color.dynamicColor(defaultColor: DBAColors.red700, darkModeColor: DBAColors.red200) }
    public var borderNegativeActive: Color { Color.dynamicColor(defaultColor: DBAColors.red800, darkModeColor: DBAColors.red100) }
    public var borderNegativeSubtle: Color { Color.dynamicColor(defaultColor: DBAColors.red300, darkModeColor: DBAColors.red700) }
    public var borderNegativeSubtleHover: Color { Color.dynamicColor(defaultColor: DBAColors.red400, darkModeColor: DBAColors.red600) }
    public var borderNegativeSubtleActive: Color { Color.dynamicColor(defaultColor: DBAColors.red500, darkModeColor: DBAColors.red500) }

    public var borderWarning: Color { Color.dynamicColor(defaultColor: DBAColors.yellow600, darkModeColor: DBAColors.yellow500) }
    public var borderWarningHover: Color { Color.dynamicColor(defaultColor: DBAColors.yellow700, darkModeColor: DBAColors.yellow400) }
    public var borderWarningActive: Color { Color.dynamicColor(defaultColor: DBAColors.yellow800, darkModeColor: DBAColors.yellow300) }
    public var borderWarningSubtle: Color { Color.dynamicColor(defaultColor: DBAColors.yellow300, darkModeColor: DBAColors.yellow700) }
    public var borderWarningSubtleHover: Color { Color.dynamicColor(defaultColor: DBAColors.yellow400, darkModeColor: DBAColors.yellow600) }
    public var borderWarningSubtleActive: Color { Color.dynamicColor(defaultColor: DBAColors.yellow500, darkModeColor: DBAColors.yellow500) }

    public var borderInfo: Color { Color.dynamicColor(defaultColor: DBAColors.jeanblue600, darkModeColor: DBAColors.jeanblue500) }
    public var borderInfoHover: Color { Color.dynamicColor(defaultColor: DBAColors.jeanblue700, darkModeColor: DBAColors.jeanblue400) }
    public var borderInfoActive: Color { Color.dynamicColor(defaultColor: DBAColors.jeanblue800, darkModeColor: DBAColors.jeanblue300) }
    public var borderInfoSubtle: Color { Color.dynamicColor(defaultColor: DBAColors.jeanblue300, darkModeColor: DBAColors.jeanblue700) }
    public var borderInfoSubtleHover: Color { Color.dynamicColor(defaultColor: DBAColors.jeanblue400, darkModeColor: DBAColors.jeanblue600) }
    public var borderInfoSubtleActive: Color { Color.dynamicColor(defaultColor: DBAColors.jeanblue500, darkModeColor: DBAColors.jeanblue500) }

    /// Icon
    public var icon: Color { Color.dynamicColor(defaultColor: DBAColors.gray900, darkModeColor: DBAColors.white) }
    public var iconStatic: Color { Color.dynamicColor(defaultColor: DBAColors.gray800, darkModeColor: DBAColors.gray800) }
    public var iconHover: Color { Color.dynamicColor(defaultColor: DBAColors.jeanblue700, darkModeColor: DBAColors.jeanblue100) }
    public var iconActive: Color { Color.dynamicColor(defaultColor: DBAColors.jeanblue800, darkModeColor: DBAColors.jeanblue200) }
    public var iconSelected: Color { Color.dynamicColor(defaultColor: DBAColors.jeanblue600, darkModeColor: DBAColors.jeanblue400) }
    public var iconSelectedHover: Color { Color.dynamicColor(defaultColor: DBAColors.jeanblue700, darkModeColor: DBAColors.jeanblue300) }
    public var iconSelectedActive: Color { Color.dynamicColor(defaultColor: DBAColors.jeanblue800, darkModeColor: DBAColors.jeanblue200) }
    public var iconDisabled: Color { Color.dynamicColor(defaultColor: DBAColors.gray300, darkModeColor: DBAColors.gray600) }
    public var iconSubtle: Color { Color.dynamicColor(defaultColor: DBAColors.gray400, darkModeColor: DBAColors.gray600) }
    public var iconSubtleHover: Color { Color.dynamicColor(defaultColor: DBAColors.gray500, darkModeColor: DBAColors.gray500) }
    public var iconSubtleActive: Color { Color.dynamicColor(defaultColor: DBAColors.gray600, darkModeColor: DBAColors.gray400) }
    public var iconInverted: Color { Color.dynamicColor(defaultColor: DBAColors.white, darkModeColor: DBAColors.gray900) }
    public var iconInvertedHover: Color { Color.dynamicColor(defaultColor: DBAColors.gray100, darkModeColor: DBAColors.gray850) }
    public var iconInvertedActive: Color { Color.dynamicColor(defaultColor: DBAColors.gray200, darkModeColor: DBAColors.gray800) }
    public var iconInvertedStatic: Color { Color.dynamicColor(defaultColor: DBAColors.white, darkModeColor: DBAColors.white) }
    public var iconPrimary: Color { Color.dynamicColor(defaultColor: DBAColors.jeanblue600, darkModeColor: DBAColors.jeanblue400) }
    public var iconSecondary: Color { Color.dynamicColor(defaultColor: DBAColors.phthaloblue600, darkModeColor: DBAColors.phthaloblue400) }
    public var iconSecondaryHover: Color { Color.dynamicColor(defaultColor: DBAColors.phthaloblue700, darkModeColor: DBAColors.phthaloblue300) }
    public var iconSecondaryActive: Color { Color.dynamicColor(defaultColor: DBAColors.phthaloblue800, darkModeColor: DBAColors.phthaloblue200) }
    public var iconPositive: Color { Color.dynamicColor(defaultColor: DBAColors.green600, darkModeColor: DBAColors.green500) }
    public var iconNegative: Color { Color.dynamicColor(defaultColor: DBAColors.red600, darkModeColor: DBAColors.red400) }
    public var iconWarning: Color { Color.dynamicColor(defaultColor: DBAColors.yellow600, darkModeColor: DBAColors.yellow500) }
    public var iconInfo: Color { Color.dynamicColor(defaultColor: DBAColors.jeanblue600, darkModeColor: DBAColors.jeanblue500) }

    public var iconNotification: Color { Color.dynamicColor(defaultColor: DBAColors.white, darkModeColor: DBAColors.white) }

    /// Text
    public var text: Color { Color.dynamicColor(defaultColor: DBAColors.gray900, darkModeColor: DBAColors.white) }
    public var textStatic: Color { Color.dynamicColor(defaultColor: DBAColors.gray800, darkModeColor: DBAColors.gray800) }
    public var textSubtle: Color { Color.dynamicColor(defaultColor: DBAColors.gray600, darkModeColor: DBAColors.gray400) }
    public var textPlaceholder: Color { Color.dynamicColor(defaultColor: DBAColors.gray300, darkModeColor: DBAColors.gray500) }
    public var textInverted: Color { Color.dynamicColor(defaultColor: DBAColors.white, darkModeColor: DBAColors.gray900) }
    public var textInvertedStatic: Color { Color.dynamicColor(defaultColor: DBAColors.white, darkModeColor: DBAColors.white) }
    public var textInvertedSubtle: Color { Color.dynamicColor(defaultColor: DBAColors.gray50, darkModeColor: DBAColors.gray800) }
    public var textLink: Color { Color.dynamicColor(defaultColor: DBAColors.jeanblue600, darkModeColor: DBAColors.jeanblue400) }
    public var textDisabled: Color { Color.dynamicColor(defaultColor: DBAColors.gray300, darkModeColor: DBAColors.gray500) }
    public var textNegative: Color { Color.dynamicColor(defaultColor: DBAColors.red600, darkModeColor: DBAColors.red400) }
    public var textPositive: Color { Color.dynamicColor(defaultColor: DBAColors.green600, darkModeColor: DBAColors.green500) }
    public var textNotification: Color { Color.dynamicColor(defaultColor: DBAColors.white, darkModeColor: DBAColors.white) }
}

@MainActor
struct DBAUITokenProvider: UITokenProvider {
    /// Surface
    public var surfaceSunken: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.gray50, darkModeColor: DBAUIColors.gray950) }
    public var surfaceElevated100: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.white, darkModeColor: DBAUIColors.gray850) }
    public var surfaceElevated100Hover: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.gray100, darkModeColor: DBAUIColors.gray800) }
    public var surfaceElevated100Active: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.gray200, darkModeColor: DBAUIColors.gray750) }
    public var surfaceElevated200: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.white, darkModeColor: DBAUIColors.gray800) }
    public var surfaceElevated200Hover: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.gray100, darkModeColor: DBAUIColors.gray750) }
    public var surfaceElevated200Active: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.gray200, darkModeColor: DBAUIColors.gray700) }
    public var surfaceElevated300: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.white, darkModeColor: DBAUIColors.gray750) }
    public var surfaceElevated300Hover: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.gray100, darkModeColor: DBAUIColors.gray700) }
    public var surfaceElevated300Active: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.gray200, darkModeColor: DBAUIColors.gray600) }


    /// Background
    public var background: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.white, darkModeColor: DBAUIColors.gray900) }
    public var backgroundHover: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.gray100, darkModeColor: DBAUIColors.gray850) }
    public var backgroundActive: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.gray200, darkModeColor: DBAUIColors.gray800) }
    public var backgroundDisabled: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.gray300, darkModeColor: DBAUIColors.gray700) }
    public var backgroundDisabledSubtle: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.gray200, darkModeColor: DBAUIColors.gray600) }
    public var backgroundSubtle: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.gray100, darkModeColor: DBAUIColors.gray750) }
    public var backgroundSubtleHover: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.gray200, darkModeColor: DBAUIColors.gray700) }
    public var backgroundSubtleActive: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.gray300, darkModeColor: DBAUIColors.gray600) }
    public var backgroundSelected: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.jeanblue50, darkModeColor: DBAUIColors.jeanblue900) }
    public var backgroundSelectedHover: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.jeanblue100, darkModeColor: DBAUIColors.jeanblue800) }
    public var backgroundSelectedActive: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.jeanblue200, darkModeColor: DBAUIColors.jeanblue700) }

    public var backgroundInverted: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.gray900, darkModeColor: DBAUIColors.gray50) }

    public var backgroundPrimary: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.jeanblue600, darkModeColor: DBAUIColors.jeanblue400) }
    public var backgroundPrimaryHover: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.jeanblue700, darkModeColor: DBAUIColors.jeanblue300) }
    public var backgroundPrimaryActive: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.jeanblue800, darkModeColor: DBAUIColors.jeanblue200) }
    public var backgroundPrimarySubtle: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.jeanblue50, darkModeColor: DBAUIColors.jeanblue800) }
    public var backgroundPrimarySubtleHover: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.jeanblue100, darkModeColor: DBAUIColors.jeanblue700) }
    public var backgroundPrimarySubtleActive: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.jeanblue200, darkModeColor: DBAUIColors.jeanblue600) }

    public var backgroundSecondary: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.phthaloblue600, darkModeColor: DBAUIColors.phthaloblue400) }
    public var backgroundSecondaryHover: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.phthaloblue700, darkModeColor: DBAUIColors.phthaloblue300) }
    public var backgroundSecondaryActive: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.phthaloblue800, darkModeColor: DBAUIColors.phthaloblue200) }

    public var backgroundPositive: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.green600, darkModeColor: DBAUIColors.green500) }
    public var backgroundPositiveHover: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.green700, darkModeColor: DBAUIColors.green400) }
    public var backgroundPositiveActive: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.green800, darkModeColor: DBAUIColors.green300) }
    public var backgroundPositiveSubtle: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.green50, darkModeColor: DBAUIColors.green900) }
    public var backgroundPositiveSubtleHover: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.green100, darkModeColor: DBAUIColors.green800) }
    public var backgroundPositiveSubtleActive: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.green200, darkModeColor: DBAUIColors.green700) }

    public var backgroundNegative: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.red600, darkModeColor: DBAUIColors.red300) }
    public var backgroundNegativeHover: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.red700, darkModeColor: DBAUIColors.red200) }
    public var backgroundNegativeActive: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.red800, darkModeColor: DBAUIColors.red100) }
    public var backgroundNegativeSubtle: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.red50, darkModeColor: DBAUIColors.red900) }
    public var backgroundNegativeSubtleHover: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.red100, darkModeColor: DBAUIColors.red800) }
    public var backgroundNegativeSubtleActive: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.red200, darkModeColor: DBAUIColors.red700) }

    public var backgroundWarning: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.yellow600, darkModeColor: DBAUIColors.yellow500) }
    public var backgroundWarningHover: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.yellow700, darkModeColor: DBAUIColors.yellow400) }
    public var backgroundWarningActive: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.yellow800, darkModeColor: DBAUIColors.yellow300) }
    public var backgroundWarningSubtle: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.yellow50, darkModeColor: DBAUIColors.yellow900) }
    public var backgroundWarningSubtleHover: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.yellow100, darkModeColor: DBAUIColors.yellow800) }
    public var backgroundWarningSubtleActive: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.yellow200, darkModeColor: DBAUIColors.yellow700) }

    public var backgroundInfo: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.jeanblue600, darkModeColor: DBAUIColors.jeanblue500) }
    public var backgroundInfoHover: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.jeanblue700, darkModeColor: DBAUIColors.jeanblue400) }
    public var backgroundInfoActive: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.jeanblue800, darkModeColor: DBAUIColors.jeanblue300) }
    public var backgroundInfoSubtle: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.jeanblue50, darkModeColor: DBAUIColors.jeanblue900) }
    public var backgroundInfoSubtleHover: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.jeanblue100, darkModeColor: DBAUIColors.jeanblue800) }
    public var backgroundInfoSubtleActive: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.jeanblue200, darkModeColor: DBAUIColors.jeanblue700) }

    public var backgroundNotification: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.red600, darkModeColor: DBAUIColors.red500) }


    /// Border
    public var border: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.gray300, darkModeColor: DBAUIColors.gray600) }
    public var borderHover: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.gray400, darkModeColor: DBAUIColors.gray500) }
    public var borderActive: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.gray500, darkModeColor: DBAUIColors.gray400) }
    public var borderDisabled: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.gray300, darkModeColor: DBAUIColors.gray700) }
    public var borderSelected: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.jeanblue600, darkModeColor: DBAUIColors.jeanblue400) }
    public var borderSelectedHover: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.jeanblue700, darkModeColor: DBAUIColors.jeanblue300) }
    public var borderSelectedActive: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.jeanblue800, darkModeColor: DBAUIColors.jeanblue200) }
    public var borderFocus: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.jeanblue300, darkModeColor: DBAUIColors.jeanblue300) }

    public var borderPrimary: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.jeanblue600, darkModeColor: DBAUIColors.jeanblue400) }
    public var borderPrimaryHover: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.jeanblue700, darkModeColor: DBAUIColors.jeanblue300) }
    public var borderPrimaryActive: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.jeanblue800, darkModeColor: DBAUIColors.jeanblue200) }
    public var borderPrimarySubtle: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.jeanblue300, darkModeColor: DBAUIColors.jeanblue700) }
    public var borderPrimarySubtleHover: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.jeanblue400, darkModeColor: DBAUIColors.jeanblue600) }
    public var borderPrimarySubtleActive: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.jeanblue500, darkModeColor: DBAUIColors.jeanblue500) }

    public var borderSecondary: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.phthaloblue600, darkModeColor: DBAUIColors.phthaloblue400) }
    public var borderSecondaryHover: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.phthaloblue700, darkModeColor: DBAUIColors.phthaloblue300) }
    public var borderSecondaryActive: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.phthaloblue800, darkModeColor: DBAUIColors.phthaloblue200) }

    public var borderPositive: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.green600, darkModeColor: DBAUIColors.green500) }
    public var borderPositiveHover: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.green700, darkModeColor: DBAUIColors.green400) }
    public var borderPositiveActive: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.green800, darkModeColor: DBAUIColors.green300) }
    public var borderPositiveSubtle: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.green300, darkModeColor: DBAUIColors.green700) }
    public var borderPositiveSubtleHover: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.green400, darkModeColor: DBAUIColors.green600) }
    public var borderPositiveSubtleActive: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.green500, darkModeColor: DBAUIColors.green500) }

    public var borderNegative: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.red600, darkModeColor: DBAUIColors.red300) }
    public var borderNegativeHover: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.red700, darkModeColor: DBAUIColors.red200) }
    public var borderNegativeActive: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.red800, darkModeColor: DBAUIColors.red100) }
    public var borderNegativeSubtle: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.red300, darkModeColor: DBAUIColors.red700) }
    public var borderNegativeSubtleHover: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.red400, darkModeColor: DBAUIColors.red600) }
    public var borderNegativeSubtleActive: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.red500, darkModeColor: DBAUIColors.red500) }

    public var borderWarning: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.yellow600, darkModeColor: DBAUIColors.yellow500) }
    public var borderWarningHover: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.yellow700, darkModeColor: DBAUIColors.yellow400) }
    public var borderWarningActive: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.yellow800, darkModeColor: DBAUIColors.yellow300) }
    public var borderWarningSubtle: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.yellow300, darkModeColor: DBAUIColors.yellow700) }
    public var borderWarningSubtleHover: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.yellow400, darkModeColor: DBAUIColors.yellow600) }
    public var borderWarningSubtleActive: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.yellow500, darkModeColor: DBAUIColors.yellow500) }

    public var borderInfo: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.jeanblue600, darkModeColor: DBAUIColors.jeanblue500) }
    public var borderInfoHover: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.jeanblue700, darkModeColor: DBAUIColors.jeanblue400) }
    public var borderInfoActive: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.jeanblue800, darkModeColor: DBAUIColors.jeanblue300) }
    public var borderInfoSubtle: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.jeanblue300, darkModeColor: DBAUIColors.jeanblue700) }
    public var borderInfoSubtleHover: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.jeanblue400, darkModeColor: DBAUIColors.jeanblue600) }
    public var borderInfoSubtleActive: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.jeanblue500, darkModeColor: DBAUIColors.jeanblue500) }

    /// Icon
    public var icon: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.gray900, darkModeColor: DBAUIColors.white) }
    public var iconStatic: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.gray800, darkModeColor: DBAUIColors.gray800) }
    public var iconHover: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.jeanblue700, darkModeColor: DBAUIColors.jeanblue100) }
    public var iconActive: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.jeanblue800, darkModeColor: DBAUIColors.jeanblue200) }
    public var iconSelected: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.jeanblue600, darkModeColor: DBAUIColors.jeanblue400) }
    public var iconSelectedHover: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.jeanblue700, darkModeColor: DBAUIColors.jeanblue300) }
    public var iconSelectedActive: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.jeanblue800, darkModeColor: DBAUIColors.jeanblue200) }
    public var iconDisabled: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.gray300, darkModeColor: DBAUIColors.gray600) }
    public var iconSubtle: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.gray400, darkModeColor: DBAUIColors.gray600) }
    public var iconSubtleHover: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.gray500, darkModeColor: DBAUIColors.gray500) }
    public var iconSubtleActive: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.gray600, darkModeColor: DBAUIColors.gray400) }
    public var iconInverted: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.white, darkModeColor: DBAUIColors.gray900) }
    public var iconInvertedHover: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.gray100, darkModeColor: DBAUIColors.gray850) }
    public var iconInvertedActive: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.gray200, darkModeColor: DBAUIColors.gray800) }
    public var iconInvertedStatic: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.white, darkModeColor: DBAUIColors.white) }
    public var iconPrimary: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.jeanblue600, darkModeColor: DBAUIColors.jeanblue400) }
    public var iconSecondary: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.phthaloblue600, darkModeColor: DBAUIColors.phthaloblue400) }
    public var iconSecondaryHover: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.phthaloblue700, darkModeColor: DBAUIColors.phthaloblue300) }
    public var iconSecondaryActive: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.phthaloblue800, darkModeColor: DBAUIColors.phthaloblue200) }
    public var iconPositive: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.green600, darkModeColor: DBAUIColors.green500) }
    public var iconNegative: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.red600, darkModeColor: DBAUIColors.red400) }
    public var iconWarning: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.yellow600, darkModeColor: DBAUIColors.yellow500) }
    public var iconInfo: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.jeanblue600, darkModeColor: DBAUIColors.jeanblue500) }

    public var iconNotification: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.white, darkModeColor: DBAUIColors.white) }

    /// Text
    public var text: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.gray900, darkModeColor: DBAUIColors.white) }
    public var textStatic: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.gray800, darkModeColor: DBAUIColors.gray800) }
    public var textSubtle: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.gray600, darkModeColor: DBAUIColors.gray400) }
    public var textPlaceholder: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.gray300, darkModeColor: DBAUIColors.gray500) }
    public var textInverted: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.white, darkModeColor: DBAUIColors.gray900) }
    public var textInvertedStatic: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.white, darkModeColor: DBAUIColors.white) }
    public var textInvertedSubtle: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.gray50, darkModeColor: DBAUIColors.gray800) }
    public var textLink: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.jeanblue600, darkModeColor: DBAUIColors.jeanblue400) }
    public var textDisabled: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.gray300, darkModeColor: DBAUIColors.gray500) }
    public var textNegative: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.red600, darkModeColor: DBAUIColors.red400) }
    public var textPositive: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.green600, darkModeColor: DBAUIColors.green500) }
    public var textNotification: UIColor { UIColor.dynamicColor(defaultColor: DBAUIColors.white, darkModeColor: DBAUIColors.white) }
}
