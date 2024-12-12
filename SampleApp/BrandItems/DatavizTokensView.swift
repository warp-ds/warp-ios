import SwiftUI
import Warp

struct DatavizTokensView: View {
    private let tokenProvider = Warp.DatavizToken

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack (alignment: .leading) {
                    createView(for: "fillPrimary",
                               colors: [tokenProvider.fillPrimary])
                    createView(for: "fillPrimaryFocus",
                               colors: [tokenProvider.fillPrimaryFocus])
                    createView(for: "fillSecondary",
                           colors: [tokenProvider.fillSecondary])
                    createView(for: "fillSecondaryFocus",
                           colors: [tokenProvider.fillSecondaryFocus])
                    createView(for: "fillCategory1",
                           colors: [tokenProvider.fillCategory1])
                    createView(for: "fillCategory1Focus",
                           colors: [tokenProvider.fillCategory1Focus])
                    createView(for: "fillCategory2",
                           colors: [tokenProvider.fillCategory2])
                    createView(for: "fillCategory2Focus",
                           colors: [tokenProvider.fillCategory2Focus])
                    createView(for: "fillCategory3",
                           colors: [tokenProvider.fillCategory3])
                    createView(for: "fillCategory3Focus",
                           colors: [tokenProvider.fillCategory3Focus])
                    createView(for: "fillCategory4",
                           colors: [tokenProvider.fillCategory4])
                    createView(for: "fillCategory4Focus",
                           colors: [tokenProvider.fillCategory4Focus])
                    createView(for: "fillCategory5",
                           colors: [tokenProvider.fillCategory5])
                    createView(for: "fillCategory5Focus",
                           colors: [tokenProvider.fillCategory5Focus])
                    createView(for: "fillCategory6",
                           colors: [tokenProvider.fillCategory6])
                    createView(for: "fillCategory6Focus",
                           colors: [tokenProvider.fillCategory6Focus])
                    createView(for: "fillCategory7",
                           colors: [tokenProvider.fillCategory7])
                    createView(for: "fillCategory7Focus",
                           colors: [tokenProvider.fillCategory7Focus])
                    createView(for: "fillCategory8",
                           colors: [tokenProvider.fillCategory8])
                    createView(for: "fillCategory8Focus",
                           colors: [tokenProvider.fillCategory8Focus])
                    createView(for: "fillPositive",
                           colors: [tokenProvider.fillPositive])
                    createView(for: "fillPositiveFocus",
                           colors: [tokenProvider.fillPositiveFocus])
                    createView(for: "fillWarning",
                           colors: [tokenProvider.fillWarning])
                    createView(for: "fillWarningFocus",
                           colors: [tokenProvider.fillWarningFocus])
                    createView(for: "fillNegative",
                           colors: [tokenProvider.fillNegative])
                    createView(for: "fillNegativeFocus",
                           colors: [tokenProvider.fillNegativeFocus])
                    createView(for: "fillNeutral",
                           colors: [tokenProvider.fillNeutral])
                    createView(for: "fillNeutralFocus",
                           colors: [tokenProvider.fillNeutralFocus])
                    createView(for: "fillPrimarySubtle",
                           colors: [tokenProvider.fillPrimarySubtle])
                    createView(for: "fillPrimarySubtleFocus",
                           colors: [tokenProvider.fillPrimarySubtleFocus])
                    createView(for: "fillSecondarySubtle",
                           colors: [tokenProvider.fillSecondarySubtle])
                    createView(for: "fillSecondarySubtleFocus",
                           colors: [tokenProvider.fillSecondarySubtleFocus])
                    createView(for: "fillCategory1Subtle",
                           colors: [tokenProvider.fillCategory1Subtle])
                    createView(for: "fillCategory1SubtleFocus",
                           colors: [tokenProvider.fillCategory1SubtleFocus])
                    createView(for: "fillCategory2Subtle",
                           colors: [tokenProvider.fillCategory2Subtle])
                    createView(for: "fillCategory2SubtleFocus",
                           colors: [tokenProvider.fillCategory2SubtleFocus])
                    createView(for: "fillCategory3Subtle",
                           colors: [tokenProvider.fillCategory3Subtle])
                    createView(for: "fillCategory3SubtleFocus",
                           colors: [tokenProvider.fillCategory3SubtleFocus])
                    createView(for: "fillCategory4Subtle",
                           colors: [tokenProvider.fillCategory4Subtle])
                    createView(for: "fillCategory4SubtleFocus",
                           colors: [tokenProvider.fillCategory4SubtleFocus])
                    createView(for: "fillCategory5Subtle",
                           colors: [tokenProvider.fillCategory5Subtle])
                    createView(for: "fillCategory5SubtleFocus",
                           colors: [tokenProvider.fillCategory5SubtleFocus])
                    createView(for: "fillCategory6Subtle",
                           colors: [tokenProvider.fillCategory6Subtle])
                    createView(for: "fillCategory6SubtleFocus",
                           colors: [tokenProvider.fillCategory6SubtleFocus])
                    createView(for: "fillCategory7Subtle",
                           colors: [tokenProvider.fillCategory7Subtle])
                    createView(for: "fillCategory7SubtleFocus",
                           colors: [tokenProvider.fillCategory7SubtleFocus])
                    createView(for: "fillCategory8Subtle",
                           colors: [tokenProvider.fillCategory8Subtle])
                    createView(for: "fillCategory8SubtleFocus",
                           colors: [tokenProvider.fillCategory8SubtleFocus])
                    createView(for: "fillPositiveSubtle",
                           colors: [tokenProvider.fillPositiveSubtle])
                    createView(for: "fillPositiveSubtleFocus",
                           colors: [tokenProvider.fillPositiveSubtleFocus])
                    createView(for: "fillWarningSubtle",
                           colors: [tokenProvider.fillWarningSubtle])
                    createView(for: "fillWarningSubtleFocus",
                           colors: [tokenProvider.fillWarningSubtleFocus])
                    createView(for: "fillNegativeSubtle",
                           colors: [tokenProvider.fillNegativeSubtle])
                    createView(for: "fillNegativeSubtleFocus",
                           colors: [tokenProvider.fillNegativeSubtleFocus])
                    createView(for: "fillNeutralSubtle",
                           colors: [tokenProvider.fillNeutralSubtle])
                    createView(for: "fillNeutralSubtleFocus",
                           colors: [tokenProvider.fillNeutralSubtleFocus])
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
                    createView(for: "textCategorical1",
                           colors: [tokenProvider.textCategorical1])
                    createView(for: "textCategorical1Focus",
                           colors: [tokenProvider.textCategorical1Focus])
                    createView(for: "textCategorical2",
                           colors: [tokenProvider.textCategorical2])
                    createView(for: "textCategorical2Focus",
                           colors: [tokenProvider.textCategorical2Focus])
                    createView(for: "textCategorical3",
                           colors: [tokenProvider.textCategorical3])
                    createView(for: "textCategorical3Focus",
                           colors: [tokenProvider.textCategorical3Focus])
                    createView(for: "textCategorical4",
                           colors: [tokenProvider.textCategorical4])
                    createView(for: "textCategorical4Focus",
                           colors: [tokenProvider.textCategorical4Focus])
                    createView(for: "textCategorical5",
                           colors: [tokenProvider.textCategorical5])
                    createView(for: "textCategorical5Focus",
                           colors: [tokenProvider.textCategorical5Focus])
                    createView(for: "textCategorical6",
                           colors: [tokenProvider.textCategorical6])
                    createView(for: "textCategorical6Focus",
                           colors: [tokenProvider.textCategorical6Focus])
                    createView(for: "textCategorical7",
                           colors: [tokenProvider.textCategorical7])
                    createView(for: "textCategorical7Focus",
                           colors: [tokenProvider.textCategorical7Focus])
                    createView(for: "textCategorical8",
                           colors: [tokenProvider.textCategorical8])
                    createView(for: "textCategorical8Focus",
                           colors: [tokenProvider.textCategorical8Focus])
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
                    createView(for: "iconCategorical1",
                           colors: [tokenProvider.iconCategorical1])
                    createView(for: "iconCategorical1Focus",
                           colors: [tokenProvider.iconCategorical1Focus])
                    createView(for: "iconCategorical2",
                           colors: [tokenProvider.iconCategorical2])
                    createView(for: "iconCategorical2Focus",
                           colors: [tokenProvider.iconCategorical2Focus])
                    createView(for: "iconCategorical3",
                           colors: [tokenProvider.iconCategorical3])
                    createView(for: "iconCategorical3Focus",
                           colors: [tokenProvider.iconCategorical3Focus])
                    createView(for: "iconCategorical4",
                           colors: [tokenProvider.iconCategorical4])
                    createView(for: "iconCategorical4Focus",
                           colors: [tokenProvider.iconCategorical4Focus])
                    createView(for: "iconCategorical5",
                           colors: [tokenProvider.iconCategorical5])
                    createView(for: "iconCategorical5Focus",
                           colors: [tokenProvider.iconCategorical5Focus])
                    createView(for: "iconCategorical6",
                           colors: [tokenProvider.iconCategorical6])
                    createView(for: "iconCategorical6Focus",
                           colors: [tokenProvider.iconCategorical6Focus])
                    createView(for: "iconCategorical7",
                           colors: [tokenProvider.iconCategorical7])
                    createView(for: "iconCategorical7Focus",
                           colors: [tokenProvider.iconCategorical7Focus])
                    createView(for: "iconCategorical8",
                           colors: [tokenProvider.iconCategorical8])
                    createView(for: "iconCategorical8Focus",
                           colors: [tokenProvider.iconCategorical8Focus])
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
