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
    public var buttonPrimaryText: Color { token.textInverted }
    public var buttonPrimaryTextDisabled: Color { token.textInverted }
    public var buttonPrimaryBackground: Color { token.backgroundButtonPrimary }
    public var buttonPrimaryBackgroundHover: Color { token.backgroundPrimaryHover }
    public var buttonPrimaryBackgroundActive: Color { token.backgroundPrimaryActive }
    public var buttonPrimaryBackgroundDisabled: Color { token.backgroundDisabled }
    public var buttonPrimaryBorder: Color { token.borderButtonPrimary }
    public var buttonPrimaryBorderHover: Color { token.borderPrimaryHover }
    public var buttonPrimaryBorderActive: Color { token.borderPrimaryActive }
    public var buttonPrimaryBorderDisabled: Color { token.borderDisabled }
    public var buttonPrimaryIcon: Color { token.iconInverted }
    public var buttonSecondaryText: Color { token.textLink }
    public var buttonSecondaryTextDisabled: Color { token.textDisabled }
    public var buttonSecondaryBackground: Color { token.background }
    public var buttonSecondaryBackgroundHover: Color { token.backgroundHover }
    public var buttonSecondaryBackgroundActive: Color { token.backgroundActive }
    public var buttonSecondaryBackgroundDisabled: Color { token.backgroundDisabled }
    public var buttonSecondaryBorder: Color { token.borderButtonSecondary }
    public var buttonSecondaryBorderHover: Color { token.borderHover }
    public var buttonSecondaryBorderActive: Color { token.borderActive }
    public var buttonSecondaryIcon: Color { token.iconPrimary }
    public var buttonQuietText: Color { token.textLink }
    public var buttonQuietBackground: Color { .clear }
    public var buttonQuietBackgroundHover: Color { token.backgroundHover } //    Change to gray background
    public var buttonQuietBackgroundActive: Color { token.backgroundActive }
    public var buttonQuietIcon: Color { token.iconPrimary }
    public var buttonNegativeText: Color { token.textInverted }
    public var buttonNegativeBackground: Color { token.backgroundNegative }
    public var buttonNegativeBackgroundHover: Color { token.backgroundNegativeHover }
    public var buttonNegativeBackgroundActive: Color { token.backgroundNegativeActive }
    public var buttonNegativeBorder: Color { token.borderNegative }
    public var buttonNegativeBorderHover: Color { token.borderNegativeHover }
    public var buttonNegativeBorderActive: Color { token.borderNegativeActive }
    public var buttonNegativeIcon: Color { token.iconInverted }
    public var buttonNegativeQuietText: Color { token.textNegative }
    public var buttonNegativeQuietBackground: Color { .clear }
    public var buttonNegativeQuietBackgroundHover: Color { token.backgroundNegativeSubtleHover }
    public var buttonNegativeQuietBackgroundActive: Color { token.backgroundNegativeSubtleActive }
    public var buttonNegativeQuietBorder: Color { .clear }
    public var buttonNegativeQuietBorderHover: Color { .clear }
    public var buttonNegativeQuietBorderActive: Color { .clear }
    public var buttonNegativeQuietIcon: Color { token.iconNegative }
    public var buttonDisabledText: Color { token.textInverted }
    public var buttonDisabledBackground: Color { token.backgroundDisabled }
    public var buttonDisabledQuietText: Color { token.textDisabled }
    public var buttonDisabledQuietBorder: Color { token.borderDisabled } //   Set to a semantic background token on purpose?
    public var buttonPillBackground: Color { .clear }
    public var buttonPillBackgroundHover: Color { .clear } //    Could we find something to use as default value here?
    //var buttonPillBackgroundActive
    public var buttonPillIcon: Color { token.icon }
    public var buttonPillIconHover: Color { token.iconHover }
    public var buttonPillIconActive: Color { token.iconActive }
    public var buttonPillOverlayIcon: Color { token.iconInverted }
    public var buttonPillOverlayIconHover: Color { token.iconInvertedHover }
    public var buttonPillOverlayIconActive: Color { token.iconInvertedActive }
    public var buttonLoadingText: Color { token.textSubtle }
    public var buttonLoadingBackground: Color { token.backgroundSubtle } //    Custom striped animation with a mix of brand grays 900 + 700
    public var buttonLoadingIcon: Color { token.icon } //    Used gray-500 in Figma to match text
    
    public var buttonUtilityText: Color { token.text }
    public var buttonUtilityTextDisabled: Color { token.textDisabled }
    public var buttonUtilityBackground: Color { token.background }
    public var buttonUtilityBackgroundHover: Color { token.backgroundHover }
    public var buttonUtilityBackgroundActive: Color { token.backgroundActive }
    public var buttonUtilityBackgroundDisabled: Color { token.backgroundDisabled }
    public var buttonUtilityBorder: Color { token.border }
    public var buttonUtilityBorderHover: Color { token.borderHover }
    public var buttonUtilityBorderActive: Color { token.borderActive }
    public var buttonUtilityQuietText: Color { token.text }
    public var buttonUtilityQuietBackground: Color { .clear }
    public var buttonUtilityOverlayBackground: Color { .gray.opacity(0.3) } // Not on documents
    public var buttonUtilityQuietBackgroundHover: Color { token.backgroundSubtleHover }
    public var buttonUtilityQuietBackgroundActive: Color { token.backgroundSubtleActive } //    There are no "activeHover" tokens anymore?
    public var buttonUtilityQuietBorder: Color { .clear }
    public var buttonUtilityQuietBorderHover: Color { .clear }
    public var buttonUtilityQuietBorderActive: Color { .clear }
            
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
    public var inputTextHint: Color { token.textPlaceholder } //    Renamed to inputTextPlaceholder in code
    public var inputTextFilled: Color { token.text }
    public var inputTextDisabled: Color { token.textDisabled } //    textLinkDisabled renamed
    public var inputTextNegative: Color { token.textNegative }
    public var inputTextReadOnly: Color { token.text }
    public var inputBackground: Color { token.background }
    public var inputBackgroundDisabled: Color { token.backgroundDisabled } //   Should this be a text token? https://schChat.slack.com/archives/C04EK4XHUJJ/p1688979135628889?thread_ts=1688975572.125649&cid=C04EK4XHUJJ
    public var inputBorder: Color { token.border }
    public var inputBorderHover: Color { token.borderHover }
    public var inputBorderActive: Color { token.borderSelected } //   Not needed Used in code: sBorderSelected
    public var inputBorderFilled: Color { token.border }
    public var inputBorderDisabled: Color { token.borderDisabled }
    public var inputBorderNegative: Color { token.borderNegative }
    public var inputIcon: Color { token.icon }
    public var inputCaret: Color { token.icon }
            
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
