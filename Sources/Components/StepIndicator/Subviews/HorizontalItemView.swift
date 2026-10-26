import SwiftUI

extension Warp.StepIndicator {
    struct HorizontalItemView: View {
        let step: Warp.StepIndicatorItem
        let stepPosition: Warp.StepIndicatorItem.Position
        var number: Int? = nil
        /// Custom title slot. `nil` renders the default `Warp.StepIndicator.TitleView`.
        var titleView: AnyView? = nil

        var body: some View {
            VStack(alignment: .center, spacing: Warp.Spacing.spacing100) {
                (titleView ?? AnyView(
                    Warp.StepIndicator.TitleView(step: step, layoutOrientation: .horizontal)
                ))
                .padding(.horizontal, Warp.Spacing.spacing100)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)

                Warp.StepIndicator.HorizontalProgressView(
                    progress: step.progress,
                    stepPosition: stepPosition,
                    number: number
                )
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
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
