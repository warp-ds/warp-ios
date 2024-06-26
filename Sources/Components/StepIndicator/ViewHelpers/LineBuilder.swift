import SwiftUI

extension Warp.StepIndicator {
    struct LineBuilder {
        @ViewBuilder
        static func line(
            for otherProgress: Warp.StepIndicatorItem.Progress,
            ownProgress: Warp.StepIndicatorItem.Progress,
            colorProvider: ColorProvider = Warp.Config.colorProvider,
            orientation: Warp.StepIndicator.LayoutOrientation,
            lineThickness: Double = 2
        ) -> some View {

            let fillColor = switch otherProgress {
            case .incomplete:
                colorProvider.token.backgroundDisabled
            case .inProgress where ownProgress == .incomplete, .complete where ownProgress == .incomplete:
                colorProvider.token.backgroundDisabled
            case .inProgress, .complete:
                colorProvider.token.backgroundPrimary
            }

            switch orientation {
            case .horizontal:
                Rectangle()
                    .fill(fillColor)
                    .frame(height: lineThickness)
            case .vertical:
                Rectangle()
                    .fill(fillColor)
                    .frame(width: lineThickness)
            }
        }
    }
}
