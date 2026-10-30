import SwiftUI

extension Warp.StepIndicator {
    struct LineBuilder {
        @ViewBuilder
        static func line(
            for otherProgress: Warp.StepIndicatorItem.Progress,
            ownProgress: Warp.StepIndicatorItem.Progress,
            otherIsPrevious: Bool,
            colorProvider: ColorProvider,
            orientation: Warp.StepIndicator.LayoutOrientation,
            lineThickness: Double = 2
        ) -> some View {

            // A connector is active only when the earlier of the two steps it joins is complete,
            // so both sides of the connector always share the same color.
            let earlierProgress = otherIsPrevious ? otherProgress : ownProgress
            let fillColor = earlierProgress == .complete
                ? colorProvider.token.backgroundPrimary
                : colorProvider.token.backgroundDisabled

            let radius = lineThickness / 2

            switch orientation {
            case .horizontal:
                // Round only the end next to the circle; the other end meets the neighbouring
                // segment and must stay flat so the seam is invisible.
                UnevenRoundedRectangle(
                    topLeadingRadius: otherIsPrevious ? 0 : radius,
                    bottomLeadingRadius: otherIsPrevious ? 0 : radius,
                    bottomTrailingRadius: otherIsPrevious ? radius : 0,
                    topTrailingRadius: otherIsPrevious ? radius : 0
                )
                .fill(fillColor)
                .frame(height: lineThickness)
            case .vertical:
                RoundedRectangle(cornerRadius: radius)
                    .fill(fillColor)
                    .frame(width: lineThickness)
            }
        }
    }
}
