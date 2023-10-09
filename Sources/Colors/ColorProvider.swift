import SwiftUI

/// Source: https://docs.google.com/spreadsheets/d/1Q-Tr_dwJVfxgh3527IFjXQKqtnPPM42QeIr-M6q-zu8/edit#gid=1588196525
public struct ColorProvider {
    let token: TokenProvider
//    Alert
//    alertInfoText    text
//    alertInfoBackground    backgroundInfoSubtle
//    alertInfoBorder    borderInfo
//    alertInfoSubtleBorder    borderInfoSubtle
//    alertInfoIcon    iconInfo
//    alertPositiveText    text
//    alertPositiveBackground    backgroundPositiveSubtle
//    alertPositiveBorder    borderPositive
//    alertPositiveIcon    iconPositive
//    alertPositiveSubtleBorder    borderPositiveSubtle
//    alertNegativeText    text
//    alertNegativeBackground    backgroundNegativeSubtle
//    alertNegativeBorder    borderNegative
//    alertNegativeSubtleBorder    borderNegativeSubtle
//    alertNegativeIcon    iconNegative
//    alert-warningText    text
//    alert-warningBackground    background-warningSubtle
//    alert-warningBorder    border-warning
//    alert-warningSubtleBorder    border-warningSubtle
//    alert-warningIcon    icon-warning
//            
//    Avatar
//    avatarBackground    backgroundSubtle
//    avatarIcon    iconSubtle
//            
//    Badge
//    badgeNeutralText    text
//    badgeInfoText    text
//    badgePositiveText    text
//    badge-warningText    text
//    badgeNegativeText    text
//    badgeDisabledText    text
//    badgePriceText    textInverted
//    badgeNotificationText    textNotification
//    badgeNeutralBackground    backgroundSubtle    Custom
//    badgeInfoBackground    backgroundInfoSubtle
//    badgePositiveBackground    backgroundPositiveSubtle
//    badge-warningBackground    background-warningSubtle
//    badgeNegativeBackground    backgroundNegativeSubtle
//    badgeDisabledBackground    backgroundDisabled
//    badgePriceBackground    backgroundInverted    Opacity
//    badgeNotificationBackground    backgroundNotification
//    Missing "Highlight" aka Sponsored
//            
//    Box
//    boxNeutralText    text
//    boxBorderedText    text
//    boxInfoText    text
//    boxNeutralBackground    backgroundSubtle
//    boxBorderedBackground    background
//    boxInfoBackground    backgroundInfoSubtle
//    boxBorderedBorder    border
//    boxNeutralBackgroundHover    backgroundSubtleHover
//    boxBorderedBackgroundHover    backgroundHover
//    boxInfoBackgroundHover    backgroundInfoSubtleHover
//    boxBorderedBorderHover    borderHover
//            
//    Breadcrumbs
//    breadcrumbsText    text
//    breadcrumbsLinkText    textLink
//    breadcrumbsIcon    icon
//            
//    Broadcast
//    broadcastText    text
//    broadcastBackground    background-warningSubtle
//    broadcastBorder    border-warningSubtle
//    broadcastIcon    icon-warning
            
