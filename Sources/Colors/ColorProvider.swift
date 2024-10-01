import SwiftUI

/// Source: https://docs.google.com/spreadsheets/d/1Q-Tr_dwJVfxgh3527IFjXQKqtnPPM42QeIr-M6q-zu8/edit#gid=1588196525
@preconcurrency @MainActor
public struct ColorProvider {
    public let token: TokenProvider
    
    /// Alert
    var alertInfoText: Color { token.text }
    var alertInfoBackground: Color { token.backgroundInfoSubtle }
    var alertInfoBorder: Color { token.borderInfo }
    var alertInfoSubtleBorder: Color { token.borderInfoSubtle }
    var alertInfoIcon: Color { token.iconInfo }
    var alertPositiveText: Color { token.text }
    var alertPositiveBackground: Color { token.backgroundPositiveSubtle }
    var alertPositiveBorder: Color { token.borderPositive }
    var alertPositiveIcon: Color { token.iconPositive }
    var alertPositiveSubtleBorder: Color { token.borderPositiveSubtle }
    var alertNegativeText: Color { token.text }
    var alertNegativeBackground: Color { token.backgroundNegativeSubtle }
    var alertNegativeBorder: Color { token.borderNegative }
    var alertNegativeSubtleBorder: Color { token.borderNegativeSubtle }
    var alertNegativeIcon: Color { token.iconNegative }
    var alertWarningText: Color { token.text }
    var alertWarningBackground: Color { token.backgroundWarningSubtle }
    var alertWarningBorder: Color { token.borderWarning }
    var alertWarningSubtleBorder: Color { token.borderWarningSubtle }
    var alertWarningIcon: Color { token.iconWarning }
    
    /// Avatar
    var avatarBackground: Color { token.backgroundSubtle }
    var avatarIcon: Color { token.iconDisabled }
    
    /// Badge
    var badgeNeutralText: Color { token.text }
    var badgeInfoText: Color { token.text }
    var badgePositiveText: Color { token.text }
    var badgeWarningText: Color { token.text }
    var badgeNegativeText: Color { token.text }
    var badgeDisabledText: Color { token.text }
    var badgePriceText: Color { token.textInvertedStatic }
    var badgeNotificationText: Color { token.textNotification }
    public var badgeNeutralBackground: Color {
        switch Warp.Theme {
        case .finn:
            return Color.dynamicColor(defaultColor: FinnColors.gray100, darkModeColor: FinnColors.gray600)
        case .tori:
            return Color.dynamicColor(defaultColor: ToriColors.gray100, darkModeColor: ToriColors.gray600)
        case .dba:
            return Color.dynamicColor(defaultColor: DbaColors.gray100, darkModeColor: DbaColors.gray600)
        case .blocket:
            return Color.dynamicColor(defaultColor: BlocketColors.gray100, darkModeColor: BlocketColors.gray600)
        }
    }
    public var badgeInfoBackground: Color {
        switch Warp.Theme {
        case .finn:
            return Color.dynamicColor(defaultColor: FinnColors.aqua100, darkModeColor: FinnColors.aqua700)
        case .tori:
            return Color.dynamicColor(defaultColor: ToriColors.blue100, darkModeColor: ToriColors.blue700)
        case .dba:
            return Color.dynamicColor(defaultColor: DbaColors.jeanblue100, darkModeColor: DbaColors.jeanblue700)
        case .blocket:
            return Color.dynamicColor(defaultColor: BlocketColors.blue100, darkModeColor: BlocketColors.blue700)
        }
    }
    public var badgePositiveBackground: Color {
        switch Warp.Theme {
        case .finn:
            return Color.dynamicColor(defaultColor: FinnColors.green100, darkModeColor: FinnColors.green700)
        case .tori:
            return Color.dynamicColor(defaultColor: ToriColors.green100, darkModeColor: ToriColors.green700)
        case .dba:
            return Color.dynamicColor(defaultColor: DbaColors.green100, darkModeColor: DbaColors.green700)
        case .blocket:
            return Color.dynamicColor(defaultColor: BlocketColors.green100, darkModeColor: BlocketColors.green700)
        }
    }
    public var badgeWarningBackground: Color {
        switch Warp.Theme {
        case .finn:
            return Color.dynamicColor(defaultColor: FinnColors.yellow100, darkModeColor: FinnColors.yellow700)
        case .tori:
            return Color.dynamicColor(defaultColor: ToriColors.yellow100, darkModeColor: ToriColors.yellow700)
        case .dba:
            return Color.dynamicColor(defaultColor: DbaColors.yellow100, darkModeColor: DbaColors.yellow700)
        case .blocket:
            return Color.dynamicColor(defaultColor: BlocketColors.yellow100, darkModeColor: BlocketColors.yellow700)
        }
    }
    public var badgeNegativeBackground: Color {
        switch Warp.Theme {
        case .finn:
            return Color.dynamicColor(defaultColor: FinnColors.red100, darkModeColor: FinnColors.red700)
        case .tori:
            return Color.dynamicColor(defaultColor: ToriColors.red100, darkModeColor: ToriColors.red700)
        case .dba:
            return Color.dynamicColor(defaultColor: DbaColors.red100, darkModeColor: DbaColors.red700)
        case .blocket:
            return Color.dynamicColor(defaultColor: BlocketColors.red100, darkModeColor: BlocketColors.red700)
        }
    }
    public var badgeDisabledBackground: Color { token.backgroundDisabled }
    var badgePriceBackground: Color {
        switch Warp.Theme {
        case .finn:
            return FinnColors.black.opacity(0.7)
        case .tori:
            return ToriColors.black.opacity(0.7)
        case .dba:
            return DbaColors.black.opacity(0.7)
        case .blocket:
            return BlocketColors.black.opacity(0.7)
        }
    }
    public var badgeSponsoredBackground: Color {
        switch Warp.Theme {
        case .finn:
            return Color.dynamicColor(defaultColor: FinnColors.aqua200, darkModeColor: FinnColors.aqua600)
        case .tori:
            return Color.dynamicColor(defaultColor: ToriColors.blue200, darkModeColor: ToriColors.blue600)
        case .dba:
            return Color.dynamicColor(defaultColor: DbaColors.jeanblue200, darkModeColor: DbaColors.jeanblue600)
        case .blocket:
            return Color.dynamicColor(defaultColor: BlocketColors.blue200, darkModeColor: BlocketColors.blue600)
        }
    }
    
    /// Box
    var boxNeutralText: Color { token.text }
    var boxBorderedText: Color { token.text }
    var boxInfoText: Color { token.text }
    var boxNeutralBackground: Color { token.backgroundSubtle }
    var boxBorderedBackground: Color { token.background }
    var boxInfoBackground: Color { token.backgroundInfoSubtle }
    var boxBorderedBorder: Color { token.border }
    var boxNeutralBackgroundHover: Color { token.backgroundSubtleHover }
    var boxBorderedBackgroundHover: Color { token.backgroundHover }
    var boxInfoBackgroundHover: Color { token.backgroundInfoSubtleHover }
    var boxBorderedBorderHover: Color { token.borderHover }
    
    /// Breadcrumbs
    var breadcrumbsText: Color { token.text }
    var breadcrumbsLinkText: Color { token.textLink }
    var breadcrumbsIcon: Color { token.icon }
    
    /// Broadcast
    var broadcastText: Color { token.text }
    var broadcastBackground: Color { token.backgroundWarningSubtle }
    var broadcastBorder: Color { token.borderWarning }
    var broadcastBorderSubtle: Color { token.borderWarningSubtle }
    var broadcastIcon: Color { token.iconWarning }
    
