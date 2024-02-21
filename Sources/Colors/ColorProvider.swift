import SwiftUI

/// Source: https://docs.google.com/spreadsheets/d/1Q-Tr_dwJVfxgh3527IFjXQKqtnPPM42QeIr-M6q-zu8/edit#gid=1588196525
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
    var avatarBackground: Color {
        switch Warp.Config.warpTheme {
        case .finn:
            return Color.dynamicColor(defaultColor: FinnColors.gray100, darkModeColor: FinnColors.gray800)
        case .tori:
            return Color.dynamicColor(defaultColor: ToriColors.gray100, darkModeColor: ToriColors.gray100)
        }
    }
    var avatarIcon: Color { token.iconDisabled }
    
    /// Badge
    var badgeNeutralText: Color { token.text }
    var badgeInfoText: Color { token.text }
    var badgePositiveText: Color { token.text }
    var badgeWarningText: Color { token.text }
    var badgeNegativeText: Color { token.text }
    var badgeDisabledText: Color { token.text }
    var badgePriceText: Color { token.textInverted }
    var badgeNotificationText: Color { token.textNotification }
    var badgeNeutralBackground: Color {
        switch Warp.Config.warpTheme {
        case .finn:
            return Color.dynamicColor(defaultColor: FinnColors.gray100, darkModeColor: FinnColors.gray700)
        case .tori:
            return Color.dynamicColor(defaultColor: ToriColors.gray100, darkModeColor: ToriColors.gray700)
        }
    }
    var badgeInfoBackground: Color {
        switch Warp.Config.warpTheme {
        case .finn:
            return Color.dynamicColor(defaultColor: FinnColors.aqua100, darkModeColor: FinnColors.aqua700)
        case .tori:
            return Color.dynamicColor(defaultColor: ToriColors.blue100, darkModeColor: ToriColors.blue700)
        }
    }
    var badgePositiveBackground: Color {
        switch Warp.Config.warpTheme {
        case .finn:
            return Color.dynamicColor(defaultColor: FinnColors.green100, darkModeColor: FinnColors.green700)
        case .tori:
            return Color.dynamicColor(defaultColor: ToriColors.green100, darkModeColor: ToriColors.green700)
        }
    }
    var badgeWarningBackground: Color {
        switch Warp.Config.warpTheme {
        case .finn:
            return Color.dynamicColor(defaultColor: FinnColors.yellow100, darkModeColor: FinnColors.yellow700)
        case .tori:
            return Color.dynamicColor(defaultColor: ToriColors.yellow100, darkModeColor: ToriColors.yellow700)
        }
    }
    var badgeNegativeBackground: Color {
        switch Warp.Config.warpTheme {
        case .finn:
            return Color.dynamicColor(defaultColor: FinnColors.red100, darkModeColor: FinnColors.red700)
        case .tori:
            return Color.dynamicColor(defaultColor: ToriColors.red100, darkModeColor: ToriColors.red700)
        }
    }
    var badgeDisabledBackground: Color { token.backgroundDisabled }
    var badgePriceBackground: Color {
        switch Warp.Config.warpTheme {
        case .finn:
            return Color.dynamicColor(defaultColor: FinnColors.black.opacity(0.7), darkModeColor: FinnColors.black.opacity(0.7))
        case .tori:
            return Color.dynamicColor(defaultColor: ToriColors.black.opacity(0.7), darkModeColor: ToriColors.black.opacity(0.7))
        }
    }
    var badgeNotificationBackground: Color { token.backgroundNotification }
    var badgeSponsoredBackground: Color {
        switch Warp.Config.warpTheme {
        case .finn:
            return Color.dynamicColor(defaultColor: FinnColors.aqua200, darkModeColor: FinnColors.aqua600)
        case .tori:
            return Color.dynamicColor(defaultColor: ToriColors.blue200, darkModeColor: ToriColors.blue600)
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
    var buttonPrimaryBackground: Color {
        switch Warp.Config.warpTheme {
        case .finn:
            return token.backgroundPrimary
        case .tori:
            return Color.dynamicColor(defaultColor: ToriColors.watermelon600, darkModeColor: ToriColors.watermelon600)
        }
    }
    var buttonPrimaryBackgroundHover: Color {
        switch Warp.Config.warpTheme {
        case .finn:
            return token.backgroundPrimaryHover
        case .tori:
            return Color.dynamicColor(defaultColor: ToriColors.watermelon700, darkModeColor: ToriColors.watermelon700)
        }
    }
    var buttonPrimaryBackgroundActive: Color {
        switch Warp.Config.warpTheme {
        case .finn:
            return token.backgroundPrimaryActive
        case .tori:
            return Color.dynamicColor(defaultColor: ToriColors.watermelon800, darkModeColor: ToriColors.watermelon800)
        }
    }
    var buttonPrimaryBackgroundDisabled: Color { token.backgroundDisabled }
    var buttonPrimaryBorder: Color {
        switch Warp.Config.warpTheme {
        case .finn:
            return token.borderPrimary
        case .tori:
            return Color.dynamicColor(defaultColor: ToriColors.watermelon600, darkModeColor: ToriColors.watermelon600)
        }
    }
    var buttonPrimaryBorderHover: Color {
        switch Warp.Config.warpTheme {
        case .finn:
            return token.borderPrimaryHover
        case .tori:
            return Color.dynamicColor(defaultColor: ToriColors.watermelon700, darkModeColor: ToriColors.watermelon700)
        }
    }
    var buttonPrimaryBorderActive: Color {
        switch Warp.Config.warpTheme {
        case .finn:
            return token.borderPrimaryActive
        case .tori:
            return Color.dynamicColor(defaultColor: ToriColors.watermelon800, darkModeColor: ToriColors.watermelon800)
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
        switch Warp.Config.warpTheme {
        case .finn:
            return Color.dynamicColor(defaultColor: FinnColors.blue300.opacity(0.3), darkModeColor: FinnColors.blue300.opacity(0.3))
        case .tori:
            return Color.dynamicColor(defaultColor: ToriColors.gray300.opacity(0.3), darkModeColor: ToriColors.gray300.opacity(0.3))
        }
    }
    var buttonPillBackgroundActive: Color {
        switch Warp.Config.warpTheme {
        case .finn:
            return Color.dynamicColor(defaultColor: FinnColors.blue400.opacity(0.3), darkModeColor: FinnColors.blue400.opacity(0.3))
        case .tori:
            return Color.dynamicColor(defaultColor: ToriColors.gray400.opacity(0.3), darkModeColor: ToriColors.gray400.opacity(0.3))
        }
    }
    var buttonPillIcon: Color { token.icon }
    var buttonPillIconHover: Color { token.iconHover }
    var buttonPillIconActive: Color { token.iconActive }
    var buttonPillIconSelected: Color { token.iconSelected }
    var buttonPillOverlayIcon: Color { token.iconInverted }
    var buttonPillOverlayIconHover: Color { token.iconInvertedHover }
    var buttonPillOverlayIconActive: Color { token.iconInvertedActive }
    var buttonLoadingText: Color { token.text }
    var buttonLoadingBackground: Color { token.backgroundSubtle }
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
    var buttonUtilityQuietBackgroundHover: Color { token.backgroundSubtleHover }
    var buttonUtilityQuietBackgroundActive: Color { token.backgroundSubtleActive }
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
    
    /// Callout
    var calloutText: Color { token.text }
    var calloutBackground: Color {
        switch Warp.Config.warpTheme {
        case .finn:
            return Color.dynamicColor(defaultColor: FinnColors.green100, darkModeColor: FinnColors.green800)
        case .tori:
            return Color.dynamicColor(defaultColor: ToriColors.blue100, darkModeColor: ToriColors.blue800)
        }
    }
    var calloutBorder: Color {
        switch Warp.Config.warpTheme {
        case .finn:
            return Color.dynamicColor(defaultColor: FinnColors.green400, darkModeColor: FinnColors.green600)
        case .tori:
            return Color.dynamicColor(defaultColor: ToriColors.blue400, darkModeColor: ToriColors.blue600)
        }
    }
    
    /// Card
    //    var shadowCard: Color { token.shadowSmall }
    //    var shadowCardHover: Color { token.shadowMedium }
    var cardBackground: Color { token.background }
    var cardBackgroundHover: Color { token.backgroundSubtleHover }
    var cardBackgroundActive: Color { token.backgroundActive }
    var cardBackgroundSelected: Color { token.backgroundSelected }
    var cardBackgroundSelectedHover: Color { token.backgroundSelectedHover }
    var cardBorder: Color { .clear }
    var cardBorderHover: Color { .clear }
    var cardBorderActive: Color { .clear }
    var cardBorderSelected: Color { token.borderSelected }
    var cardFlatBackground: Color { token.background }
    var cardFlatBackgroundHover: Color { token.backgroundSubtleHover }
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
    var checkboxBackgroundHover: Color { token.backgroundSubtle }
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
    var inputBorderActive: Color { token.borderSelected }
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
    var modalBackground: Color { token.background }
    //    var shadowModal: Color { token.shadowMedium }
    
    /// Nav Bar
    var navbarIconSelected: Color {
        switch Warp.Config.warpTheme {
        case .finn:
            return Color.dynamicColor(defaultColor: token.iconSelected, darkModeColor: FinnColors.blue500)
        case .tori:
            return token.iconSecondary
        }
    }
    var navbarBorderSelected: Color {
        switch Warp.Config.warpTheme {
        case .finn:
            return Color.dynamicColor(defaultColor: token.borderSelected, darkModeColor: FinnColors.blue500)
        case .tori:
            return Color.dynamicColor(defaultColor: token.borderSecondary, darkModeColor: token.iconSecondary)
        }
    }
    
    /// Page indicator
    var pageIndicatorBackground: Color { token.iconDisabled }
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
        switch Warp.Config.warpTheme {
        case .finn:
            return Color.dynamicColor(defaultColor: FinnColors.gray200, darkModeColor: FinnColors.gray600)
        case .tori:
            return Color.dynamicColor(defaultColor: ToriColors.gray200, darkModeColor: ToriColors.gray600)
        }
    }
    var pillSuggestionBackgroundHover: Color {
        switch Warp.Config.warpTheme {
        case .finn:
            return Color.dynamicColor(defaultColor: FinnColors.gray300, darkModeColor: FinnColors.gray700)
        case .tori:
            return Color.dynamicColor(defaultColor: ToriColors.gray300, darkModeColor: ToriColors.gray700)
        }
    }
    var pillSuggestionBackgroundActive: Color {
        switch Warp.Config.warpTheme {
        case .finn:
            return Color.dynamicColor(defaultColor: FinnColors.gray400, darkModeColor: FinnColors.gray800)
        case .tori:
            return Color.dynamicColor(defaultColor: ToriColors.gray400, darkModeColor: ToriColors.gray800)
        }
    }
    var pillSuggestionIcon: Color { token.icon }
    
    /// Popover
    var popoverTitleText: Color { token.text }
    var popoverParagraphText: Color { token.text }
    var popoverBackground: Color { token.background }
    //    var shadowPopover
    
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
    var sliderTrackBackground: Color { token.backgroundDisabled }
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
        switch Warp.Config.warpTheme {
        case .finn:
            return Color.dynamicColor(defaultColor: FinnColors.gray300, darkModeColor: FinnColors.gray300)
        case .tori:
            return Color.dynamicColor(defaultColor: ToriColors.gray300, darkModeColor: ToriColors.gray300)
        }
    }
    var switchTrackBackgroundHover : Color {
        switch Warp.Config.warpTheme {
        case .finn:
            return Color.dynamicColor(defaultColor: FinnColors.gray400, darkModeColor: FinnColors.gray400)
        case .tori:
            return Color.dynamicColor(defaultColor: ToriColors.gray400, darkModeColor: ToriColors.gray400)
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
    var tooltipText: Color { token.textInverted }
    var tooltipBackground: Color {
        switch Warp.Config.warpTheme {
        case .finn:
            return Color.dynamicColor(defaultColor: token.backgroundInverted , darkModeColor: token.backgroundSubtle)
        case .tori:
            return token.backgroundInverted
        }
    }
    //  var shadowTooltip: Color { token.shadowM }
}
