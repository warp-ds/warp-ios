import SwiftUI

// Generated on Thu, 12 Dec 2024 12:23:06 GMT by https://github.com/warp-ds/tokens
public struct ColorProvider {
    public let token: TokenProvider
    
    public var badgeNeutralBackground: Color {
        switch Warp.Theme {
        case .blocket: return Color.dynamicColor(defaultColor: BlocketColors.gray100, darkModeColor: BlocketColors.gray600)
        case .dba: return Color.dynamicColor(defaultColor: DbaColors.gray100, darkModeColor: DbaColors.gray600)
        case .finn: return Color.dynamicColor(defaultColor: FinnColors.gray100, darkModeColor: FinnColors.gray600)
        case .tori: return Color.dynamicColor(defaultColor: ToriColors.gray100, darkModeColor: ToriColors.gray600)
        }
    }
    
    public var badgePositiveBackground: Color {
        switch Warp.Theme {
        case .blocket: return Color.dynamicColor(defaultColor: BlocketColors.green100, darkModeColor: BlocketColors.green700)
        case .dba: return Color.dynamicColor(defaultColor: DbaColors.green100, darkModeColor: DbaColors.green700)
        case .finn: return Color.dynamicColor(defaultColor: FinnColors.green100, darkModeColor: FinnColors.green700)
        case .tori: return Color.dynamicColor(defaultColor: ToriColors.green100, darkModeColor: ToriColors.green700)
        }
    }
    
    public var badgeInfoBackground: Color {
        switch Warp.Theme {
        case .blocket: return Color.dynamicColor(defaultColor: BlocketColors.blue100, darkModeColor: BlocketColors.blue700)
        case .dba: return Color.dynamicColor(defaultColor: DbaColors.jeanblue100, darkModeColor: DbaColors.jeanblue700)
        case .finn: return Color.dynamicColor(defaultColor: FinnColors.aqua100, darkModeColor: FinnColors.aqua700)
        case .tori: return Color.dynamicColor(defaultColor: ToriColors.blue100, darkModeColor: ToriColors.blue700)
        }
    }
    
    public var badgeWarningBackground: Color {
        switch Warp.Theme {
        case .blocket: return Color.dynamicColor(defaultColor: BlocketColors.yellow100, darkModeColor: BlocketColors.yellow700)
        case .dba: return Color.dynamicColor(defaultColor: DbaColors.yellow100, darkModeColor: DbaColors.yellow700)
        case .finn: return Color.dynamicColor(defaultColor: FinnColors.yellow100, darkModeColor: FinnColors.yellow700)
        case .tori: return Color.dynamicColor(defaultColor: ToriColors.yellow100, darkModeColor: ToriColors.yellow700)
        }
    }
    
    public var badgeNegativeBackground: Color {
        switch Warp.Theme {
        case .blocket: return Color.dynamicColor(defaultColor: BlocketColors.coral100, darkModeColor: BlocketColors.coral700)
        case .dba: return Color.dynamicColor(defaultColor: DbaColors.red100, darkModeColor: DbaColors.red700)
        case .finn: return Color.dynamicColor(defaultColor: FinnColors.red100, darkModeColor: FinnColors.red700)
        case .tori: return Color.dynamicColor(defaultColor: ToriColors.red100, darkModeColor: ToriColors.red700)
        }
    }
    
    public var badgeSponsoredBackground: Color {
        switch Warp.Theme {
        case .blocket: return Color.dynamicColor(defaultColor: BlocketColors.blue200, darkModeColor: BlocketColors.blue600)
        case .dba: return Color.dynamicColor(defaultColor: DbaColors.jeanblue200, darkModeColor: DbaColors.jeanblue600)
        case .finn: return Color.dynamicColor(defaultColor: FinnColors.aqua200, darkModeColor: FinnColors.aqua600)
        case .tori: return Color.dynamicColor(defaultColor: ToriColors.blue200, darkModeColor: ToriColors.blue600)
        }
    }
    
