import SwiftUI

extension Warp.StepIndicator {
    struct VerticalItemView: View {
        let step: Warp.StepIndicatorItem
        let stepPosition: Warp.StepIndicatorItem.Position

        var body: some View {
            HStack(alignment: .top, spacing: 8) {
                Warp.StepIndicator.VerticalProgressView(
                    progress: step.progress,
                    stepPosition: stepPosition
                )

                Warp.StepIndicator.DescriptionView(
                    step: step,
                    layoutOrientation: .vertical
                )
                .padding(.bottom, 16)

                Spacer()
            }
            .fixedSize(horizontal: false, vertical: true)
        }
    }
}

#Preview("Not Started") {
    Warp.StepIndicator.VerticalItemView(
        step: .mockNotStarted,
        stepPosition: .first(nextProgress: nil)
    )
}

#Preview("In Progress") {
    Warp.StepIndicator.VerticalItemView(
        step: .mockInProgress,
        stepPosition: .first(nextProgress: nil)
    )
}

#Preview("Completed") {
    Warp.StepIndicator.VerticalItemView(
        step: .mockCompleted,
        stepPosition: .first(nextProgress: nil)
    )
}

#Preview("Combined") {
    VStack(spacing: -1) {
        Warp.StepIndicator.VerticalItemView(
            step: .mockCompleted,
            stepPosition: .first(nextProgress: .inProgress)
        )
        Warp.StepIndicator.VerticalItemView(
            step: .mockInProgress,
            stepPosition: .middle(previousProgress: .complete, nextProgress: .incomplete)
        )
        Warp.StepIndicator.VerticalItemView(
            step: .mockNotStarted,
            stepPosition: .last(previousProgress: .inProgress)
        )
    }
    .padding()
}