    /// Button
    var buttonPrimaryText: Color { token.textInverted }
    var buttonPrimaryTextDisabled: Color { token.textInverted }
    public var buttonPrimaryBackground: Color {
        switch Warp.Theme {
        case .finn:
            return token.backgroundPrimary
        case .tori:
            return Color.dynamicColor(defaultColor: ToriColors.watermelon600, darkModeColor: ToriColors.watermelon500)
        case .dba:
            return token.backgroundPrimary
        case .blocket:
            return token.backgroundPrimary
        }
    }
    var buttonPrimaryBackgroundHover: Color {
        switch Warp.Theme {
        case .finn:
            return token.backgroundPrimaryHover
        case .tori:
            return Color.dynamicColor(defaultColor: ToriColors.watermelon700, darkModeColor: ToriColors.watermelon400)
        case .dba:
            return token.backgroundPrimaryHover
        case .blocket:
            return token.backgroundPrimaryHover
        }
    }
    public var buttonPrimaryBackgroundActive: Color {
        switch Warp.Theme {
        case .finn:
            return token.backgroundPrimaryActive
        case .tori:
            return Color.dynamicColor(defaultColor: ToriColors.watermelon800, darkModeColor: ToriColors.watermelon300)
        case .dba:
            return token.backgroundPrimaryActive
        case .blocket:
            return token.backgroundPrimaryActive
        }
    }
    var buttonPrimaryBackgroundDisabled: Color { token.backgroundDisabled }
    var buttonPrimaryBorder: Color {
        switch Warp.Theme {
        case .finn:
            return token.borderPrimary
        case .tori:
            return Color.dynamicColor(defaultColor: ToriColors.watermelon600, darkModeColor: ToriColors.watermelon500)
        case .dba:
            return token.borderPrimary
        case .blocket:
            return token.borderPrimary
        }
    }
    var buttonPrimaryBorderHover: Color {
        switch Warp.Theme {
        case .finn:
            return token.borderPrimaryHover
        case .tori:
            return Color.dynamicColor(defaultColor: ToriColors.watermelon700, darkModeColor: ToriColors.watermelon400)
        case .dba:
            return token.borderPrimaryHover
        case .blocket:
            return token.borderPrimaryHover
        }
    }
    var buttonPrimaryBorderActive: Color {
        switch Warp.Theme {
        case .finn:
            return token.borderPrimaryActive
        case .tori:
            return Color.dynamicColor(defaultColor: ToriColors.watermelon800, darkModeColor: ToriColors.watermelon300)
        case .dba:
            return token.borderPrimaryActive
        case .blocket:
            return token.borderPrimaryActive
        }
    }
    var buttonPrimaryBorderDisabled: Color { token.borderDisabled }
    var buttonPrimaryIcon: Color { token.iconInverted }
    var buttonSecondaryText: Color { token.textLink }
    var buttonSecondaryTextDisabled: Color { token.textDisabled }
    var buttonSecondaryBackground: Color { token.background }
    var buttonSecondaryBackgroundHover: Color { token.backgroundHover }
    var buttonSecondaryBackgroundActive: Color { token.backgroundActive }
    var buttonSecondaryBackgroundDisabled: Color { token.backgroundDisabled }
    var buttonSecondaryBorder: Color { token.border }
    var buttonSecondaryBorderHover: Color { token.borderHover }
    var buttonSecondaryBorderActive: Color { token.borderActive }
    var buttonSecondaryIcon: Color { token.iconPrimary }
    var buttonQuietText: Color { token.textLink }
    var buttonQuietBackground: Color { .clear }
    var buttonQuietBackgroundHover: Color { token.backgroundHover }
    var buttonQuietBackgroundActive: Color { token.backgroundActive }
    var buttonQuietIcon: Color { token.iconPrimary }
    var buttonNegativeText: Color { token.textInverted }
    var buttonNegativeBackground: Color { token.backgroundNegative }
    var buttonNegativeBackgroundHover: Color { token.backgroundNegativeHover }
    var buttonNegativeBackgroundActive: Color { token.backgroundNegativeActive }
    var buttonNegativeBorder: Color { token.borderNegative }
    var buttonNegativeBorderHover: Color { token.borderNegativeHover }
    var buttonNegativeBorderActive: Color { token.borderNegativeActive }
    var buttonNegativeIcon: Color { token.iconInverted }
    var buttonNegativeQuietText: Color { token.textNegative }
    var buttonNegativeQuietBackground: Color { .clear }
    var buttonNegativeQuietBackgroundHover: Color { token.backgroundNegativeSubtleHover }
    var buttonNegativeQuietBackgroundActive: Color { token.backgroundNegativeSubtleActive }
    var buttonNegativeQuietBorder: Color { .clear }
    var buttonNegativeQuietBorderHover: Color { .clear }
    var buttonNegativeQuietBorderActive: Color { .clear }
    var buttonNegativeQuietIcon: Color { token.iconNegative }
    var buttonDisabledText: Color { token.textInverted }
    var buttonDisabledBackground: Color { token.backgroundDisabled }
    var buttonDisabledQuietText: Color { token.textDisabled }
    var buttonDisabledQuietBorder: Color { token.borderDisabled }
    var buttonPillBackground: Color { .clear }
    var buttonPillBackgroundHover: Color {
        switch Warp.Theme {
        case .finn:
            return FinnColors.blue300.opacity(0.3)
        case .tori:
            return ToriColors.blueberry300.opacity(0.3)
        case .dba:
            return DbaColors.jeanblue300.opacity(0.3)
        case .blocket:
            return BlocketColors.blue300.opacity(0.3)
        }
    }
    var buttonPillBackgroundActive: Color {
        switch Warp.Theme {
        case .finn:
            return FinnColors.blue400.opacity(0.3)
        case .tori:
            return ToriColors.blueberry400.opacity(0.3)
        case .dba:
            return DbaColors.jeanblue400.opacity(0.3)
        case .blocket:
            return BlocketColors.blue400.opacity(0.3)
        }
    }
    var buttonPillIcon: Color { token.icon }
    var buttonPillIconHover: Color { token.iconHover }
    var buttonPillIconActive: Color { token.iconActive }
    var buttonPillIconSelected: Color { token.iconSelected }
    var buttonLoadingText: Color { token.text }
    var buttonLoadingBackground: Color { .clear }
    var buttonLoadingIcon: Color { token.icon }
    
    var buttonUtilityText: Color { token.text }
    var buttonUtilityTextDisabled: Color { token.textDisabled }
    var buttonUtilityBackground: Color { token.background }
    var buttonUtilityBackgroundHover: Color { token.backgroundHover }
    var buttonUtilityBackgroundActive: Color { token.backgroundActive }
    var buttonUtilityBackgroundDisabled: Color { token.backgroundDisabled }
    var buttonUtilityBorder: Color { token.border }
    var buttonUtilityBorderHover: Color { token.borderHover }
    var buttonUtilityBorderActive: Color { token.borderActive }
    var buttonUtilityQuietText: Color { token.text }
    var buttonUtilityQuietBackground: Color { .clear }
    var buttonUtilityQuietBackgroundHover: Color { token.backgroundHover }
    var buttonUtilityQuietBackgroundActive: Color { token.backgroundActive }
    var buttonUtilityQuietBorder: Color { .clear }
    var buttonUtilityQuietBorderHover: Color { .clear }
    var buttonUtilityQuietBorderActive: Color { .clear }
    
    /// Button group
    var buttonGroupText: Color { token.textLink }
    var buttonGroupTextSelected: Color { token.textInverted }
    var buttonGroupBackground: Color { token.background }
    var buttonGroupBackgroundHover: Color { token.backgroundHover }
    var buttonGroupBackgroundActive: Color { token.backgroundActive }
    var buttonGroupBackgroundSelected: Color { token.backgroundPrimary }
    var buttonGroupBorder: Color { token.border }
    var buttonGroupBorderSelected: Color { token.borderPrimary }
    var buttonGroupUtilityBackgroundHover: Color {
        switch Warp.Theme {
        case .finn:
            return FinnColors.gray100
        case .tori:
            return ToriColors.gray100
        case .dba:
            return DbaColors.gray100
        case .blocket:
            return BlocketColors.gray100
        }
    }
    var buttonGroupUtilityBackgroundSelected: Color {
        switch Warp.Theme {
        case .finn:
            return FinnColors.gray200
        case .tori:
            return ToriColors.gray200
        case .dba:
            return DbaColors.gray200
        case .blocket:
            return BlocketColors.gray200
        }
    }
    var buttonGroupUtilityBorder: Color {
        switch Warp.Theme {
        case .finn:
            return FinnColors.gray300
        case .tori:
            return ToriColors.gray300
        case .dba:
            return DbaColors.gray300
        case .blocket:
            return BlocketColors.gray300
        }
    }
    var buttonGroupUtilityBorderSelected: Color {
        switch Warp.Theme {
        case .finn:
            return FinnColors.gray700
        case .tori:
            return ToriColors.gray700
        case .dba:
            return DbaColors.gray700
        case .blocket:
            return BlocketColors.gray700
        }
    }
    
