import Foundation
import SwiftUI

struct ToolTipView: View {
    /// <#Description#>
    let title: String?

    /// <#Description#>
    let additionalInformation: String?

    /// <#Description#>
    let infoToolTipView: Image?

    /// <#Description#>
    let colorProvider: ColorProvider

    var body: some View {
        topView
    }

    private var topView: some View {
        HStack {
            titleView

            optionalLabelView

            rightImageView
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
    private var rightImageView: some View {
        if let infoToolTipView = infoToolTipView {
            infoToolTipView
                .foregroundColor(FinnColors.gray300)
                .frame(width: 16, height: 16)
        }
    }
}
