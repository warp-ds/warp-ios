import SwiftUI

extension Warp.StepIndicator {
    @MainActor
    struct LineBuilder {
        @ViewBuilder
        static func line(
            for otherProgress: Warp.StepIndicatorItem.Progress,
            ownProgress: Warp.StepIndicatorItem.Progress,
            colorProvider: ColorProvider = Warp.Color,
            orientation: Warp.StepIndicator.LayoutOrientation,
            lineThickness: Double = 2
        ) -> some View {

            let fillColor = switch otherProgress {
            case .incomplete:
                colorProvider.stepIndicatorTrackBackground
            case .inProgress where ownProgress == .incomplete, .complete where ownProgress == .incomplete:
                colorProvider.stepIndicatorTrackBackground 
            case .inProgress, .complete:
                colorProvider.stepIndicatorTrackBackgroundActive
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