    /// Callout
    var calloutText: Color { token.text }
    public var calloutBackground: Color {
        switch Warp.Theme {
        case .finn:
            return Color.dynamicColor(defaultColor: FinnColors.green100, darkModeColor: FinnColors.green800)
        case .tori:
            return Color.dynamicColor(defaultColor: ToriColors.blue100, darkModeColor: ToriColors.blue800)
        case .dba:
            return Color.dynamicColor(defaultColor: DbaColors.green100, darkModeColor: DbaColors.green800)
        case .blocket:
            return Color.dynamicColor(defaultColor: BlocketColors.green100, darkModeColor: BlocketColors.green800)
        }
    }
    public var calloutBorder: Color {
        switch Warp.Theme {
        case .finn:
            return Color.dynamicColor(defaultColor: FinnColors.green400, darkModeColor: FinnColors.green600)
        case .tori:
            return Color.dynamicColor(defaultColor: ToriColors.blue400, darkModeColor: ToriColors.blue600)
        case .dba:
            return Color.dynamicColor(defaultColor: DbaColors.green400, darkModeColor: DbaColors.green600)
        case .blocket:
            return Color.dynamicColor(defaultColor: BlocketColors.green400, darkModeColor: BlocketColors.green600)
        }
    }
    
    /// Card
    //    var shadowCard: Color { token.shadowSmall }
    //    var shadowCardHover: Color { token.shadowMedium }
    var cardBackground: Color { token.surfaceElevated200 }
    var cardBackgroundHover: Color { token.surfaceElevated200Hover }
    var cardBackgroundActive: Color { token.surfaceElevated200Active }
    var cardBackgroundSelected: Color { token.backgroundSelected }
    var cardBackgroundSelectedHover: Color { token.backgroundSelectedHover }
    var cardBorder: Color { .clear }
    var cardBorderHover: Color { .clear }
    var cardBorderActive: Color { .clear }
    var cardBorderSelected: Color { token.borderSelected }
    var cardFlatBackground: Color { token.background }
    var cardFlatBackgroundHover: Color { token.backgroundHover }
    var cardFlatBackgroundActive: Color { token.backgroundActive }
    var cardFlatBackgroundSelected: Color { token.backgroundSelected }
    var cardFlatBackgroundSelectedHover: Color { token.backgroundSelectedHover }
    var cardFlatBorder: Color { token.border }
    var cardFlatBorderHover: Color { token.borderHover }
    var cardFlatBorderActive: Color { token.borderActive }
    var cardFlatBorderSelected: Color { token.borderSelected }
    var cardFlatBorderSelectedHover: Color { token.borderSelectedHover }
    var cardFlatBorderSelectedActive: Color { token.borderSelectedActive }
    
    
    /// Checkbox
    var checkboxBackground: Color { token.background }
    var checkboxBackgroundHover: Color { token.backgroundHover }
    var checkboxBackgroundSelected: Color { token.backgroundPrimary }
    var checkboxBackgroundSelectedHover: Color { token.backgroundPrimaryHover }
    var checkboxBackgroundDisabled: Color { token.backgroundDisabledSubtle }
    var checkboxBackgroundSelectedDisabled: Color { token.backgroundDisabled }
    
    var checkboxBorder: Color { token.border }
    var checkboxBorderHover: Color { token.borderPrimary }
    var checkboxBorderSelected: Color { token.borderPrimary }
    var checkboxBorderSelectedHover: Color { token.borderPrimaryHover }
    var checkboxBorderDisabled: Color { token.borderDisabled }
    
    var checkboxNegativeBackground: Color { token.background }
    var checkboxNegativeBackgroundHover: Color { token.backgroundNegativeSubtleHover }
    var checkboxNegativeBackgroundSelected: Color { token.backgroundNegative }
    var checkboxNegativeBackgroundSelectedHover: Color { token.backgroundNegativeHover }
    var checkboxNegativeBorder: Color { token.borderNegative }
    var checkboxNegativeBorderHover: Color { token.borderNegativeHover }
    
    var checkboxIcon: Color { token.iconInverted }
    
    /// Datepicker
    var datepickerButtonBackground: Color { token.background }
    var datepickerButtonBackgroundHover: Color { token.backgroundHover }
    var datepickerButtonBackgroundSelected: Color { token.backgroundPrimary }
    var datepickerTrackBackgroundSelected: Color { token.backgroundPrimarySubtleActive }
    var datepickerBackground: Color { token.background }
    var datepickerBorder: Color { token.border }
    
    /// Expandable
    var expandableTitleText: Color { token.text }
    var expandableParagraphText: Color { token.text }
    var expandableBackground: Color { token.backgroundSubtle }
    var expandableBackgroundHover: Color { token.backgroundSubtleHover }
    var expandableIcon: Color { token.icon }
    
    /// Footer
    
    /// Header
    
    /// Help text
    var helptextText: Color { token.textSubtle }
    var helptextNegativeText: Color { token.textNegative }
    var helptextPositiveText: Color { token.textPositive }
    
    /// Image placeholder
    var imagePlaceholderBackground: Color { token.backgroundSubtle }
    var imagePlaceholderIcon: Color { token.iconDisabled }
    
    /// Input (aka Text field, includes text area)
    var inputTextHint: Color { token.textPlaceholder }
    var inputTextFilled: Color { token.text }
    var inputTextDisabled: Color { token.textDisabled }
    var inputTextNegative: Color { token.textNegative }
    var inputTextReadOnly: Color { token.text }
    var inputBackground: Color { token.background }
    var inputBackgroundDisabled: Color { token.backgroundDisabledSubtle }
    var inputBorder: Color { token.border }
    var inputBorderHover: Color { token.borderHover }
    var inputBorderActive: Color { token.borderFocus }
    var inputBorderFilled: Color { token.border }
    var inputBorderDisabled: Color { token.borderDisabled }
    var inputBorderNegative: Color { token.borderNegative }
    var inputIcon: Color { token.icon }
    var inputCaret: Color { token.icon }
    
    /// Label
    var labelText: Color { token.text }
    var labelOptionalText: Color { token.text }
    var labelIcon: Color { token.icon }
    var labelTextNegative: Color { token.textNegative }
    
    /// List
    var listText: Color { token.text }
    var listBulletedIcon: Color { token.text }
    var listNumberedIcon: Color { token.text }
    var listCheckedIcon: Color { token.iconPrimary }
    
    /// Modal
    var modalTextTitle: Color { token.text }
    var modalTextParagraph: Color { token.text }
    var modalBackground: Color { token.surfaceElevated100 }
    //    var shadowModal: Color { token.shadowModal }
    
    /// Nav Bar
    public var navbarIconSelected: Color {
        switch Warp.Theme {
        case .finn:
            return token.iconSelected
        case .tori:
            return token.iconSecondary
        case .dba:
            return token.iconSecondary
        case .blocket:
            return token.iconSecondary
        }
    }
    public var navbarBorderSelected: Color {
        switch Warp.Theme {
        case .finn:
            return token.borderSelected
        case .tori:
            return token.borderSecondary
        case .dba:
            return token.borderSecondary
        case .blocket:
            return token.borderSecondary
        }
    }
    
    /// Page indicator
    var pageIndicatorBackground: Color { token.backgroundDisabledSubtle }
    var pageIndicatorBackgroundHover: Color { token.iconSubtle }
    var pageIndicatorBackgroundSelected: Color { token.iconSelected }
    
    /// Pagination
    var paginationText: Color { token.textLink }
    var paginationTextActive: Color { token.textInverted }
    var paginationBackgroundHover: Color { token.backgroundPrimarySubtleHover }
    var paginationBackgroundActive: Color { token.backgroundPrimary }
    var paginationIcon: Color { token.icon }
    
    /// Pill
    var pillFilterText: Color { token.textInverted }
    var pillFilterBackground: Color { token.backgroundPrimary }
    var pillFilterBackgroundHover: Color { token.backgroundPrimaryHover }
    var pillFilterBackgroundActive: Color { token.backgroundPrimaryActive }
    var pillFilterIcon: Color { token.iconInverted }
    var pillSuggestionText: Color { token.text }
    var pillSuggestionBackground: Color {
        switch Warp.Theme {
        case .finn:
            return Color.dynamicColor(defaultColor: FinnColors.gray200, darkModeColor: FinnColors.gray600)
        case .tori:
            return Color.dynamicColor(defaultColor: ToriColors.gray200, darkModeColor: ToriColors.gray600)
        case .dba:
            return Color.dynamicColor(defaultColor: DbaColors.gray200, darkModeColor: DbaColors.gray600)
        case .blocket:
            return Color.dynamicColor(defaultColor: BlocketColors.gray200, darkModeColor: BlocketColors.gray600)
        }
    }
    var pillSuggestionBackgroundHover: Color {
        switch Warp.Theme {
        case .finn:
            return Color.dynamicColor(defaultColor: FinnColors.gray300, darkModeColor: FinnColors.gray500)
        case .tori:
            return Color.dynamicColor(defaultColor: ToriColors.gray300, darkModeColor: ToriColors.gray500)
        case .dba:
            return Color.dynamicColor(defaultColor: DbaColors.gray300, darkModeColor: DbaColors.gray500)
        case .blocket:
            return Color.dynamicColor(defaultColor: BlocketColors.gray300, darkModeColor: BlocketColors.gray500)
        }
    }
    var pillSuggestionBackgroundActive: Color {
        switch Warp.Theme {
        case .finn:
            return FinnColors.gray400
        case .tori:
            return ToriColors.gray400
        case .dba:
            return DbaColors.gray400
        case .blocket:
            return BlocketColors.gray400
        }
    }
    var pillSuggestionIcon: Color { token.icon }
    