    public var badgePriceBackground: Color {
        switch Warp.Theme {
        case .blocket: return BlocketColors.black
        case .dba: return DbaColors.black
        case .finn: return FinnColors.black
        case .tori: return ToriColors.black
        }
    }
    
    public var buttonPrimaryBackground: Color {
        switch Warp.Theme {
        case .blocket: return token.backgroundPrimary
        case .dba: return token.backgroundPrimary
        case .finn: return token.backgroundPrimary
        case .tori: return Color.dynamicColor(defaultColor: ToriColors.watermelon600, darkModeColor: ToriColors.watermelon500)
        }
    }
    
    public var buttonPrimaryBackgroundHover: Color {
        switch Warp.Theme {
        case .blocket: return token.backgroundPrimaryHover
        case .dba: return token.backgroundPrimaryHover
        case .finn: return token.backgroundPrimaryHover
        case .tori: return Color.dynamicColor(defaultColor: ToriColors.watermelon700, darkModeColor: ToriColors.watermelon400)
        }
    }
    
    public var buttonPrimaryBackgroundActive: Color {
        switch Warp.Theme {
        case .blocket: return token.backgroundPrimaryActive
        case .dba: return token.backgroundPrimaryActive
        case .finn: return token.backgroundPrimaryActive
        case .tori: return Color.dynamicColor(defaultColor: ToriColors.watermelon800, darkModeColor: ToriColors.watermelon300)
        }
    }
    
    public var buttonPillBackgroundHover: Color {
        switch Warp.Theme {
        case .blocket: return BlocketColors.blue300
        case .dba: return DbaColors.jeanblue300
        case .finn: return FinnColors.blue300
        case .tori: return ToriColors.blueberry300
        }
    }
    
    public var buttonPillBackgroundActive: Color {
        switch Warp.Theme {
        case .blocket: return BlocketColors.blue400
        case .dba: return DbaColors.jeanblue400
        case .finn: return FinnColors.blue400
        case .tori: return ToriColors.blueberry400
        }
    }
    
    public var calloutBackground: Color {
        switch Warp.Theme {
        case .blocket: return Color.dynamicColor(defaultColor: BlocketColors.green100, darkModeColor: BlocketColors.green800)
        case .dba: return Color.dynamicColor(defaultColor: DbaColors.green100, darkModeColor: DbaColors.green800)
        case .finn: return Color.dynamicColor(defaultColor: FinnColors.green100, darkModeColor: FinnColors.green800)
        case .tori: return Color.dynamicColor(defaultColor: ToriColors.blue100, darkModeColor: ToriColors.blue800)
        }
    }
    
    public var calloutBorder: Color {
        switch Warp.Theme {
        case .blocket: return Color.dynamicColor(defaultColor: BlocketColors.green400, darkModeColor: BlocketColors.green600)
        case .dba: return Color.dynamicColor(defaultColor: DbaColors.green400, darkModeColor: DbaColors.green600)
        case .finn: return Color.dynamicColor(defaultColor: FinnColors.green400, darkModeColor: FinnColors.green600)
        case .tori: return Color.dynamicColor(defaultColor: ToriColors.blue400, darkModeColor: ToriColors.blue600)
        }
    }
    
    public var cardBackground: Color {
        switch Warp.Theme {
        case .blocket: return token.background
        case .dba: return token.background
        case .finn: return token.background
        case .tori: return token.background
        }
    }
    
    public var navbarIconSelected: Color {
        switch Warp.Theme {
        case .blocket: return token.iconSecondary
        case .dba: return token.iconSecondary
        case .finn: return token.iconSelected
        case .tori: return token.iconSecondary
        }
    }
    
    public var navbarBorderSelected: Color {
        switch Warp.Theme {
        case .blocket: return token.borderSecondary
        case .dba: return token.borderSecondary
        case .finn: return token.borderSelected
        case .tori: return token.borderSecondary
        }
    }
    
    public var pageIndicatorBackground: Color {
        switch Warp.Theme {
        case .blocket: return BlocketColors.gray300
        case .dba: return DbaColors.gray300
        case .finn: return FinnColors.gray300
        case .tori: return ToriColors.gray300
        }
    }
    
