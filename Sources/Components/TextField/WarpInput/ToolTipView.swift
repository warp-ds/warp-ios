import Foundation
import SwiftUI

/// Information tool tip view that will be shown on the top of TextField.
@MainActor
struct ToolTipView: View {
    /// Tool tip title.
    let title: String?

    /// Info tool tip additional brief information that will be shown after `title`.
    let additionalInformation: String?

    /// Info tool tip view that will be show after `additionalInformation`.
    let infoToolTipView: AnyView?

    /// Object responsible for providing needed colors.
    let colorProvider: ColorProvider

    var body: some View {
        HStack {
            titleView

            optionalLabelView

            toolTipView
        }
    }

    @ViewBuilder
    private var titleView: some View {
        if let title = title {
            Text(title)
                .font(.footnote)
                .foregroundColor(colorProvider.inputTextFilled)
        }
    }

    @ViewBuilder
    private var optionalLabelView: some View {
        if let additionalInformation = additionalInformation {
            Text(additionalInformation)
                .font(.caption)
                .fontWeight(.thin)
                .foregroundColor(FinnColors.gray500)
        }
    }

    @ViewBuilder
    private var toolTipView: some View {
        if let infoToolTipView = infoToolTipView {
            infoToolTipView
                .foregroundColor(FinnColors.gray300)
                .textFieldAdditionalView()
        }
    }
}