    /// Popover
    var popoverTitleText: Color { token.text }
    var popoverParagraphText: Color { token.text }
    var popoverBackground: Color { token.surfaceElevated300 }
    //    var shadowPopover: Color { token.shadowPopover }
    
    /// Radio
    var radioBackground: Color { token.background }
    var radioBackgroundHover: Color { token.backgroundPrimarySubtle }
    var radioBackgroundDisabled: Color { token.backgroundDisabledSubtle }
    var radioBorder: Color { token.border }
    var radioBorderHover: Color { token.borderPrimary }
    var radioBorderSelected: Color { token.borderSelected }
    var radioBorderSelectedHover: Color { token.borderSelectedHover }
    var radioBorderDisabled: Color { token.borderDisabled }
    var radioNegativeBackground: Color { token.background }
    var radioNegativeBackgroundHover: Color { token.backgroundNegativeSubtle }
    var radioNegativeBorder: Color { token.borderNegative }
    var radioNegativeBorderHover: Color { token.borderNegativeHover }
    
    /// Select
    var selectText: Color { token.text }
    var selectTextActive: Color { token.text }
    var selectTextDisabled: Color { token.textDisabled }
    var selectBackground: Color { token.background }
    var selectBackgroundDisabled: Color { token.backgroundDisabledSubtle }
    var selectBorder: Color { token.border }
    var selectBorderHover: Color { token.borderHover }
    var selectBorderActive: Color { token.borderActive }
    var selectBorderDisabled: Color { token.borderDisabled }
    var selectBorderNegative: Color { token.borderNegative }
    var selectIcon: Color { token.icon }
    
    /// Slider
    var sliderHandleBackground: Color { token.backgroundPrimary }
    var sliderHandleBackgroundHover: Color { token.backgroundPrimaryHover }
    var sliderHandleBackgroundActive: Color { token.backgroundPrimaryActive }
    var sliderHandleBorder: Color { token.borderPrimary }
    var sliderHandleBorderHover: Color { token.borderPrimaryHover }
    var sliderHandleBorderActive: Color { token.borderPrimaryActive }
    var sliderTrackBackground: Color { token.backgroundDisabledSubtle }
    var sliderTrackBackgroundActive: Color { token.backgroundPrimary }
    //    var shadowSliderHandle: Color { token.shadowS }
    var sliderHandleBackgroundDisabled: Color { token.backgroundDisabled }
    var sliderTrackBackgroundDisabled: Color { token.backgroundDisabled }
    
    /// Spinner
    var spinnerBorder: Color { token.borderPrimarySubtle.opacity(0.5) }
    var spinnerBorderTop: Color { token.borderPrimary }
    
    /// Star rating
    var starRatingIcon: Color { token.iconPrimary }
    
    /// Step indicator
    var stepIndicatorHandleBackground: Color { token.background }
    var stepIndicatorHandleBackgroundActive: Color { token.backgroundPrimary }
    var stepIndicatorTrackBackground: Color { token.backgroundDisabled }
    var stepIndicatorTrackBackgroundActive: Color { token.backgroundPrimary }
    var stepIndicatorHandleBorder: Color { token.border }
    var stepIndicatorHandleBorderActive: Color { token.borderPrimary }
    var stepIndicatorHandleIcon: Color { token.iconInverted }
    
    /// Switch (Toggle)
    var switchTrackBackground: Color {
        switch Warp.Theme {
        case .finn:
            return Color.dynamicColor(defaultColor: FinnColors.gray200, darkModeColor: FinnColors.gray600)
        case .tori:
            return Color.dynamicColor(defaultColor: ToriColors.gray200, darkModeColor: ToriColors.gray600)
        case .dba:
            return Color.dynamicColor(defaultColor: DbaColors.gray200, darkModeColor: DbaColors.gray600)
        case .blocket:
            return Color.dynamicColor(defaultColor: BlocketColors.gray200, darkModeColor: BlocketColors.gray600)
        }
    }
    var switchTrackBackgroundHover: Color {
        switch Warp.Theme {
        case .finn:
            return Color.dynamicColor(defaultColor: FinnColors.gray300, darkModeColor: FinnColors.gray500)
        case .tori:
            return Color.dynamicColor(defaultColor: ToriColors.gray300, darkModeColor: ToriColors.gray500)
        case .dba:
            return Color.dynamicColor(defaultColor: DbaColors.gray300, darkModeColor: DbaColors.gray500)
        case .blocket:
            return Color.dynamicColor(defaultColor: BlocketColors.gray300, darkModeColor: BlocketColors.gray500)
        }
    }
    var switchTrackBackgroundSelected: Color { token.backgroundPrimary }
    var switchTrackBackgroundSelectedHover: Color { token.backgroundPrimaryHover }
    var switchHandleBackground: Color { token.background }
    var switchTrackBackgroundDisabled: Color { token.backgroundDisabledSubtle }
    var switchHandleBackgroundDisabled: Color { token.backgroundDisabled }
    
    /// Tabs
    var tabsBorder: Color { .clear }
    var tabsBorderHover: Color { token.borderPrimary }
    var tabsBorderActive: Color { token.borderPrimaryHover }
    var tabsBorderSelected: Color { token.borderSelected }
    var tabsText: Color { token.textSubtle }
    var tabsTextHover: Color { token.textLink }
    var tabsTextSelected: Color { token.textLink }
    var tabsIcon: Color { token.icon }
    var tabsIconHover: Color { token.iconPrimary }
    var tabsIconSelected: Color { token.iconSelected }
    
    /// Toast
    var toastPositiveText: Color { token.text }
    var toastPositiveBackground: Color { token.backgroundPositiveSubtle }
    var toastPositiveBorder: Color { token.borderPositive }
    var toastPositiveSubtleBorder: Color { token.borderPositiveSubtle }
    var toastPositiveIcon: Color { token.iconPositive }
    var toastWarningText: Color { token.text }
    var toastWarningBackground: Color { token.backgroundWarningSubtle }
    var toastWarningBorder: Color { token.borderWarning }
    var toastWarningSubtleBorder: Color { token.borderWarningSubtle }
    var toastWarningIcon: Color { token.iconWarning }
    var toastNegativeText: Color { token.text }
    var toastNegativeBackground: Color { token.backgroundNegativeSubtle }
    var toastNegativeBorder: Color { token.borderNegative }
    var toastNegativeSubtleBorder: Color { token.borderNegativeSubtle }
    var toastNegativeIcon: Color { token.iconNegative }
    
    /// Tooltip
    var tooltipText: Color { token.textInvertedStatic }
    public var tooltipBackgroundStatic: Color { Color.dynamicColor(defaultColor: token.backgroundInverted, darkModeColor: token.surfaceElevated300) }
    //    var shadowTooltip: Color { toek.shadow-m }
}

@preconcurrency @MainActor
public struct UIColorProvider {
    public let token: UITokenProvider
    
    /// Alert
    var alertInfoText: UIColor { token.text }
    var alertInfoBackground: UIColor { token.backgroundInfoSubtle }
    var alertInfoBorder: UIColor { token.borderInfo }
    var alertInfoSubtleBorder: UIColor { token.borderInfoSubtle }
    var alertInfoIcon: UIColor { token.iconInfo }
    var alertPositiveText: UIColor { token.text }
    var alertPositiveBackground: UIColor { token.backgroundPositiveSubtle }
    var alertPositiveBorder: UIColor { token.borderPositive }
    var alertPositiveIcon: UIColor { token.iconPositive }
    var alertPositiveSubtleBorder: UIColor { token.borderPositiveSubtle }
    var alertNegativeText: UIColor { token.text }
    var alertNegativeBackground: UIColor { token.backgroundNegativeSubtle }
    var alertNegativeBorder: UIColor { token.borderNegative }
    var alertNegativeSubtleBorder: UIColor { token.borderNegativeSubtle }
    var alertNegativeIcon: UIColor { token.iconNegative }
    var alertWarningText: UIColor { token.text }
    var alertWarningBackground: UIColor { token.backgroundWarningSubtle }
    var alertWarningBorder: UIColor { token.borderWarning }
    var alertWarningSubtleBorder: UIColor { token.borderWarningSubtle }
    var alertWarningIcon: UIColor { token.iconWarning }
    