    /// Button        primary button in Tori should use watermelon instead of the semantic token
    var buttonPrimaryText: Color { token.textInverted }
    var buttonPrimaryTextDisabled: Color { token.textInverted }
    var buttonPrimaryBackground: Color { token.backgroundButtonPrimary }
    var buttonPrimaryBackgroundHover: Color { token.backgroundPrimaryHover }
    var buttonPrimaryBackgroundActive: Color { token.backgroundPrimaryActive }
    var buttonPrimaryBackgroundDisabled: Color { token.backgroundDisabled }
    var buttonPrimaryBorder: Color { token.borderButtonPrimary }
    var buttonPrimaryBorderHover: Color { token.borderPrimaryHover }
    var buttonPrimaryBorderActive: Color { token.borderPrimaryActive }
    var buttonPrimaryBorderDisabled: Color { token.borderDisabled }
    var buttonPrimaryIcon: Color { token.iconInverted }
    var buttonSecondaryText: Color { token.textLink }
    var buttonSecondaryTextDisabled: Color { token.textDisabled }
    var buttonSecondaryBackground: Color { token.background }
    var buttonSecondaryBackgroundHover: Color { token.backgroundHover }
    var buttonSecondaryBackgroundActive: Color { token.backgroundActive }
    var buttonSecondaryBackgroundDisabled: Color { token.backgroundDisabled }
    var buttonSecondaryBorder: Color { token.borderButtonSecondary }
    var buttonSecondaryBorderHover: Color { token.borderHover }
    var buttonSecondaryBorderActive: Color { token.borderActive }
    var buttonSecondaryIcon: Color { token.iconPrimary }
    var buttonQuietText: Color { token.textLink }
    var buttonQuietBackground: Color { .clear }
    var buttonQuietBackgroundHover: Color { token.backgroundHover } //    Change to gray background
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
    var buttonDisabledQuietBorder: Color { token.borderDisabled } //   Set to a semantic background token on purpose?
    var buttonPillBackground: Color { .clear }
    var buttonPillBackgroundHover: Color { .clear } //    Could we find something to use as default value here?
    //var buttonPillBackgroundActive
    var buttonPillIcon: Color { token.icon }
    var buttonPillIconHover: Color { token.iconHover }
    var buttonPillIconActive: Color { token.iconActive }
    var buttonPillOverlayIcon: Color { token.iconInverted }
    var buttonPillOverlayIconHover: Color { token.iconInvertedHover }
    var buttonPillOverlayIconActive: Color { token.iconInvertedActive }
    var buttonLoadingText: Color { token.textSubtle }
    var buttonLoadingBackground: Color { token.backgroundSubtle } //    Custom striped animation with a mix of brand grays 900 + 700
    var buttonLoadingIcon: Color { token.icon } //    Used gray-500 in Figma to match text
    
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
    var buttonUtilityOverlayBackground: Color { .gray.opacity(0.3) } // Not on documents
    var buttonUtilityQuietBackgroundHover: Color { token.backgroundSubtleHover }
    var buttonUtilityQuietBackgroundActive: Color { token.backgroundSubtleActive } //    There are no "activeHover" tokens anymore?
    var buttonUtilityQuietBorder: Color { .clear }
    var buttonUtilityQuietBorderHover: Color { .clear }
    var buttonUtilityQuietBorderActive: Color { .clear }
            
//    Button group        Button group has primary and utility sub groups in code?
//    button-groupText    textLink    This is the current FINN segmented control
//    button-groupTextSelected    textInverted    changed from active to selected
//    button-groupBackground    background
//    button-groupBackgroundHover    backgroundHover
//    button-groupBackgroundActive    backgroundActive
//    button-groupBackgroundSelected    backgroundPrimary
//    button-groupBorder    border
//    button-groupBorderSelected    borderPrimary
//            
//    Callout
//    calloutText    text
//    calloutBackground    custom    Custom
//    calloutBorder    custom    Custom
//            
//    Card
//    elevationCardShadow    shadowSmall    All of these are now called shadowComponentname
//    elevationCardHoverShadow    shadow-medium
//    cardBackground    background    Not in code?
//    cardBackgroundHover    backgroundSubtleHover
//    cardBackgroundActive    backgroundActive
//    cardBackgroundActiveHover        This used in code as selectedHover with value backgroundPrimarySubtleHover
//    cardBackgroundSelected    backgroundPrimarySubtle
//    cardBorder    n/a transparent
//    cardBorderHover    n/a transparent
//    cardBorderActive    n/a transparent
//    cardBorderActiveHover        This used in code as selectedHover with value borderSelectedHover
//    cardBorderSelected    borderSelected
//    cardFlatBackground    background
//    cardFlatBackgroundHover    backgroundSubtleHover
//    cardFlatBackgroundActive    backgroundActive
//    cardFlatBackgroundActiveHover    backgroundActiveHover    This used in code as selectedHover with value borderSelectedHover
//    cardFlatBackgroundSelected    backgroundSelected
//    cardFlatBorder    border
//    cardFlatBorderHover    borderHover
//    cardFlatBorderActive    borderActive
//    cardFlatBorderActiveHover
//    cardFlatBorderSelected    backgroundPrimary    Should these be background tokens?
//    cardFlatBorderSelectedHover    backgroundPrimarySubtleHover
//    cardFlatBorderSelectedActive    backgroundPrimarySubtleActive
//            
//            
//    Checkbox
//    checkboxBackground    background    Not used in code, but missing checkboxBackgroundDisabled here
//    checkboxBackgroundHover    backgroundSubtle
//    checkboxBackgroundActive    backgroundActive    This should be selected, right?
//    checkboxBackgroundActiveHover        We need selectedHover
//            
//    checkboxBorder    border
//    checkboxBorderHover    borderPrimary
//    checkboxBorderSelected    borderPrimary
//    checkboxBorderSelectedHover    borderPrimaryHover
//            
//    checkboxNegativeBackground    background
//    checkboxNegativeBackgroundHover    backgroundNegativeSubtleHover
//    checkboxNegativeBackgroundSelected    backgroundNegative    Changed active to selected
//    checkboxNegativeBackgroundActiveHover    backgroundNegativeActiveHover
//    checkboxNegativeBorder    borderNegative
//    checkboxNegativeBorderHover    borderNegativeHover
//    checkboxNegativeBorderActive    borderNegativeActive
//    checkboxNegativeBorderActiveHover    borderNegativeActiveHover
//            
//    checkboxIcon    iconInverted
//            
//    Datepicker
//    datepickerButtonBackground    background
//    datepickerButtonBackgroundHover    backgroundHover
//    datepickerButtonBackgroundActive    backgroundPrimary
//    datepickerTrackBackgroundActive    backgroundPrimarySubtle
//    datepickerBackground    background
//    datepickerBorder    border
//            
//    Expandable
//    expandableTitleText    text
//    expandableParagraphText    text
//    expandableBackground    backgroundSubtle
//    expandableBackgroundHover    backgroundSubtleHover
//    expandableIcon    icon
//            
//    Footer
//            
//    Header
//            
//    Help text
//    helptextText    textSubtle
//    helptextNegativeText    textNegative
//    helptextPositiveText    textPositive
//            
//    Image placeholder
//    imagePlaceholderBackground    backgroundSubtle
//    imagePlaceholderIcon    iconDisabled
            
