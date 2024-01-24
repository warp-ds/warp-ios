import SwiftUI
import Warp

struct BrandTokensView: View {
    private let tokenProvider = Warp.Config.tokenProvider

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack (alignment: .leading) {
                /// Background
                createView(for: "background",
                           colors: [tokenProvider.background])
                createView(for: "backgroundHover",
                           colors: [tokenProvider.backgroundHover])
                createView(for: "backgroundActive",
                           colors: [tokenProvider.backgroundActive])
                createView(for: "backgroundDisabled",
                           colors: [tokenProvider.backgroundDisabled])
                createView(for: "backgroundDisabledSubtle",
                           colors: [tokenProvider.backgroundDisabledSubtle])
                createView(for: "backgroundSubtle",
                           colors: [tokenProvider.backgroundSubtle])
                createView(for: "backgroundSubtleHover",
                           colors: [tokenProvider.backgroundSubtleHover])
                createView(for: "backgroundSubtleActive",
                           colors: [tokenProvider.backgroundSubtleActive])
                createView(for: "backgroundSelected",
                           colors: [tokenProvider.backgroundSelected])
                createView(for: "backgroundSelectedHover",
                           colors: [tokenProvider.backgroundSelectedHover])
                createView(for: "backgroundSelectedActive",
                           colors: [tokenProvider.backgroundSelectedActive])
                
                createView(for: "backgroundInverted",
                           colors: [tokenProvider.backgroundInverted])
                
                createView(for: "backgroundPrimary",
                           colors: [tokenProvider.backgroundPrimary])
                createView(for: "backgroundPrimaryHover",
                           colors: [tokenProvider.backgroundPrimaryHover])
                createView(for: "backgroundPrimaryActive",
                           colors: [tokenProvider.backgroundPrimaryActive])
                createView(for: "backgroundPrimarySubtle",
                           colors: [tokenProvider.backgroundPrimarySubtle])
                createView(for: "backgroundPrimarySubtleHover",
                           colors: [tokenProvider.backgroundPrimarySubtleHover])
                createView(for: "backgroundPrimarySubtleActive",
                           colors: [tokenProvider.backgroundPrimarySubtleActive])
                
                createView(for: "backgroundSecondary",
                           colors: [tokenProvider.backgroundSecondary])
                createView(for: "backgroundSecondaryHover",
                           colors: [tokenProvider.backgroundSecondaryHover])
                createView(for: "backgroundSecondaryActive",
                           colors: [tokenProvider.backgroundSecondaryActive])
                
                createView(for: "backgroundPositive",
                           colors: [tokenProvider.backgroundPositive])
                createView(for: "backgroundPositiveHover",
                           colors: [tokenProvider.backgroundPositiveHover])
                createView(for: "backgroundPositiveActive",
                           colors: [tokenProvider.backgroundPositiveActive])
                createView(for: "backgroundPositiveSubtle",
                           colors: [tokenProvider.backgroundPositiveSubtle])
                createView(for: "backgroundPositiveSubtleHover",
                           colors: [tokenProvider.backgroundPositiveSubtleHover])
                createView(for: "backgroundPositiveSubtleActive",
                           colors: [tokenProvider.backgroundPositiveSubtleActive])
                createView(for: "backgroundPositiveSelected",
                           colors: [tokenProvider.backgroundPositiveSelected])
                createView(for: "backgroundPositiveSelectedHover",
                           colors: [tokenProvider.backgroundPositiveSelectedHover])
                createView(for: "backgroundPositiveSelectedActive",
                           colors: [tokenProvider.backgroundPositiveSelectedActive])
                
                createView(for: "backgroundNegative",
                           colors: [tokenProvider.backgroundNegative])
                createView(for: "backgroundNegativeHover",
                           colors: [tokenProvider.backgroundNegativeHover])
                createView(for: "backgroundNegativeActive",
                           colors: [tokenProvider.backgroundNegativeActive])
                createView(for: "backgroundNegativeSubtle",
                           colors: [tokenProvider.backgroundNegativeSubtle])
                createView(for: "backgroundNegativeSubtleHover",
                           colors: [tokenProvider.backgroundNegativeSubtleHover])
                createView(for: "backgroundNegativeSubtleActive",
                           colors: [tokenProvider.backgroundNegativeSubtleActive])
                createView(for: "backgroundNegativeSelected",
                           colors: [tokenProvider.backgroundNegativeSelected])
                createView(for: "backgroundNegativeSelectedHover",
                           colors: [tokenProvider.backgroundNegativeSelectedHover])
                createView(for: "backgroundNegativeSelectedActive",
                           colors: [tokenProvider.backgroundNegativeSelectedActive])
                
                createView(for: "backgroundWarning",
                           colors: [tokenProvider.backgroundWarning])
                createView(for: "backgroundWarningHover",
                           colors: [tokenProvider.backgroundWarningHover])
                createView(for: "backgroundWarningActive",
                           colors: [tokenProvider.backgroundWarningActive])
                createView(for: "backgroundWarningSubtle",
                           colors: [tokenProvider.backgroundWarningSubtle])
                createView(for: "backgroundWarningSubtleHover",
                           colors: [tokenProvider.backgroundWarningSubtleHover])
                createView(for: "backgroundWarningSubtleActive",
                           colors: [tokenProvider.backgroundWarningSubtleActive])
                createView(for: "backgroundWarningSelected",
                           colors: [tokenProvider.backgroundWarningSelected])
                createView(for: "backgroundWarningSelectedHover",
                           colors: [tokenProvider.backgroundWarningSelectedHover])
                createView(for: "backgroundWarningSelectedActive",
                           colors: [tokenProvider.backgroundWarningSelectedActive])
                
                createView(for: "backgroundInfo",
                           colors: [tokenProvider.backgroundInfo])
                createView(for: "backgroundInfoHover",
                           colors: [tokenProvider.backgroundInfoHover])
                createView(for: "backgroundInfoActive",
                           colors: [tokenProvider.backgroundInfoActive])
                createView(for: "backgroundInfoSubtle",
                           colors: [tokenProvider.backgroundInfoSubtle])
                createView(for: "backgroundInfoSubtleHover",
                           colors: [tokenProvider.backgroundInfoSubtleHover])
                createView(for: "backgroundInfoSubtleActive",
                           colors: [tokenProvider.backgroundInfoSubtleActive])
                createView(for: "backgroundInfoSelected",
                           colors: [tokenProvider.backgroundInfoSelected])
                createView(for: "backgroundInfoSelectedHover",
                           colors: [tokenProvider.backgroundInfoSelectedHover])
                createView(for: "backgroundInfoSelectedActive",
                           colors: [tokenProvider.backgroundInfoSelectedActive])
                
                createView(for: "backgroundNotification",
                           colors: [tokenProvider.backgroundNotification])
                
                /// Border
                createView(for: "border",
                           colors: [tokenProvider.border])
                createView(for: "borderHover",
                           colors: [tokenProvider.borderHover])
                createView(for: "borderActive",
                           colors: [tokenProvider.borderActive])
                createView(for: "borderDisabled",
                           colors: [tokenProvider.borderDisabled])
                createView(for: "borderSelected",
                           colors: [tokenProvider.borderSelected])
                createView(for: "borderSelectedHover",
                           colors: [tokenProvider.borderSelectedHover])
                createView(for: "borderSelectedActive",
                           colors: [tokenProvider.borderSelectedActive])
                createView(for: "borderFocus",
                           colors: [tokenProvider.borderFocus])
                
                createView(for: "borderPrimary",
                           colors: [tokenProvider.borderPrimary])
                createView(for: "borderPrimaryHover",
                           colors: [tokenProvider.borderPrimaryHover])
                createView(for: "borderPrimaryActive",
                           colors: [tokenProvider.borderPrimaryActive])
                createView(for: "borderPrimarySubtle",
                           colors: [tokenProvider.borderPrimarySubtle])
                createView(for: "borderPrimarySubtleHover",
                           colors: [tokenProvider.borderPrimarySubtleHover])
                createView(for: "borderPrimarySubtleActive",
                           colors: [tokenProvider.borderPrimarySubtleActive])
                
                createView(for: "borderSecondary",
                           colors: [tokenProvider.borderSecondary])
                createView(for: "borderSecondaryHover",
                           colors: [tokenProvider.borderSecondaryHover])
                createView(for: "borderSecondaryActive",
                           colors: [tokenProvider.borderSecondaryActive])
                
                createView(for: "borderPositive",
                           colors: [tokenProvider.borderPositive])
                createView(for: "borderPositiveHover",
                           colors: [tokenProvider.borderPositiveHover])
                createView(for: "borderPositiveActive",
                           colors: [tokenProvider.borderPositiveActive])
                createView(for: "borderPositiveSubtle",
                           colors: [tokenProvider.borderPositiveSubtle])
                createView(for: "borderPositiveSubtleHover",
                           colors: [tokenProvider.borderPositiveSubtleHover])
                createView(for: "borderPositiveSubtleActive",
                           colors: [tokenProvider.borderPositiveSubtleActive])
                
                createView(for: "borderNegative",
                           colors: [tokenProvider.borderNegative])
                createView(for: "borderNegativeHover",
                           colors: [tokenProvider.borderNegativeHover])
                createView(for: "borderNegativeActive",
                           colors: [tokenProvider.borderNegativeActive])
                createView(for: "borderNegativeSubtle",
                           colors: [tokenProvider.borderNegativeSubtle])
                createView(for: "borderNegativeSubtleHover",
                           colors: [tokenProvider.borderNegativeSubtleHover])
                createView(for: "borderNegativeSubtleActive",
                           colors: [tokenProvider.borderNegativeSubtleActive])
                
                createView(for: "borderWarning",
                           colors: [tokenProvider.borderWarning])
                createView(for: "borderWarningHover",
                           colors: [tokenProvider.borderWarningHover])
                createView(for: "borderWarningActive",
                           colors: [tokenProvider.borderWarningActive])
                createView(for: "borderWarningSubtle",
                           colors: [tokenProvider.borderWarningSubtle])
                createView(for: "borderWarningSubtleHover",
                           colors: [tokenProvider.borderWarningSubtleHover])
                createView(for: "borderWarningSubtleActive",
                           colors: [tokenProvider.borderWarningSubtleActive])
                
                createView(for: "borderInfo",
                           colors: [tokenProvider.borderInfo])
                createView(for: "borderInfoHover",
                           colors: [tokenProvider.borderInfoHover])
                createView(for: "borderInfoActive",
                           colors: [tokenProvider.borderInfoActive])
                createView(for: "borderInfoSubtle",
                           colors: [tokenProvider.borderInfoSubtle])
                createView(for: "borderInfoSubtleHover",
                           colors: [tokenProvider.borderInfoSubtleHover])
                createView(for: "borderInfoSubtleActive",
                           colors: [tokenProvider.borderInfoSubtleActive])
                
                /// Icon
                createView(for: "icon",
                           colors: [tokenProvider.icon])
                createView(for: "iconHover",
                           colors: [tokenProvider.iconHover])
                createView(for: "iconActive",
                           colors: [tokenProvider.iconActive])
                createView(for: "iconSelected",
                           colors: [tokenProvider.iconSelected])
                createView(for: "iconSelectedHover",
                           colors: [tokenProvider.iconSelectedHover])
                createView(for: "iconSelectedActive",
                           colors: [tokenProvider.iconSelectedActive])
                createView(for: "iconDisabled",
                           colors: [tokenProvider.iconDisabled])
                createView(for: "iconSubtle",
                           colors: [tokenProvider.iconSubtle])
                createView(for: "iconSubtleHover",
                           colors: [tokenProvider.iconSubtleHover])
                createView(for: "iconSubtleActive",
                           colors: [tokenProvider.iconSubtleActive])
                createView(for: "iconInverted",
                           colors: [tokenProvider.iconInverted])
                createView(for: "iconInvertedHover",
                           colors: [tokenProvider.iconInvertedHover])
                createView(for: "iconInvertedActive",
                           colors: [tokenProvider.iconInvertedActive])
                createView(for: "iconPrimary",
                           colors: [tokenProvider.iconPrimary])
                createView(for: "iconSecondary",
                           colors: [tokenProvider.iconSecondary])
                createView(for: "iconSecondaryHover",
                           colors: [tokenProvider.iconSecondaryHover])
                createView(for: "iconSecondaryActive",
                           colors: [tokenProvider.iconSecondaryActive])
                createView(for: "iconPositive",
                           colors: [tokenProvider.iconPositive])
                createView(for: "iconNegative",
                           colors: [tokenProvider.iconNegative])
                createView(for: "iconWarning",
                           colors: [tokenProvider.iconWarning])
                createView(for: "iconInfo",
                           colors: [tokenProvider.iconInfo])
                
                createView(for: "iconNotification",
                           colors: [tokenProvider.iconNotification])
                
                /// Text
                createView(for: "text",
                           colors: [tokenProvider.text])
                createView(for: "textSubtle",
                           colors: [tokenProvider.textSubtle])
                createView(for: "textPlaceholder",
                           colors: [tokenProvider.textPlaceholder])
                createView(for: "textInverted",
                           colors: [tokenProvider.textInverted])
                createView(for: "textInvertedSubtle",
                           colors: [tokenProvider.textInvertedSubtle])
                createView(for: "textLink",
                           colors: [tokenProvider.textLink])
                createView(for: "textDisabled",
                           colors: [tokenProvider.textDisabled])
                createView(for: "textNegative",
                           colors: [tokenProvider.textNegative])
                createView(for: "textPositive",
                           colors: [tokenProvider.textPositive])
                createView(for: "textNotification",
                           colors: [tokenProvider.textNotification])
            }
            .padding(.horizontal)
        }
    }

    private func createView(for colorGroup: String, colors: [Color]) -> some View {
        return GroupBox(
            content: {
                HStack(spacing: 1) {
                    ForEach(colors, id: \.self) { color in
                        Rectangle()
                            .foregroundColor(color)
                            .frame(height: 25)
                    }
                }
            }, label: {
                Text(colorGroup)
            }
        )
    }
}

#Preview {
    BrandTokensView()
}