    /// Avatar
    var avatarBackground: UIColor { token.backgroundSubtle }
    var avatarIcon: UIColor { token.iconDisabled }
    
    /// Badge
    var badgeNeutralText: UIColor { token.text }
    var badgeInfoText: UIColor { token.text }
    var badgePositiveText: UIColor { token.text }
    var badgeWarningText: UIColor { token.text }
    var badgeNegativeText: UIColor { token.text }
    var badgeDisabledText: UIColor { token.text }
    var badgePriceText: UIColor { token.textInvertedStatic }
    var badgeNotificationText: UIColor { token.textNotification }
    public var badgeNeutralBackground: UIColor {
        switch Warp.Theme {
        case .finn:
            return UIColor.dynamicColor(defaultColor: FinnUIColors.gray100, darkModeColor: FinnUIColors.gray600)
        case .tori:
            return UIColor.dynamicColor(defaultColor: ToriUIColors.gray100, darkModeColor: ToriUIColors.gray600)
        case .dba:
            return UIColor.dynamicColor(defaultColor: DbaUIColors.gray100, darkModeColor: DbaUIColors.gray600)
        case .blocket:
            return UIColor.dynamicColor(defaultColor: BlocketUIColors.gray100, darkModeColor: BlocketUIColors.gray600)
        }
    }
    public var badgeInfoBackground: UIColor {
        switch Warp.Theme {
        case .finn:
            return UIColor.dynamicColor(defaultColor: FinnUIColors.aqua100, darkModeColor: FinnUIColors.aqua700)
        case .tori:
            return UIColor.dynamicColor(defaultColor: ToriUIColors.blue100, darkModeColor: ToriUIColors.blue700)
        case .dba:
            return UIColor.dynamicColor(defaultColor: DbaUIColors.jeanblue100, darkModeColor: DbaUIColors.jeanblue700)
        case .blocket:
            return UIColor.dynamicColor(defaultColor: BlocketUIColors.blue100, darkModeColor: BlocketUIColors.blue700)
        }
    }
    public var badgePositiveBackground: UIColor {
        switch Warp.Theme {
        case .finn:
            return UIColor.dynamicColor(defaultColor: FinnUIColors.green100, darkModeColor: FinnUIColors.green700)
        case .tori:
            return UIColor.dynamicColor(defaultColor: ToriUIColors.green100, darkModeColor: ToriUIColors.green700)
        case .dba:
            return UIColor.dynamicColor(defaultColor: DbaUIColors.green100, darkModeColor: DbaUIColors.green700)
        case .blocket:
            return UIColor.dynamicColor(defaultColor: BlocketUIColors.green100, darkModeColor: BlocketUIColors.green700)
        }
    }
    public var badgeWarningBackground: UIColor {
        switch Warp.Theme {
        case .finn:
            return UIColor.dynamicColor(defaultColor: FinnUIColors.yellow100, darkModeColor: FinnUIColors.yellow700)
        case .tori:
            return UIColor.dynamicColor(defaultColor: ToriUIColors.yellow100, darkModeColor: ToriUIColors.yellow700)
        case .dba:
            return UIColor.dynamicColor(defaultColor: DbaUIColors.yellow100, darkModeColor: DbaUIColors.yellow700)
        case .blocket:
            return UIColor.dynamicColor(defaultColor: BlocketUIColors.yellow100, darkModeColor: BlocketUIColors.yellow700)
        }
    }
    public var badgeNegativeBackground: UIColor {
        switch Warp.Theme {
        case .finn:
            return UIColor.dynamicColor(defaultColor: FinnUIColors.red100, darkModeColor: FinnUIColors.red700)
        case .tori:
            return UIColor.dynamicColor(defaultColor: ToriUIColors.red100, darkModeColor: ToriUIColors.red700)
        case .dba:
            return UIColor.dynamicColor(defaultColor: DbaUIColors.red100, darkModeColor: DbaUIColors.red700)
        case .blocket:
            return UIColor.dynamicColor(defaultColor: BlocketUIColors.red100, darkModeColor: BlocketUIColors.red700)
        }
    }
    public var badgeDisabledBackground: UIColor { token.backgroundDisabled }
    var badgePriceBackground: UIColor {
        switch Warp.Theme {
        case .finn:
            return FinnUIColors.black.withAlphaComponent(0.7)
        case .tori:
            return ToriUIColors.black.withAlphaComponent(0.7)
        case .dba:
            return DbaUIColors.black.withAlphaComponent(0.7)
        case .blocket:
            return BlocketUIColors.black.withAlphaComponent(0.7)
        }
    }
    public var badgeSponsoredBackground: UIColor {
        switch Warp.Theme {
        case .finn:
            return UIColor.dynamicColor(defaultColor: FinnUIColors.aqua200, darkModeColor: FinnUIColors.aqua600)
        case .tori:
            return UIColor.dynamicColor(defaultColor: ToriUIColors.blue200, darkModeColor: ToriUIColors.blue600)
        case .dba:
            return UIColor.dynamicColor(defaultColor: DbaUIColors.jeanblue200, darkModeColor: DbaUIColors.jeanblue600)
        case .blocket:
            return UIColor.dynamicColor(defaultColor: BlocketUIColors.blue200, darkModeColor: BlocketUIColors.blue600)
        }
    }
    
    /// Box
    var boxNeutralText: UIColor { token.text }
    var boxBorderedText: UIColor { token.text }
    var boxInfoText: UIColor { token.text }
    var boxNeutralBackground: UIColor { token.backgroundSubtle }
    var boxBorderedBackground: UIColor { token.background }
    var boxInfoBackground: UIColor { token.backgroundInfoSubtle }
    var boxBorderedBorder: UIColor { token.border }
    var boxNeutralBackgroundHover: UIColor { token.backgroundSubtleHover }
    var boxBorderedBackgroundHover: UIColor { token.backgroundHover }
    var boxInfoBackgroundHover: UIColor { token.backgroundInfoSubtleHover }
    var boxBorderedBorderHover: UIColor { token.borderHover }
    
    /// Breadcrumbs
    var breadcrumbsText: UIColor { token.text }
    var breadcrumbsLinkText: UIColor { token.textLink }
    var breadcrumbsIcon: UIColor { token.icon }
    
    /// Broadcast
    var broadcastText: UIColor { token.text }
    var broadcastBackground: UIColor { token.backgroundWarningSubtle }
    var broadcastBorder: UIColor { token.borderWarning }
    var broadcastBorderSubtle: UIColor { token.borderWarningSubtle }
    var broadcastIcon: UIColor { token.iconWarning }
    
