import SwiftUI
import Warp

struct DatavizTokensView: View {
    private let tokenProvider = Warp.DatavizToken

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack (alignment: .leading) {
                    createView(for: "backgroundPrimary",
                               colors: [tokenProvider.backgroundPrimary])
                    createView(for: "backgroundPrimaryFocus",
                               colors: [tokenProvider.backgroundPrimaryFocus])
                    createView(for: "backgroundSecondary",
                           colors: [tokenProvider.backgroundSecondary])
                    createView(for: "backgroundSecondaryFocus",
                           colors: [tokenProvider.backgroundSecondaryFocus])
                    createView(for: "backgroundCategory1",
                           colors: [tokenProvider.backgroundCategory1])
                    createView(for: "backgroundCategory1Focus",
                           colors: [tokenProvider.backgroundCategory1Focus])
                    createView(for: "backgroundCategory2",
                           colors: [tokenProvider.backgroundCategory2])
                    createView(for: "backgroundCategory2Focus",
                           colors: [tokenProvider.backgroundCategory2Focus])
                    createView(for: "backgroundCategory3",
                           colors: [tokenProvider.backgroundCategory3])
                    createView(for: "backgroundCategory3Focus",
                           colors: [tokenProvider.backgroundCategory3Focus])
                    createView(for: "backgroundCategory4",
                           colors: [tokenProvider.backgroundCategory4])
                    createView(for: "backgroundCategory4Focus",
                           colors: [tokenProvider.backgroundCategory4Focus])
                    createView(for: "backgroundCategory5",
                           colors: [tokenProvider.backgroundCategory5])
                    createView(for: "backgroundCategory5Focus",
                           colors: [tokenProvider.backgroundCategory5Focus])
                    createView(for: "backgroundCategory6",
                           colors: [tokenProvider.backgroundCategory6])
                    createView(for: "backgroundCategory6Focus",
                           colors: [tokenProvider.backgroundCategory6Focus])
                    createView(for: "backgroundCategory7",
                           colors: [tokenProvider.backgroundCategory7])
                    createView(for: "backgroundCategory7Focus",
                           colors: [tokenProvider.backgroundCategory7Focus])
                    createView(for: "backgroundCategory8",
                           colors: [tokenProvider.backgroundCategory8])
                    createView(for: "backgroundCategory8Focus",
                           colors: [tokenProvider.backgroundCategory8Focus])
                    createView(for: "backgroundPositive",
                           colors: [tokenProvider.backgroundPositive])
                    createView(for: "backgroundPositiveFocus",
                           colors: [tokenProvider.backgroundPositiveFocus])
                    createView(for: "backgroundWarning",
                           colors: [tokenProvider.backgroundWarning])
                    createView(for: "backgroundWarningFocus",
                           colors: [tokenProvider.backgroundWarningFocus])
                    createView(for: "backgroundNegative",
                           colors: [tokenProvider.backgroundNegative])
                    createView(for: "backgroundNegativeFocus",
                           colors: [tokenProvider.backgroundNegativeFocus])
                    createView(for: "backgroundNeutral",
                           colors: [tokenProvider.backgroundNeutral])
                    createView(for: "backgroundNeutralFocus",
                           colors: [tokenProvider.backgroundNeutralFocus])
                    createView(for: "backgroundPrimarySubtle",
                           colors: [tokenProvider.backgroundPrimarySubtle])
                    createView(for: "backgroundPrimarySubtleFocus",
                           colors: [tokenProvider.backgroundPrimarySubtleFocus])
                    createView(for: "backgroundSecondarySubtle",
                           colors: [tokenProvider.backgroundSecondarySubtle])
                    createView(for: "backgroundSecondarySubtleFocus",
                           colors: [tokenProvider.backgroundSecondarySubtleFocus])
                    createView(for: "backgroundCategory1Subtle",
                           colors: [tokenProvider.backgroundCategory1Subtle])
                    createView(for: "backgroundCategory1SubtleFocus",
                           colors: [tokenProvider.backgroundCategory1SubtleFocus])
                    createView(for: "backgroundCategory2Subtle",
                           colors: [tokenProvider.backgroundCategory2Subtle])
                    createView(for: "backgroundCategory2SubtleFocus",
                           colors: [tokenProvider.backgroundCategory2SubtleFocus])
                    createView(for: "backgroundCategory3Subtle",
                           colors: [tokenProvider.backgroundCategory3Subtle])
                    createView(for: "backgroundCategory3SubtleFocus",
                           colors: [tokenProvider.backgroundCategory3SubtleFocus])
                    createView(for: "backgroundCategory4Subtle",
                           colors: [tokenProvider.backgroundCategory4Subtle])
                    createView(for: "backgroundCategory4SubtleFocus",
                           colors: [tokenProvider.backgroundCategory4SubtleFocus])
                    createView(for: "backgroundCategory5Subtle",
                           colors: [tokenProvider.backgroundCategory5Subtle])
                    createView(for: "backgroundCategory5SubtleFocus",
                           colors: [tokenProvider.backgroundCategory5SubtleFocus])
                    createView(for: "backgroundCategory6Subtle",
                           colors: [tokenProvider.backgroundCategory6Subtle])
                    createView(for: "backgroundCategory6SubtleFocus",
                           colors: [tokenProvider.backgroundCategory6SubtleFocus])
                    createView(for: "backgroundCategory7Subtle",
                           colors: [tokenProvider.backgroundCategory7Subtle])
                    createView(for: "backgroundCategory7SubtleFocus",
                           colors: [tokenProvider.backgroundCategory7SubtleFocus])
                    createView(for: "backgroundCategory8Subtle",
                           colors: [tokenProvider.backgroundCategory8Subtle])
                    createView(for: "backgroundCategory8SubtleFocus",
                           colors: [tokenProvider.backgroundCategory8SubtleFocus])
                    createView(for: "backgroundPositiveSubtle",
                           colors: [tokenProvider.backgroundPositiveSubtle])
                    createView(for: "backgroundPositiveSubtleFocus",
                           colors: [tokenProvider.backgroundPositiveSubtleFocus])
                    createView(for: "backgroundWarningSubtle",
                           colors: [tokenProvider.backgroundWarningSubtle])
                    createView(for: "backgroundWarningSubtleFocus",
                           colors: [tokenProvider.backgroundWarningSubtleFocus])
                    createView(for: "backgroundNegativeSubtle",
                           colors: [tokenProvider.backgroundNegativeSubtle])
                    createView(for: "backgroundNegativeSubtleFocus",
                           colors: [tokenProvider.backgroundNegativeSubtleFocus])
                    createView(for: "backgroundNeutralSubtle",
                           colors: [tokenProvider.backgroundNeutralSubtle])
                    createView(for: "backgroundNeutralSubtleFocus",
                           colors: [tokenProvider.backgroundNeutralSubtleFocus])
                    createView(for: "linePrimary",
                           colors: [tokenProvider.linePrimary])
                    createView(for: "linePrimaryFocus",
                           colors: [tokenProvider.linePrimaryFocus])
                    createView(for: "lineSecondary",
                           colors: [tokenProvider.lineSecondary])
                    createView(for: "lineSecondaryFocus",
                           colors: [tokenProvider.lineSecondaryFocus])
                    createView(for: "lineCategory1",
                           colors: [tokenProvider.lineCategory1])
                    createView(for: "lineCategory1Focus",
                           colors: [tokenProvider.lineCategory1Focus])
                    createView(for: "lineCategory2",
                           colors: [tokenProvider.lineCategory2])
                    createView(for: "lineCategory2Focus",
                           colors: [tokenProvider.lineCategory2Focus])
                    createView(for: "lineCategory3",
                           colors: [tokenProvider.lineCategory3])
                    createView(for: "lineCategory3Focus",
                           colors: [tokenProvider.lineCategory3Focus])
                    createView(for: "lineCategory4",
                           colors: [tokenProvider.lineCategory4])
                    createView(for: "lineCategory4Focus",
                           colors: [tokenProvider.lineCategory4Focus])
                    createView(for: "lineCategory5",
                           colors: [tokenProvider.lineCategory5])
                    createView(for: "lineCategory5Focus",
                           colors: [tokenProvider.lineCategory5Focus])
                    createView(for: "lineCategory6",
                           colors: [tokenProvider.lineCategory6])
                    createView(for: "lineCategory6Focus",
                           colors: [tokenProvider.lineCategory6Focus])
                    createView(for: "lineCategory7",
                           colors: [tokenProvider.lineCategory7])
                    createView(for: "lineCategory7Focus",
                           colors: [tokenProvider.lineCategory7Focus])
                    createView(for: "lineCategory8",
                           colors: [tokenProvider.lineCategory8])
                    createView(for: "lineCategory8Focus",
                           colors: [tokenProvider.lineCategory8Focus])
                    createView(for: "linePositive",
                           colors: [tokenProvider.linePositive])
                    createView(for: "linePositiveFocus",
                           colors: [tokenProvider.linePositiveFocus])
                    createView(for: "lineWarning",
                           colors: [tokenProvider.lineWarning])
                    createView(for: "lineWarningFocus",
                           colors: [tokenProvider.lineWarningFocus])
                    createView(for: "lineNegative",
                           colors: [tokenProvider.lineNegative])
                    createView(for: "lineNegativeFocus",
                           colors: [tokenProvider.lineNegativeFocus])
                    createView(for: "lineNeutral",
                           colors: [tokenProvider.lineNeutral])
                    createView(for: "lineNeutralFocus",
                           colors: [tokenProvider.lineNeutralFocus])
                    createView(for: "borderPrimary",
                           colors: [tokenProvider.borderPrimary])
                    createView(for: "borderPrimaryFocus",
                           colors: [tokenProvider.borderPrimaryFocus])
                    createView(for: "borderSecondary",
                           colors: [tokenProvider.borderSecondary])
                    createView(for: "borderSecondaryFocus",
                           colors: [tokenProvider.borderSecondaryFocus])
                    createView(for: "borderCategory1",
                           colors: [tokenProvider.borderCategory1])
                    createView(for: "borderCategory1Focus",
                           colors: [tokenProvider.borderCategory1Focus])
                    createView(for: "borderCategory2",
                           colors: [tokenProvider.borderCategory2])
                    createView(for: "borderCategory2Focus",
                           colors: [tokenProvider.borderCategory2Focus])
                    createView(for: "borderCategory3",
                           colors: [tokenProvider.borderCategory3])
                    createView(for: "borderCategory3Focus",
                           colors: [tokenProvider.borderCategory3Focus])
                    createView(for: "borderCategory4",
                           colors: [tokenProvider.borderCategory4])
                    createView(for: "borderCategory4Focus",
                           colors: [tokenProvider.borderCategory4Focus])
                    createView(for: "borderCategory5",
                           colors: [tokenProvider.borderCategory5])
                    createView(for: "borderCategory5Focus",
                           colors: [tokenProvider.borderCategory5Focus])
                    createView(for: "borderCategory6",
                           colors: [tokenProvider.borderCategory6])
                    createView(for: "borderCategory6Focus",
                           colors: [tokenProvider.borderCategory6Focus])
                    createView(for: "borderCategory7",
                           colors: [tokenProvider.borderCategory7])
                    createView(for: "borderCategory7Focus",
                           colors: [tokenProvider.borderCategory7Focus])
                    createView(for: "borderCategory8",
                           colors: [tokenProvider.borderCategory8])
                    createView(for: "borderCategory8Focus",
                           colors: [tokenProvider.borderCategory8Focus])
                    createView(for: "borderPositive",
                           colors: [tokenProvider.borderPositive])
                    createView(for: "borderPositiveFocus",
                           colors: [tokenProvider.borderPositiveFocus])
                    createView(for: "borderWarning",
                           colors: [tokenProvider.borderWarning])
                    createView(for: "borderWarningFocus",
                           colors: [tokenProvider.borderWarningFocus])
                    createView(for: "borderNegative",
                           colors: [tokenProvider.borderNegative])
                    createView(for: "borderNegativeFocus",
                           colors: [tokenProvider.borderNegativeFocus])
                    createView(for: "borderNeutral",
                           colors: [tokenProvider.borderNeutral])
                    createView(for: "borderNeutralFocus",
                           colors: [tokenProvider.borderNeutralFocus])
                    createView(for: "textPrimary",
                           colors: [tokenProvider.textPrimary])
                    createView(for: "textPrimaryFocus",
                           colors: [tokenProvider.textPrimaryFocus])
                    createView(for: "textSecondary",
                           colors: [tokenProvider.textSecondary])
                    createView(for: "textSecondaryFocus",
                           colors: [tokenProvider.textSecondaryFocus])
                    createView(for: "textCategory1",
                           colors: [tokenProvider.textCategory1])
                    createView(for: "textCategory1Focus",
                           colors: [tokenProvider.textCategory1Focus])
                    createView(for: "textCategory2",
                           colors: [tokenProvider.textCategory2])
                    createView(for: "textCategory2Focus",
                           colors: [tokenProvider.textCategory2Focus])
                    createView(for: "textCategory3",
                           colors: [tokenProvider.textCategory3])
                    createView(for: "textCategory3Focus",
                           colors: [tokenProvider.textCategory3Focus])
                    createView(for: "textCategory4",
                           colors: [tokenProvider.textCategory4])
                    createView(for: "textCategory4Focus",
                           colors: [tokenProvider.textCategory4Focus])
                    createView(for: "textCategory5",
                           colors: [tokenProvider.textCategory5])
                    createView(for: "textCategory5Focus",
                           colors: [tokenProvider.textCategory5Focus])
                    createView(for: "textCategory6",
                           colors: [tokenProvider.textCategory6])
                    createView(for: "textCategory6Focus",
                           colors: [tokenProvider.textCategory6Focus])
                    createView(for: "textCategory7",
                           colors: [tokenProvider.textCategory7])
                    createView(for: "textCategory7Focus",
                           colors: [tokenProvider.textCategory7Focus])
                    createView(for: "textCategory8",
                           colors: [tokenProvider.textCategory8])
                    createView(for: "textCategory8Focus",
                           colors: [tokenProvider.textCategory8Focus])
                    createView(for: "textPositive",
                           colors: [tokenProvider.textPositive])
                    createView(for: "textPositiveFocus",
                           colors: [tokenProvider.textPositiveFocus])
                    createView(for: "textWarning",
                           colors: [tokenProvider.textWarning])
                    createView(for: "textWarningFocus",
                           colors: [tokenProvider.textWarningFocus])
                    createView(for: "textNegative",
                           colors: [tokenProvider.textNegative])
                    createView(for: "textNegativeFocus",
                           colors: [tokenProvider.textNegativeFocus])
                    createView(for: "textNeutral",
                           colors: [tokenProvider.textNeutral])
                    createView(for: "textNeutralFocus",
                           colors: [tokenProvider.textNeutralFocus])
                    createView(for: "iconPrimary",
                           colors: [tokenProvider.iconPrimary])
                    createView(for: "iconPrimaryFocus",
                           colors: [tokenProvider.iconPrimaryFocus])
                    createView(for: "iconSecondary",
                           colors: [tokenProvider.iconSecondary])
                    createView(for: "iconSecondaryFocus",
                           colors: [tokenProvider.iconSecondaryFocus])
                    createView(for: "iconCategory1",
                           colors: [tokenProvider.iconCategory1])
                    createView(for: "iconCategory1Focus",
                           colors: [tokenProvider.iconCategory1Focus])
                    createView(for: "iconCategory2",
                           colors: [tokenProvider.iconCategory2])
                    createView(for: "iconCategory2Focus",
                           colors: [tokenProvider.iconCategory2Focus])
                    createView(for: "iconCategory3",
                           colors: [tokenProvider.iconCategory3])
                    createView(for: "iconCategory3Focus",
                           colors: [tokenProvider.iconCategory3Focus])
                    createView(for: "iconCategory4",
                           colors: [tokenProvider.iconCategory4])
                    createView(for: "iconCategory4Focus",
                           colors: [tokenProvider.iconCategory4Focus])
                    createView(for: "iconCategory5",
                           colors: [tokenProvider.iconCategory5])
                    createView(for: "iconCategory5Focus",
                           colors: [tokenProvider.iconCategory5Focus])
                    createView(for: "iconCategory6",
                           colors: [tokenProvider.iconCategory6])
                    createView(for: "iconCategory6Focus",
                           colors: [tokenProvider.iconCategory6Focus])
                    createView(for: "iconCategory7",
                           colors: [tokenProvider.iconCategory7])
                    createView(for: "iconCategory7Focus",
                           colors: [tokenProvider.iconCategory7Focus])
                    createView(for: "iconCategory8",
                           colors: [tokenProvider.iconCategory8])
                    createView(for: "iconCategory8Focus",
                           colors: [tokenProvider.iconCategory8Focus])
                    createView(for: "iconPositive",
                           colors: [tokenProvider.iconPositive])
                    createView(for: "iconPositiveFocus",
                           colors: [tokenProvider.iconPositiveFocus])
                    createView(for: "iconWarning",
                           colors: [tokenProvider.iconWarning])
                    createView(for: "iconWarningFocus",
                           colors: [tokenProvider.iconWarningFocus])
                    createView(for: "iconNegative",
                           colors: [tokenProvider.iconNegative])
                    createView(for: "iconNegativeFocus",
                           colors: [tokenProvider.iconNegativeFocus])
                    createView(for: "iconNeutral",
                           colors: [tokenProvider.iconNeutral])
                    createView(for: "iconNeutralFocus",
                           colors: [tokenProvider.iconNeutralFocus])
            }
            .padding(.horizontal)
            .navigationTitle("DatavizTokens")
            .navigationBarTitleDisplayMode(.inline)
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
    DatavizTokensView()
}