    public var pageIndicatorBackgroundHover: Color {
        switch Warp.Theme {
        case .blocket: return Color.dynamicColor(defaultColor: BlocketColors.gray400, darkModeColor: BlocketColors.gray200)
        case .dba: return Color.dynamicColor(defaultColor: DbaColors.gray400, darkModeColor: DbaColors.gray200)
        case .finn: return Color.dynamicColor(defaultColor: FinnColors.gray400, darkModeColor: FinnColors.gray200)
        case .tori: return Color.dynamicColor(defaultColor: ToriColors.gray400, darkModeColor: ToriColors.gray200)
        }
    }
    
    public var pillSuggestionBackground: Color {
        switch Warp.Theme {
        case .blocket: return Color.dynamicColor(defaultColor: BlocketColors.gray200, darkModeColor: BlocketColors.gray600)
        case .dba: return Color.dynamicColor(defaultColor: DbaColors.gray200, darkModeColor: DbaColors.gray600)
        case .finn: return Color.dynamicColor(defaultColor: FinnColors.gray200, darkModeColor: FinnColors.gray600)
        case .tori: return Color.dynamicColor(defaultColor: ToriColors.gray200, darkModeColor: ToriColors.gray600)
        }
    }
    
    public var pillSuggestionBackgroundHover: Color {
        switch Warp.Theme {
        case .blocket: return Color.dynamicColor(defaultColor: BlocketColors.gray300, darkModeColor: BlocketColors.gray500)
        case .dba: return Color.dynamicColor(defaultColor: DbaColors.gray300, darkModeColor: DbaColors.gray500)
        case .finn: return Color.dynamicColor(defaultColor: FinnColors.gray300, darkModeColor: FinnColors.gray500)
        case .tori: return Color.dynamicColor(defaultColor: ToriColors.gray300, darkModeColor: ToriColors.gray500)
        }
    }
    
    public var pillSuggestionBackgroundActive: Color {
        switch Warp.Theme {
        case .blocket: return BlocketColors.gray400
        case .dba: return DbaColors.gray400
        case .finn: return FinnColors.gray400
        case .tori: return ToriColors.gray400
        }
    }
    
    public var tooltipBackgroundStatic: Color {
        switch Warp.Theme {
        case .blocket: return Color.dynamicColor(defaultColor: token.backgroundInverted, darkModeColor: token.surfaceElevated300)
        case .dba: return Color.dynamicColor(defaultColor: token.backgroundInverted, darkModeColor: token.surfaceElevated300)
        case .finn: return Color.dynamicColor(defaultColor: token.backgroundInverted, darkModeColor: token.surfaceElevated300)
        case .tori: return Color.dynamicColor(defaultColor: token.backgroundInverted, darkModeColor: token.surfaceElevated300)
        }
    }
    
    public var switchHandleBackground: Color {
        switch Warp.Theme {
        case .blocket: return BlocketColors.gray500
        case .dba: return DbaColors.gray500
        case .finn: return FinnColors.gray500
        case .tori: return ToriColors.gray500
        }
    }
    
    public var switchHandleBackgroundHover: Color {
        switch Warp.Theme {
        case .blocket: return Color.dynamicColor(defaultColor: BlocketColors.gray600, darkModeColor: BlocketColors.gray400)
        case .dba: return Color.dynamicColor(defaultColor: DbaColors.gray600, darkModeColor: DbaColors.gray400)
        case .finn: return Color.dynamicColor(defaultColor: FinnColors.gray600, darkModeColor: FinnColors.gray400)
        case .tori: return Color.dynamicColor(defaultColor: ToriColors.gray600, darkModeColor: ToriColors.gray400)
        }
    }
}

public struct UIColorProvider {
    public let token: UITokenProvider
    
    public var badgeNeutralBackground: UIColor {
        switch Warp.Theme {
        case .blocket: return UIColor.dynamicColor(defaultColor: BlocketUIColors.gray100, darkModeColor: BlocketUIColors.gray600)
        case .dba: return UIColor.dynamicColor(defaultColor: DbaUIColors.gray100, darkModeColor: DbaUIColors.gray600)
        case .finn: return UIColor.dynamicColor(defaultColor: FinnUIColors.gray100, darkModeColor: FinnUIColors.gray600)
        case .tori: return UIColor.dynamicColor(defaultColor: ToriUIColors.gray100, darkModeColor: ToriUIColors.gray600)
        }
    }
    