    /// Button
    var buttonPrimaryText: UIColor { token.textInverted }
    var buttonPrimaryTextDisabled: UIColor { token.textInverted }
    public var buttonPrimaryBackground: UIColor {
        switch Warp.Theme {
        case .finn:
            return token.backgroundPrimary
        case .tori:
            return UIColor.dynamicColor(defaultColor: ToriUIColors.watermelon600, darkModeColor: ToriUIColors.watermelon500)
        case .dba:
            return token.backgroundPrimary
        case .blocket:
            return token.backgroundPrimary
        }
    }
    var buttonPrimaryBackgroundHover: UIColor {
        switch Warp.Theme {
        case .finn:
            return token.backgroundPrimaryHover
        case .tori:
            return UIColor.dynamicColor(defaultColor: ToriUIColors.watermelon700, darkModeColor: ToriUIColors.watermelon400)
        case .dba:
            return token.backgroundPrimaryHover
        case .blocket:
            return token.backgroundPrimaryHover
        }
    }
    public var buttonPrimaryBackgroundActive: UIColor {
        switch Warp.Theme {
        case .finn:
            return token.backgroundPrimaryActive
        case .tori:
            return UIColor.dynamicColor(defaultColor: ToriUIColors.watermelon800, darkModeColor: ToriUIColors.watermelon300)
        case .dba:
            return token.backgroundPrimaryActive
        case .blocket:
            return token.backgroundPrimaryActive
        }
    }
    var buttonPrimaryBackgroundDisabled: UIColor { token.backgroundDisabled }
    var buttonPrimaryBorder: UIColor {
        switch Warp.Theme {
        case .finn:
            return token.borderPrimary
        case .tori:
            return UIColor.dynamicColor(defaultColor: ToriUIColors.watermelon600, darkModeColor: ToriUIColors.watermelon500)
        case .dba:
            return token.borderPrimary
        case .blocket:
            return token.borderPrimary
        }
    }
    var buttonPrimaryBorderHover: UIColor {
        switch Warp.Theme {
        case .finn:
            return token.borderPrimaryHover
        case .tori:
            return UIColor.dynamicColor(defaultColor: ToriUIColors.watermelon700, darkModeColor: ToriUIColors.watermelon400)
        case .dba:
            return token.borderPrimaryHover
        case .blocket:
            return token.borderPrimaryHover
        }
    }
    var buttonPrimaryBorderActive: UIColor {
        switch Warp.Theme {
        case .finn:
            return token.borderPrimaryActive
        case .tori:
            return UIColor.dynamicColor(defaultColor: ToriUIColors.watermelon800, darkModeColor: ToriUIColors.watermelon300)
        case .dba:
            return token.borderPrimaryActive
        case .blocket:
            return token.borderPrimaryActive
        }
    }
    var buttonPrimaryBorderDisabled: UIColor { token.borderDisabled }
    var buttonPrimaryIcon: UIColor { token.iconInverted }
    var buttonSecondaryText: UIColor { token.textLink }
    var buttonSecondaryTextDisabled: UIColor { token.textDisabled }
    var buttonSecondaryBackground: UIColor { token.background }
    var buttonSecondaryBackgroundHover: UIColor { token.backgroundHover }
    var buttonSecondaryBackgroundActive: UIColor { token.backgroundActive }
    var buttonSecondaryBackgroundDisabled: UIColor { token.backgroundDisabled }
    var buttonSecondaryBorder: UIColor { token.border }
    var buttonSecondaryBorderHover: UIColor { token.borderHover }
    var buttonSecondaryBorderActive: UIColor { token.borderActive }
    var buttonSecondaryIcon: UIColor { token.iconPrimary }
    var buttonQuietText: UIColor { token.textLink }
    var buttonQuietBackground: UIColor { .clear }
    var buttonQuietBackgroundHover: UIColor { token.backgroundHover }
    var buttonQuietBackgroundActive: UIColor { token.backgroundActive }
    var buttonQuietIcon: UIColor { token.iconPrimary }
    var buttonNegativeText: UIColor { token.textInverted }
    var buttonNegativeBackground: UIColor { token.backgroundNegative }
    var buttonNegativeBackgroundHover: UIColor { token.backgroundNegativeHover }
    var buttonNegativeBackgroundActive: UIColor { token.backgroundNegativeActive }
    var buttonNegativeBorder: UIColor { token.borderNegative }
    var buttonNegativeBorderHover: UIColor { token.borderNegativeHover }
    var buttonNegativeBorderActive: UIColor { token.borderNegativeActive }
    var buttonNegativeIcon: UIColor { token.iconInverted }
    var buttonNegativeQuietText: UIColor { token.textNegative }
    var buttonNegativeQuietBackground: UIColor { .clear }
    var buttonNegativeQuietBackgroundHover: UIColor { token.backgroundNegativeSubtleHover }
    var buttonNegativeQuietBackgroundActive: UIColor { token.backgroundNegativeSubtleActive }
    var buttonNegativeQuietBorder: UIColor { .clear }
    var buttonNegativeQuietBorderHover: UIColor { .clear }
    var buttonNegativeQuietBorderActive: UIColor { .clear }
    var buttonNegativeQuietIcon: UIColor { token.iconNegative }
    var buttonDisabledText: UIColor { token.textInverted }
    var buttonDisabledBackground: UIColor { token.backgroundDisabled }
    var buttonDisabledQuietText: UIColor { token.textDisabled }
    var buttonDisabledQuietBorder: UIColor { token.borderDisabled }
    var buttonPillBackground: UIColor { .clear }
    var buttonPillBackgroundHover: UIColor {
        switch Warp.Theme {
        case .finn:
            return FinnUIColors.blue300.withAlphaComponent(0.3)
        case .tori:
            return ToriUIColors.blueberry300.withAlphaComponent(0.3)
        case .dba:
            return DbaUIColors.jeanblue300.withAlphaComponent(0.3)
        case .blocket:
            return BlocketUIColors.blue300.withAlphaComponent(0.3)
        }
    }
    var buttonPillBackgroundActive: UIColor {
        switch Warp.Theme {
        case .finn:
            return FinnUIColors.blue400.withAlphaComponent(0.3)
        case .tori:
            return ToriUIColors.blueberry400.withAlphaComponent(0.3)
        case .dba:
            return DbaUIColors.jeanblue400.withAlphaComponent(0.3)
        case .blocket:
            return BlocketUIColors.blue400.withAlphaComponent(0.3)
        }
    }
    var buttonPillIcon: UIColor { token.icon }
    var buttonPillIconHover: UIColor { token.iconHover }
    var buttonPillIconActive: UIColor { token.iconActive }
    var buttonPillIconSelected: UIColor { token.iconSelected }
    var buttonLoadingText: UIColor { token.text }
    var buttonLoadingBackground: UIColor { .clear }
    var buttonLoadingIcon: UIColor { token.icon }
    
    var buttonUtilityText: UIColor { token.text }
    var buttonUtilityTextDisabled: UIColor { token.textDisabled }
    var buttonUtilityBackground: UIColor { token.background }
    var buttonUtilityBackgroundHover: UIColor { token.backgroundHover }
    var buttonUtilityBackgroundActive: UIColor { token.backgroundActive }
    var buttonUtilityBackgroundDisabled: UIColor { token.backgroundDisabled }
    var buttonUtilityBorder: UIColor { token.border }
    var buttonUtilityBorderHover: UIColor { token.borderHover }
    var buttonUtilityBorderActive: UIColor { token.borderActive }
    var buttonUtilityQuietText: UIColor { token.text }
    var buttonUtilityQuietBackground: UIColor { .clear }
    var buttonUtilityQuietBackgroundHover: UIColor { token.backgroundHover }
    var buttonUtilityQuietBackgroundActive: UIColor { token.backgroundActive }
    var buttonUtilityQuietBorder: UIColor { .clear }
    var buttonUtilityQuietBorderHover: UIColor { .clear }
    var buttonUtilityQuietBorderActive: UIColor { .clear }
    
    /// Button group
    var buttonGroupText: UIColor { token.textLink }
    var buttonGroupTextSelected: UIColor { token.textInverted }
    var buttonGroupBackground: UIColor { token.background }
    var buttonGroupBackgroundHover: UIColor { token.backgroundHover }
    var buttonGroupBackgroundActive: UIColor { token.backgroundActive }
    var buttonGroupBackgroundSelected: UIColor { token.backgroundPrimary }
    var buttonGroupBorder: UIColor { token.border }
    var buttonGroupBorderSelected: UIColor { token.borderPrimary }
    var buttonGroupUtilityBackgroundHover: UIColor {
        switch Warp.Theme {
        case .finn:
            return FinnUIColors.gray100
        case .tori:
            return ToriUIColors.gray100
        case .dba:
            return DbaUIColors.gray100
        case .blocket:
            return BlocketUIColors.gray100
        }
    }
    var buttonGroupUtilityBackgroundSelected: UIColor {
        switch Warp.Theme {
        case .finn:
            return FinnUIColors.gray200
        case .tori:
            return ToriUIColors.gray200
        case .dba:
            return DbaUIColors.gray200
        case .blocket:
            return BlocketUIColors.gray200
        }
    }
    var buttonGroupUtilityBorder: UIColor {
        switch Warp.Theme {
        case .finn:
            return FinnUIColors.gray300
        case .tori:
            return ToriUIColors.gray300
        case .dba:
            return DbaUIColors.gray300
        case .blocket:
            return BlocketUIColors.gray300
        }
    }
    var buttonGroupUtilityBorderSelected: UIColor {
        switch Warp.Theme {
        case .finn:
            return FinnUIColors.gray700
        case .tori:
            return ToriUIColors.gray700
        case .dba:
            return DbaUIColors.gray700
        case .blocket:
            return BlocketUIColors.gray700
        }
    }
    