    /// Input (includes text area)
    var inputTextHint: Color { token.textPlaceholder } //    Renamed to inputTextPlaceholder in code
    var inputTextFilled: Color { token.text }
    var inputTextDisabled: Color { token.textDisabled } //    textLinkDisabled renamed
    var inputTextNegative: Color { token.textNegative }
    var inputTextReadOnly: Color { token.text }
    var inputBackground: Color { token.background }
    var inputBackgroundDisabled: Color { token.backgroundDisabled } //   Should this be a text token? https://schChat.slack.com/archives/C04EK4XHUJJ/p1688979135628889?thread_ts=1688975572.125649&cid=C04EK4XHUJJ
    var inputBorder: Color { token.border }
    var inputBorderHover: Color { token.borderHover }
    var inputBorderActive: Color { token.borderSelected } //   Not needed Used in code: sBorderSelected
    var inputBorderFilled: Color { token.border }
    var inputBorderDisabled: Color { token.borderDisabled }
    var inputBorderNegative: Color { token.borderNegative }
    var inputIcon: Color { token.icon }
    var inputCaret: Color { token.icon }
            
//    Label
//    labelText    text
//    labelOptionalText    text
//    labelIcon    icon
//    labelTextNegative    textNegative
//    labelTextDisabled    textDisabled    Not in code
//            
//    List
//    listText    text
//    listBulletedIcon    text
//    listNumberedIcon    text
//    listCheckedIcon    iconPrimary
//    Should add line height tokens to lists
//            
//    Modal        Code also has modalBackdropBackground: black
//    modalTextTitle    text
//    modalTextParagraph    text
//    modalBackground    background
//    elevation-modalShadow    shadow-medium
//            
//            
//    Page indicator
//    pageIndicatorBackground        Custom colour
//    pageIndicatorBackgroundHover        Custom colour
//    pageIndicatorBackground-Selected    backgroundPrimary    Need semantic "selected/selectedSubtle" tokens
//            
//    Pagination
//    paginationText    textLink
//    paginationTextActive    textInverted
//    paginationBackgroundHover    backgroundPrimarySubtleHover
//    paginationBackgroundActive    backgroundPrimarySubtleActive
//    paginationIcon    icon
//            
//    Pill
//    pillFilterText    textInverted
//    pillFilterBackground    backgroundPrimary
//    pillFilterBackgroundHover    backgroundPrimaryHover
//    pillFilterBackgroundActive    backgroundPrimaryActive
//    pillFilterIcon    iconInverted
//    pillSuggestionText    text
//    pillSuggestionBackground    backgroundSubtle    Custom colour
//    pillSuggestionBackgroundHover    backgroundSubtleHover    Custom colour
//    pillSuggestionBackgroundActive    backgroundSubtleActive    Custom colour
//    pillSuggestionIcon    icon    Do we need an extra darker semantic icon color? To match text colour
//            
//    Popover
//    popoverTitleText    text
//    popoverParagraphText    text
//    popoverBackground    background
//    elevationPopoverShadow
//            
//    Radio        Code has radioBackgroundDisabled which is set to gray-200
//    radioBackground    background    Not in code
//    radioBackgroundHover    backgroundPrimarySubtle
//    radioBorder    border    Custom colour
//    radioBorderHover    borderPrimary
//    radioBorderSelected    borderPrimarySelected    Changed from active to selected
//    radioBorderSelectedHover    borderPrimarySelectedHover    Changed from active to selected
//    radioBorderDisabled    borderDisabled    There should also be a radioSelectedDisabled
//    radioNegativeBackground    background
//    radioNegativeBackgroundHover    backgroundNegativeSubtle
//    radioNegativeBorder    borderNegative
//    radioNegativeBorderHover    borderNegativeHover
//    radioNegativeBorderActive    borderNegativeActive    radioNegativeBorderSelected red-600
//    radioNegativeBorderActiveHover    borderNegativeActiveHover    radioNegativeBorderSelectedHover red-700
//            
//            
//            
//    Select
//    selectText    text
//    selectTextHover    textHover
//    selectTextActive    text
//    selectTextDisabled    textDisabled
//    selectBackground    background
//    selectBackgroundDisabled    backgroundDisabled    https://schChat.slack.com/archives/C04EK4XHUJJ/p1688979135628889?thread_ts=1688975572.125649&cid=C04EK4XHUJJ
//    selectBorder    border
//    selectBorderHover    borderHover
//    selectBorderActive    borderActive
//    selectBorderDisabled    borderDisabled
//    selectBorderNegative    borderNegative
//    selectIcon    icon
//            
//    Slider
//    sliderHandleBackground    backgroundPrimary
//    sliderHandleBackgroundHover    backgroundPrimaryHover
//    sliderHandleBackgroundActive    backgroundPrimaryActive
//    sliderHandleBorder    borderPrimary
//    sliderHandleBorderHover    borderPrimaryHover
//    sliderHandleBorderActive    borderPrimaryActive
//    sliderTrackBackground    backgroundPrimarySubtle    Custom colour
//    sliderTrackBackgroundActive    backgroundPrimary
//    elevationSliderHandleShadow    shadowS
//    Temporary: Hard coded shadow for hover and active states.    n/a
//    sliderHandleBackgroundDisabled    backgroundDisabled
//    sliderTrackBackgroundDisabled    backgroundDisabled
//            
//    Spinner
//    spinnerBorder    border    Custom colour
//    spinnerBorderTop    borderPrimary    Custom colour
//            
//    Star rating
//    starRatingIcon    iconPrimary
//            
//    Step indicator
//    stepIndicatorHandleBackground    background
//    stepIndicatorHandleBackgroundActive    backgroundPrimary
//    stepIndicatorTrackBackground    border
//    stepIndicatorTrackBackgroundActive    backgroundPrimary
//    stepIndicatorHandleBorder    border
//    stepIndicatorHandleBorderActive    borderPrimary
//    stepIndicatorHandleIcon    iconInverted
//            
//    Switch (Toggle)
//    switchTrackBackground    backgroundSubtle    Custom?
//    switchTrackBackgroundHover    backgroundSubtleHover    Custom?
//    switchTrackBackgroundSelected    backgroundPrimary
//    switchTrackBackgroundSelectedHover    backgroundPrimaryHover
//    switchHandleBackground    background
//    switchTrackBackgroundDisabled    backgroundDisabled    Custom colour
//    switchHandleBackgroundDisabled    backgroundDisabled
//            
//    Tabs
//    tabsBorder    transparent
//    tabsBorderHover    borderPrimary
//    tabsBorderActive    borderPrimaryHover
//    tabsBorderSelected    borderPrimarySelected
//    tabsText    textSubtle
//    tabsTextHover    textLink
//    tabsTextSelected    textLink
//    tabsIcon    icon
//    tabsIconHover    iconPrimary
//    tabsIconSelected    iconSelected
//            
//    Toast
//    toastPositiveText    text
//    toastPositiveBackground    backgroundPositiveSubtle
//    toastPositiveBorder    borderPositive
//    toastPositiveSubtleBorder    borderPositiveSubtle
//    toastPositiveIcon    iconPositive
//    toast-warningText    text
//    colortoast-warningBackground    background-warningSubtle
//    toast-warningBorder    border-warning
//    toast-warningSubtleBorder    border-warningSubtle
//    toast-warningIcon    icon-warning
//    toastNegativeText    text
//    toastNegativeBackground    backgroundNegativeSubtle
//    toastNegativeBorder    borderNegative
//    toastNegativeSubtleBorder    borderNegativeSubtle
//    toastNegativeIcon    iconNegative
//            
//    Tooltip
//    tooltipText    textInverted
//    tooltipBackground    backgroundInverted
//    shadowTooltip    shadow-m
}