    public var badgePositiveBackground: UIColor {
        switch Warp.Theme {
        case .blocket: return UIColor.dynamicColor(defaultColor: BlocketUIColors.green100, darkModeColor: BlocketUIColors.green700)
        case .dba: return UIColor.dynamicColor(defaultColor: DbaUIColors.green100, darkModeColor: DbaUIColors.green700)
        case .finn: return UIColor.dynamicColor(defaultColor: FinnUIColors.green100, darkModeColor: FinnUIColors.green700)
        case .tori: return UIColor.dynamicColor(defaultColor: ToriUIColors.green100, darkModeColor: ToriUIColors.green700)
        }
    }
    
    public var badgeInfoBackground: UIColor {
        switch Warp.Theme {
        case .blocket: return UIColor.dynamicColor(defaultColor: BlocketUIColors.blue100, darkModeColor: BlocketUIColors.blue700)
        case .dba: return UIColor.dynamicColor(defaultColor: DbaUIColors.jeanblue100, darkModeColor: DbaUIColors.jeanblue700)
        case .finn: return UIColor.dynamicColor(defaultColor: FinnUIColors.aqua100, darkModeColor: FinnUIColors.aqua700)
        case .tori: return UIColor.dynamicColor(defaultColor: ToriUIColors.blue100, darkModeColor: ToriUIColors.blue700)
        }
    }
    
    public var badgeWarningBackground: UIColor {
        switch Warp.Theme {
        case .blocket: return UIColor.dynamicColor(defaultColor: BlocketUIColors.yellow100, darkModeColor: BlocketUIColors.yellow700)
        case .dba: return UIColor.dynamicColor(defaultColor: DbaUIColors.yellow100, darkModeColor: DbaUIColors.yellow700)
        case .finn: return UIColor.dynamicColor(defaultColor: FinnUIColors.yellow100, darkModeColor: FinnUIColors.yellow700)
        case .tori: return UIColor.dynamicColor(defaultColor: ToriUIColors.yellow100, darkModeColor: ToriUIColors.yellow700)
        }
    }
    
    public var badgeNegativeBackground: UIColor {
        switch Warp.Theme {
        case .blocket: return UIColor.dynamicColor(defaultColor: BlocketUIColors.coral100, darkModeColor: BlocketUIColors.coral700)
        case .dba: return UIColor.dynamicColor(defaultColor: DbaUIColors.red100, darkModeColor: DbaUIColors.red700)
        case .finn: return UIColor.dynamicColor(defaultColor: FinnUIColors.red100, darkModeColor: FinnUIColors.red700)
        case .tori: return UIColor.dynamicColor(defaultColor: ToriUIColors.red100, darkModeColor: ToriUIColors.red700)
        }
    }
    
    public var badgeSponsoredBackground: UIColor {
        switch Warp.Theme {
        case .blocket: return UIColor.dynamicColor(defaultColor: BlocketUIColors.blue200, darkModeColor: BlocketUIColors.blue600)
        case .dba: return UIColor.dynamicColor(defaultColor: DbaUIColors.jeanblue200, darkModeColor: DbaUIColors.jeanblue600)
        case .finn: return UIColor.dynamicColor(defaultColor: FinnUIColors.aqua200, darkModeColor: FinnUIColors.aqua600)
        case .tori: return UIColor.dynamicColor(defaultColor: ToriUIColors.blue200, darkModeColor: ToriUIColors.blue600)
        }
    }
    
    public var badgePriceBackground: UIColor {
        switch Warp.Theme {
        case .blocket: return BlocketUIColors.black
        case .dba: return DbaUIColors.black
        case .finn: return FinnUIColors.black
        case .tori: return ToriUIColors.black
        }
    }
    