    /// Callout
    var calloutText: UIColor { token.text }
    public var calloutBackground: UIColor {
        switch Warp.Theme {
        case .finn:
            return UIColor.dynamicColor(defaultColor: FinnUIColors.green100, darkModeColor: FinnUIColors.green800)
        case .tori:
            return UIColor.dynamicColor(defaultColor: ToriUIColors.blue100, darkModeColor: ToriUIColors.blue800)
        case .dba:
            return UIColor.dynamicColor(defaultColor: DbaUIColors.green100, darkModeColor: DbaUIColors.green800)
        case .blocket:
            return UIColor.dynamicColor(defaultColor: BlocketUIColors.green100, darkModeColor: BlocketUIColors.green800)
        }
    }
    public var calloutBorder: UIColor {
        switch Warp.Theme {
        case .finn:
            return UIColor.dynamicColor(defaultColor: FinnUIColors.green400, darkModeColor: FinnUIColors.green600)
        case .tori:
            return UIColor.dynamicColor(defaultColor: ToriUIColors.blue400, darkModeColor: ToriUIColors.blue600)
        case .dba:
            return UIColor.dynamicColor(defaultColor: DbaUIColors.green400, darkModeColor: DbaUIColors.green600)
        case .blocket:
            return UIColor.dynamicColor(defaultColor: BlocketUIColors.green400, darkModeColor: BlocketUIColors.green600)
        }
    }
    
    /// Card
    //    var shadowCard: UIColor { token.shadowSmall }
    //    var shadowCardHover: UIColor { token.shadowMedium }
    var cardBackground: UIColor { token.surfaceElevated200 }
    var cardBackgroundHover: UIColor { token.surfaceElevated200Hover }
    var cardBackgroundActive: UIColor { token.surfaceElevated200Active }
    var cardBackgroundSelected: UIColor { token.backgroundSelected }
    var cardBackgroundSelectedHover: UIColor { token.backgroundSelectedHover }
    var cardBorder: UIColor { .clear }
    var cardBorderHover: UIColor { .clear }
    var cardBorderActive: UIColor { .clear }
    var cardBorderSelected: UIColor { token.borderSelected }
    var cardFlatBackground: UIColor { token.background }
    var cardFlatBackgroundHover: UIColor { token.backgroundHover }
    var cardFlatBackgroundActive: UIColor { token.backgroundActive }
    var cardFlatBackgroundSelected: UIColor { token.backgroundSelected }
    var cardFlatBackgroundSelectedHover: UIColor { token.backgroundSelectedHover }
    var cardFlatBorder: UIColor { token.border }
    var cardFlatBorderHover: UIColor { token.borderHover }
    var cardFlatBorderActive: UIColor { token.borderActive }
    var cardFlatBorderSelected: UIColor { token.borderSelected }
    var cardFlatBorderSelectedHover: UIColor { token.borderSelectedHover }
    var cardFlatBorderSelectedActive: UIColor { token.borderSelectedActive }
    
    
    /// Checkbox
    var checkboxBackground: UIColor { token.background }
    var checkboxBackgroundHover: UIColor { token.backgroundHover }
    var checkboxBackgroundSelected: UIColor { token.backgroundPrimary }
    var checkboxBackgroundSelectedHover: UIColor { token.backgroundPrimaryHover }
    var checkboxBackgroundDisabled: UIColor { token.backgroundDisabledSubtle }
    var checkboxBackgroundSelectedDisabled: UIColor { token.backgroundDisabled }
    
    var checkboxBorder: UIColor { token.border }
    var checkboxBorderHover: UIColor { token.borderPrimary }
    var checkboxBorderSelected: UIColor { token.borderPrimary }
    var checkboxBorderSelectedHover: UIColor { token.borderPrimaryHover }
    var checkboxBorderDisabled: UIColor { token.borderDisabled }
    
    var checkboxNegativeBackground: UIColor { token.background }
    var checkboxNegativeBackgroundHover: UIColor { token.backgroundNegativeSubtleHover }
    var checkboxNegativeBackgroundSelected: UIColor { token.backgroundNegative }
    var checkboxNegativeBackgroundSelectedHover: UIColor { token.backgroundNegativeHover }
    var checkboxNegativeBorder: UIColor { token.borderNegative }
    var checkboxNegativeBorderHover: UIColor { token.borderNegativeHover }
    
    var checkboxIcon: UIColor { token.iconInverted }
    
    /// Datepicker
    var datepickerButtonBackground: UIColor { token.background }
    var datepickerButtonBackgroundHover: UIColor { token.backgroundHover }
    var datepickerButtonBackgroundSelected: UIColor { token.backgroundPrimary }
    var datepickerTrackBackgroundSelected: UIColor { token.backgroundPrimarySubtleActive }
    var datepickerBackground: UIColor { token.background }
    var datepickerBorder: UIColor { token.border }
    
    /// Expandable
    var expandableTitleText: UIColor { token.text }
    var expandableParagraphText: UIColor { token.text }
    var expandableBackground: UIColor { token.backgroundSubtle }
    var expandableBackgroundHover: UIColor { token.backgroundSubtleHover }
    var expandableIcon: UIColor { token.icon }
    
    /// Footer
    
    /// Header
    
    /// Help text
    var helptextText: UIColor { token.textSubtle }
    var helptextNegativeText: UIColor { token.textNegative }
    var helptextPositiveText: UIColor { token.textPositive }
    
    /// Image placeholder
    var imagePlaceholderBackground: UIColor { token.backgroundSubtle }
    var imagePlaceholderIcon: UIColor { token.iconDisabled }
    
    /// Input (aka Text field, includes text area)
    var inputTextHint: UIColor { token.textPlaceholder }
    var inputTextFilled: UIColor { token.text }
    var inputTextDisabled: UIColor { token.textDisabled }
    var inputTextNegative: UIColor { token.textNegative }
    var inputTextReadOnly: UIColor { token.text }
    var inputBackground: UIColor { token.background }
    var inputBackgroundDisabled: UIColor { token.backgroundDisabledSubtle }
    var inputBorder: UIColor { token.border }
    var inputBorderHover: UIColor { token.borderHover }
    var inputBorderActive: UIColor { token.borderFocus }
    var inputBorderFilled: UIColor { token.border }
    var inputBorderDisabled: UIColor { token.borderDisabled }
    var inputBorderNegative: UIColor { token.borderNegative }
    var inputIcon: UIColor { token.icon }
    var inputCaret: UIColor { token.icon }
    
    /// Label
    var labelText: UIColor { token.text }
    var labelOptionalText: UIColor { token.text }
    var labelIcon: UIColor { token.icon }
    var labelTextNegative: UIColor { token.textNegative }
    
    /// List
    var listText: UIColor { token.text }
    var listBulletedIcon: UIColor { token.text }
    var listNumberedIcon: UIColor { token.text }
    var listCheckedIcon: UIColor { token.iconPrimary }
    
    /// Modal
    var modalTextTitle: UIColor { token.text }
    var modalTextParagraph: UIColor { token.text }
    var modalBackground: UIColor { token.surfaceElevated100 }
    //    var shadowModal: UIColor { token.shadowModal }
    
    /// Nav Bar
    public var navbarIconSelected: UIColor {
        switch Warp.Theme {
        case .finn:
            return token.iconSelected
        case .tori:
            return token.iconSecondary
        case .dba:
            return token.iconSecondary
        case .blocket:
            return token.iconSecondary
        }
    }
    public var navbarBorderSelected: UIColor {
        switch Warp.Theme {
        case .finn:
            return token.borderSelected
        case .tori:
            return token.borderSecondary
        case .dba:
            return token.borderSecondary
        case .blocket:
            return token.borderSecondary
        }
    }
    
    /// Page indicator
    var pageIndicatorBackground: UIColor { token.backgroundDisabledSubtle }
    var pageIndicatorBackgroundHover: UIColor { token.iconSubtle }
    var pageIndicatorBackgroundSelected: UIColor { token.iconSelected }
    
    /// Pagination
    var paginationText: UIColor { token.textLink }
    var paginationTextActive: UIColor { token.textInverted }
    var paginationBackgroundHover: UIColor { token.backgroundPrimarySubtleHover }
    var paginationBackgroundActive: UIColor { token.backgroundPrimary }
    var paginationIcon: UIColor { token.icon }
    
