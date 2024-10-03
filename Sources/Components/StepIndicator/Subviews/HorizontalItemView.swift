import SwiftUI

extension Warp.StepIndicator {
    struct HorizontalItemView: View {
        let step: Warp.StepIndicatorItem
        let stepPosition: Warp.StepIndicatorItem.Position

        var body: some View {
            VStack(alignment: .center, spacing: 8) {
                Warp.StepIndicator.DescriptionView(
                    step: step,
                    layoutOrientation: .horizontal
                )
                .padding(.horizontal, 8)

                Warp.StepIndicator.HorizontalProgressView(
                    progress: step.progress,
                    stepPosition: stepPosition
                )
            }
            .fixedSize(horizontal: true, vertical: false)
        }
    }
}

#Preview("First Step") {
    VStack {
        Warp.StepIndicator.HorizontalItemView(
            step: .mockNotStarted,
            stepPosition: .first(nextProgress: nil)
        )

        Warp.StepIndicator.HorizontalItemView(
            step: .mockNotStarted,
            stepPosition: .first(nextProgress: .incomplete)
        )

        Warp.StepIndicator.HorizontalItemView(
            step: .mockInProgress,
            stepPosition: .first(nextProgress: nil)
        )

        Warp.StepIndicator.HorizontalItemView(
            step: .mockInProgress,
            stepPosition: .first(nextProgress: .incomplete)
        )

        Warp.StepIndicator.HorizontalItemView(
            step: .mockInProgress,
            stepPosition: .first(nextProgress: .inProgress)
        )

        Warp.StepIndicator.HorizontalItemView(
            step: .mockCompleted,
            stepPosition: .first(nextProgress: nil)
        )

        Warp.StepIndicator.HorizontalItemView(
            step: .mockCompleted,
            stepPosition: .first(nextProgress: .inProgress)
        )
    }
}

#Preview("Middle Step") {
    VStack {
        Warp.StepIndicator.HorizontalItemView(
            step: .mockNotStarted,
            stepPosition: .middle(
                previousProgress: .incomplete,
                nextProgress: .incomplete
            )
        )

        Warp.StepIndicator.HorizontalItemView(
            step: .mockNotStarted,
            stepPosition: .middle(
                previousProgress: .complete,
                nextProgress: .incomplete
            )
        )

        Warp.StepIndicator.HorizontalItemView(
            step: .mockInProgress,
            stepPosition: .middle(
                previousProgress: .complete,
                nextProgress: .incomplete
            )
        )

        Warp.StepIndicator.HorizontalItemView(
            step: .mockInProgress,
            stepPosition: .middle(
                previousProgress: .complete,
                nextProgress: .inProgress
            )
        )


        Warp.StepIndicator.HorizontalItemView(
            step: .mockCompleted,
            stepPosition: .middle(
                previousProgress: .complete,
                nextProgress: .incomplete
            )
        )

        Warp.StepIndicator.HorizontalItemView(
            step: .mockCompleted,
            stepPosition: .middle(
                previousProgress: .complete,
                nextProgress: .inProgress
            )
        )
    }
}

#Preview("Last Step") {
    VStack {
        Warp.StepIndicator.HorizontalItemView(
            step: .mockNotStarted,
            stepPosition: .last(previousProgress: .incomplete)
        )

        Warp.StepIndicator.HorizontalItemView(
            step: .mockNotStarted,
            stepPosition: .last(previousProgress: .inProgress)
        )

        Warp.StepIndicator.HorizontalItemView(
            step: .mockInProgress,
            stepPosition: .last(previousProgress: .incomplete)
        )

        Warp.StepIndicator.HorizontalItemView(
            step: .mockInProgress,
            stepPosition: .last(previousProgress: .inProgress)
        )

        Warp.StepIndicator.HorizontalItemView(
            step: .mockInProgress,
            stepPosition: .last(previousProgress: .complete)
        )

        Warp.StepIndicator.HorizontalItemView(
            step: .mockCompleted,
            stepPosition: .last(previousProgress: .incomplete)
        )

        Warp.StepIndicator.HorizontalItemView(
            step: .mockCompleted,
            stepPosition: .last(previousProgress: .inProgress)
        )

        Warp.StepIndicator.HorizontalItemView(
            step: .mockCompleted,
            stepPosition: .last(previousProgress: .complete)
        )
    }
}

#Preview("Combined") {
    HStack(spacing: 0) {
        Warp.StepIndicator.HorizontalItemView(
            step: .mockCompleted,
            stepPosition: .first(nextProgress: .inProgress)
        )

        Warp.StepIndicator.HorizontalItemView(
            step: .mockInProgress,
            stepPosition: .middle(
                previousProgress: .complete,
                nextProgress: .incomplete
            )
        )

        Warp.StepIndicator.HorizontalItemView(
            step: .mockNotStarted,
            stepPosition: .last(previousProgress: .incomplete)
        )
    }
}