    public var buttonPrimaryBackground: UIColor {
        switch Warp.Theme {
        case .blocket: return token.backgroundPrimary
        case .dba: return token.backgroundPrimary
        case .finn: return token.backgroundPrimary
        case .tori: return UIColor.dynamicColor(defaultColor: ToriUIColors.watermelon600, darkModeColor: ToriUIColors.watermelon500)
        }
    }
    
    public var buttonPrimaryBackgroundHover: UIColor {
        switch Warp.Theme {
        case .blocket: return token.backgroundPrimaryHover
        case .dba: return token.backgroundPrimaryHover
        case .finn: return token.backgroundPrimaryHover
        case .tori: return UIColor.dynamicColor(defaultColor: ToriUIColors.watermelon700, darkModeColor: ToriUIColors.watermelon400)
        }
    }
    
    public var buttonPrimaryBackgroundActive: UIColor {
        switch Warp.Theme {
        case .blocket: return token.backgroundPrimaryActive
        case .dba: return token.backgroundPrimaryActive
        case .finn: return token.backgroundPrimaryActive
        case .tori: return UIColor.dynamicColor(defaultColor: ToriUIColors.watermelon800, darkModeColor: ToriUIColors.watermelon300)
        }
    }
    
    public var buttonPillBackgroundHover: UIColor {
        switch Warp.Theme {
        case .blocket: return BlocketUIColors.blue300
        case .dba: return DbaUIColors.jeanblue300
        case .finn: return FinnUIColors.blue300
        case .tori: return ToriUIColors.blueberry300
        }
    }
    
    public var buttonPillBackgroundActive: UIColor {
        switch Warp.Theme {
        case .blocket: return BlocketUIColors.blue400
        case .dba: return DbaUIColors.jeanblue400
        case .finn: return FinnUIColors.blue400
        case .tori: return ToriUIColors.blueberry400
        }
    }
    
    public var calloutBackground: UIColor {
        switch Warp.Theme {
        case .blocket: return UIColor.dynamicColor(defaultColor: BlocketUIColors.green100, darkModeColor: BlocketUIColors.green800)
        case .dba: return UIColor.dynamicColor(defaultColor: DbaUIColors.green100, darkModeColor: DbaUIColors.green800)
        case .finn: return UIColor.dynamicColor(defaultColor: FinnUIColors.green100, darkModeColor: FinnUIColors.green800)
        case .tori: return UIColor.dynamicColor(defaultColor: ToriUIColors.blue100, darkModeColor: ToriUIColors.blue800)
        }
    }
    
    public var calloutBorder: UIColor {
        switch Warp.Theme {
        case .blocket: return UIColor.dynamicColor(defaultColor: BlocketUIColors.green400, darkModeColor: BlocketUIColors.green600)
        case .dba: return UIColor.dynamicColor(defaultColor: DbaUIColors.green400, darkModeColor: DbaUIColors.green600)
        case .finn: return UIColor.dynamicColor(defaultColor: FinnUIColors.green400, darkModeColor: FinnUIColors.green600)
        case .tori: return UIColor.dynamicColor(defaultColor: ToriUIColors.blue400, darkModeColor: ToriUIColors.blue600)
        }
    }
    
    public var cardBackground: UIColor {
        switch Warp.Theme {
        case .blocket: return token.background
        case .dba: return token.background
        case .finn: return token.background
        case .tori: return token.background
        }
    }
    
    public var navbarIconSelected: UIColor {
        switch Warp.Theme {
        case .blocket: return token.iconSecondary
        case .dba: return token.iconSecondary
        case .finn: return token.iconSelected
        case .tori: return token.iconSecondary
        }
    }
    
    public var navbarBorderSelected: UIColor {
        switch Warp.Theme {
        case .blocket: return token.borderSecondary
        case .dba: return token.borderSecondary
        case .finn: return token.borderSelected
        case .tori: return token.borderSecondary
        }
    }
    
    public var pageIndicatorBackground: UIColor {
        switch Warp.Theme {
        case .blocket: return BlocketUIColors.gray300
        case .dba: return DbaUIColors.gray300
        case .finn: return FinnUIColors.gray300
        case .tori: return ToriUIColors.gray300
        }
    }
    