    /// Pill
    var pillFilterText: UIColor { token.textInverted }
    var pillFilterBackground: UIColor { token.backgroundPrimary }
    var pillFilterBackgroundHover: UIColor { token.backgroundPrimaryHover }
    var pillFilterBackgroundActive: UIColor { token.backgroundPrimaryActive }
    var pillFilterIcon: UIColor { token.iconInverted }
    var pillSuggestionText: UIColor { token.text }
    var pillSuggestionBackground: UIColor {
        switch Warp.Theme {
        case .finn:
            return UIColor.dynamicColor(defaultColor: FinnUIColors.gray200, darkModeColor: FinnUIColors.gray600)
        case .tori:
            return UIColor.dynamicColor(defaultColor: ToriUIColors.gray200, darkModeColor: ToriUIColors.gray600)
        case .dba:
            return UIColor.dynamicColor(defaultColor: DbaUIColors.gray200, darkModeColor: DbaUIColors.gray600)
        case .blocket:
            return UIColor.dynamicColor(defaultColor: BlocketUIColors.gray200, darkModeColor: BlocketUIColors.gray600)
        }
    }
    var pillSuggestionBackgroundHover: UIColor {
        switch Warp.Theme {
        case .finn:
            return UIColor.dynamicColor(defaultColor: FinnUIColors.gray300, darkModeColor: FinnUIColors.gray500)
        case .tori:
            return UIColor.dynamicColor(defaultColor: ToriUIColors.gray300, darkModeColor: ToriUIColors.gray500)
        case .dba:
            return UIColor.dynamicColor(defaultColor: DbaUIColors.gray300, darkModeColor: DbaUIColors.gray500)
        case .blocket:
            return UIColor.dynamicColor(defaultColor: BlocketUIColors.gray300, darkModeColor: BlocketUIColors.gray500)
        }
    }
    var pillSuggestionBackgroundActive: UIColor {
        switch Warp.Theme {
        case .finn:
            return FinnUIColors.gray400
        case .tori:
            return ToriUIColors.gray400
        case .dba:
            return DbaUIColors.gray400
        case .blocket:
            return BlocketUIColors.gray400
        }
    }
    var pillSuggestionIcon: UIColor { token.icon }
    
    /// Popover
    var popoverTitleText: UIColor { token.text }
    var popoverParagraphText: UIColor { token.text }
    var popoverBackground: UIColor { token.surfaceElevated300 }
    //    var shadowPopover: UIColor { token.shadowPopover }
    
    /// Radio
    var radioBackground: UIColor { token.background }
    var radioBackgroundHover: UIColor { token.backgroundPrimarySubtle }
    var radioBackgroundDisabled: UIColor { token.backgroundDisabledSubtle }
    var radioBorder: UIColor { token.border }
    var radioBorderHover: UIColor { token.borderPrimary }
    var radioBorderSelected: UIColor { token.borderSelected }
    var radioBorderSelectedHover: UIColor { token.borderSelectedHover }
    var radioBorderDisabled: UIColor { token.borderDisabled }
    var radioNegativeBackground: UIColor { token.background }
    var radioNegativeBackgroundHover: UIColor { token.backgroundNegativeSubtle }
    var radioNegativeBorder: UIColor { token.borderNegative }
    var radioNegativeBorderHover: UIColor { token.borderNegativeHover }
    
    /// Select
    var selectText: UIColor { token.text }
    var selectTextActive: UIColor { token.text }
    var selectTextDisabled: UIColor { token.textDisabled }
    var selectBackground: UIColor { token.background }
    var selectBackgroundDisabled: UIColor { token.backgroundDisabledSubtle }
    var selectBorder: UIColor { token.border }
    var selectBorderHover: UIColor { token.borderHover }
    var selectBorderActive: UIColor { token.borderActive }
    var selectBorderDisabled: UIColor { token.borderDisabled }
    var selectBorderNegative: UIColor { token.borderNegative }
    var selectIcon: UIColor { token.icon }
    
    /// Slider
    var sliderHandleBackground: UIColor { token.backgroundPrimary }
    var sliderHandleBackgroundHover: UIColor { token.backgroundPrimaryHover }
    var sliderHandleBackgroundActive: UIColor { token.backgroundPrimaryActive }
    var sliderHandleBorder: UIColor { token.borderPrimary }
    var sliderHandleBorderHover: UIColor { token.borderPrimaryHover }
    var sliderHandleBorderActive: UIColor { token.borderPrimaryActive }
    var sliderTrackBackground: UIColor { token.backgroundDisabledSubtle }
    var sliderTrackBackgroundActive: UIColor { token.backgroundPrimary }
    //    var shadowSliderHandle: UIColor { token.shadowS }
    var sliderHandleBackgroundDisabled: UIColor { token.backgroundDisabled }
    var sliderTrackBackgroundDisabled: UIColor { token.backgroundDisabled }
    
    /// Spinner
    var spinnerBorder: UIColor { token.borderPrimarySubtle.withAlphaComponent(0.5) }
    var spinnerBorderTop: UIColor { token.borderPrimary }
    
    /// Star rating
    var starRatingIcon: UIColor { token.iconPrimary }
    
    /// Step indicator
    var stepIndicatorHandleBackground: UIColor { token.background }
    var stepIndicatorHandleBackgroundActive: UIColor { token.backgroundPrimary }
    var stepIndicatorTrackBackground: UIColor { token.backgroundDisabled }
    var stepIndicatorTrackBackgroundActive: UIColor { token.backgroundPrimary }
    var stepIndicatorHandleBorder: UIColor { token.border }
    var stepIndicatorHandleBorderActive: UIColor { token.borderPrimary }
    var stepIndicatorHandleIcon: UIColor { token.iconInverted }
    
    /// Switch (Toggle)
    var switchTrackBackground: UIColor {
        switch Warp.Theme {
        case .finn:
            return UIColor.dynamicColor(defaultColor: FinnUIColors.gray200, darkModeColor: FinnUIColors.gray600)
        case .tori:
            return UIColor.dynamicColor(defaultColor: ToriUIColors.gray200, darkModeColor: ToriUIColors.gray600)
        case .dba:
            return UIColor.dynamicColor(defaultColor: DbaUIColors.gray200, darkModeColor: DbaUIColors.gray600)
        case .blocket:
            return UIColor.dynamicColor(defaultColor: BlocketUIColors.gray200, darkModeColor: BlocketUIColors.gray600)
        }
    }
    var switchTrackBackgroundHover: UIColor {
        switch Warp.Theme {
        case .finn:
            return UIColor.dynamicColor(defaultColor: FinnUIColors.gray300, darkModeColor: FinnUIColors.gray500)
        case .tori:
            return UIColor.dynamicColor(defaultColor: ToriUIColors.gray300, darkModeColor: ToriUIColors.gray500)
        case .dba:
            return UIColor.dynamicColor(defaultColor: DbaUIColors.gray300, darkModeColor: DbaUIColors.gray500)
        case .blocket:
            return UIColor.dynamicColor(defaultColor: BlocketUIColors.gray300, darkModeColor: BlocketUIColors.gray500)
        }
    }
    var switchTrackBackgroundSelected: UIColor { token.backgroundPrimary }
    var switchTrackBackgroundSelectedHover: UIColor { token.backgroundPrimaryHover }
    var switchHandleBackground: UIColor { token.background }
    var switchTrackBackgroundDisabled: UIColor { token.backgroundDisabledSubtle }
    var switchHandleBackgroundDisabled: UIColor { token.backgroundDisabled }
    
    /// Tabs
    var tabsBorder: UIColor { .clear }
    var tabsBorderHover: UIColor { token.borderPrimary }
    var tabsBorderActive: UIColor { token.borderPrimaryHover }
    var tabsBorderSelected: UIColor { token.borderSelected }
    var tabsText: UIColor { token.textSubtle }
    var tabsTextHover: UIColor { token.textLink }
    var tabsTextSelected: UIColor { token.textLink }
    var tabsIcon: UIColor { token.icon }
    var tabsIconHover: UIColor { token.iconPrimary }
    var tabsIconSelected: UIColor { token.iconSelected }
    
    /// Toast
    var toastPositiveText: UIColor { token.text }
    var toastPositiveBackground: UIColor { token.backgroundPositiveSubtle }
    var toastPositiveBorder: UIColor { token.borderPositive }
    var toastPositiveSubtleBorder: UIColor { token.borderPositiveSubtle }
    var toastPositiveIcon: UIColor { token.iconPositive }
    var toastWarningText: UIColor { token.text }
    var toastWarningBackground: UIColor { token.backgroundWarningSubtle }
    var toastWarningBorder: UIColor { token.borderWarning }
    var toastWarningSubtleBorder: UIColor { token.borderWarningSubtle }
    var toastWarningIcon: UIColor { token.iconWarning }
    var toastNegativeText: UIColor { token.text }
    var toastNegativeBackground: UIColor { token.backgroundNegativeSubtle }
    var toastNegativeBorder: UIColor { token.borderNegative }
    var toastNegativeSubtleBorder: UIColor { token.borderNegativeSubtle }
    var toastNegativeIcon: UIColor { token.iconNegative }
    
    /// Tooltip
    var tooltipText: UIColor { token.textInvertedStatic }
    public var tooltipBackgroundStatic: UIColor { UIColor.dynamicColor(defaultColor: token.backgroundInverted, darkModeColor: token.surfaceElevated300) }
    //    var shadowTooltip: UIColor { toek.shadow-m }
}