    public var pageIndicatorBackgroundHover: UIColor {
        switch Warp.Theme {
        case .blocket: return UIColor.dynamicColor(defaultColor: BlocketUIColors.gray400, darkModeColor: BlocketUIColors.gray200)
        case .dba: return UIColor.dynamicColor(defaultColor: DbaUIColors.gray400, darkModeColor: DbaUIColors.gray200)
        case .finn: return UIColor.dynamicColor(defaultColor: FinnUIColors.gray400, darkModeColor: FinnUIColors.gray200)
        case .tori: return UIColor.dynamicColor(defaultColor: ToriUIColors.gray400, darkModeColor: ToriUIColors.gray200)
        }
    }
    
    public var pillSuggestionBackground: UIColor {
        switch Warp.Theme {
        case .blocket: return UIColor.dynamicColor(defaultColor: BlocketUIColors.gray200, darkModeColor: BlocketUIColors.gray600)
        case .dba: return UIColor.dynamicColor(defaultColor: DbaUIColors.gray200, darkModeColor: DbaUIColors.gray600)
        case .finn: return UIColor.dynamicColor(defaultColor: FinnUIColors.gray200, darkModeColor: FinnUIColors.gray600)
        case .tori: return UIColor.dynamicColor(defaultColor: ToriUIColors.gray200, darkModeColor: ToriUIColors.gray600)
        }
    }
    
    public var pillSuggestionBackgroundHover: UIColor {
        switch Warp.Theme {
        case .blocket: return UIColor.dynamicColor(defaultColor: BlocketUIColors.gray300, darkModeColor: BlocketUIColors.gray500)
        case .dba: return UIColor.dynamicColor(defaultColor: DbaUIColors.gray300, darkModeColor: DbaUIColors.gray500)
        case .finn: return UIColor.dynamicColor(defaultColor: FinnUIColors.gray300, darkModeColor: FinnUIColors.gray500)
        case .tori: return UIColor.dynamicColor(defaultColor: ToriUIColors.gray300, darkModeColor: ToriUIColors.gray500)
        }
    }
    
    public var pillSuggestionBackgroundActive: UIColor {
        switch Warp.Theme {
        case .blocket: return BlocketUIColors.gray400
        case .dba: return DbaUIColors.gray400
        case .finn: return FinnUIColors.gray400
        case .tori: return ToriUIColors.gray400
        }
    }
    
    public var tooltipBackgroundStatic: UIColor {
        switch Warp.Theme {
        case .blocket: return UIColor.dynamicColor(defaultColor: token.backgroundInverted, darkModeColor: token.surfaceElevated300)
        case .dba: return UIColor.dynamicColor(defaultColor: token.backgroundInverted, darkModeColor: token.surfaceElevated300)
        case .finn: return UIColor.dynamicColor(defaultColor: token.backgroundInverted, darkModeColor: token.surfaceElevated300)
        case .tori: return UIColor.dynamicColor(defaultColor: token.backgroundInverted, darkModeColor: token.surfaceElevated300)
        }
    }
    
    public var switchHandleBackground: UIColor {
        switch Warp.Theme {
        case .blocket: return BlocketUIColors.gray500
        case .dba: return DbaUIColors.gray500
        case .finn: return FinnUIColors.gray500
        case .tori: return ToriUIColors.gray500
        }
    }
    
    public var switchHandleBackgroundHover: UIColor {
        switch Warp.Theme {
        case .blocket: return UIColor.dynamicColor(defaultColor: BlocketUIColors.gray600, darkModeColor: BlocketUIColors.gray400)
        case .dba: return UIColor.dynamicColor(defaultColor: DbaUIColors.gray600, darkModeColor: DbaUIColors.gray400)
        case .finn: return UIColor.dynamicColor(defaultColor: FinnUIColors.gray600, darkModeColor: FinnUIColors.gray400)
        case .tori: return UIColor.dynamicColor(defaultColor: ToriUIColors.gray600, darkModeColor: ToriUIColors.gray400)
        }
    }
}
