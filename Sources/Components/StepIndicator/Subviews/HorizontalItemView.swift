import SwiftUI

extension Warp.StepIndicator {
    struct HorizontalItemView: View {
        let step: Warp.StepIndicatorItem
        let stepLocation: Warp.StepIndicatorItem.StepLocation

        var body: some View {
            VStack(alignment: .center, spacing: 8) {
                Warp.StepIndicator.DescriptionView(
                    title: step.title,
                    description: step.description,
                    layoutOrientation: .horizontal
                )

                Warp.StepIndicator.HorizontalProgressView(
                    progress: step.progress,
                    stepLocation: stepLocation
                )
            }
        }
    }

}

#Preview("First Step") {
    VStack {
        Warp.StepIndicator.HorizontalItemView(
            step: .mockNotStarted,
            stepLocation: .first(nextProgress: nil)
        )

        Warp.StepIndicator.HorizontalItemView(
            step: .mockNotStarted,
            stepLocation: .first(nextProgress: .notStarted)
        )

        Warp.StepIndicator.HorizontalItemView(
            step: .mockInProgress,
            stepLocation: .first(nextProgress: nil)
        )

        Warp.StepIndicator.HorizontalItemView(
            step: .mockInProgress,
            stepLocation: .first(nextProgress: .notStarted)
        )

        Warp.StepIndicator.HorizontalItemView(
            step: .mockInProgress,
            stepLocation: .first(nextProgress: .inProgress)
        )

        Warp.StepIndicator.HorizontalItemView(
            step: .mockCompleted,
            stepLocation: .first(nextProgress: nil)
        )

        Warp.StepIndicator.HorizontalItemView(
            step: .mockCompleted,
            stepLocation: .first(nextProgress: .inProgress)
        )
    }
}

#Preview("Middle Step") {
    VStack {
        Warp.StepIndicator.HorizontalItemView(
            step: .mockNotStarted,
            stepLocation: .middle(
                previousProgress: .notStarted,
                nextProgress: .notStarted
            )
        )

        Warp.StepIndicator.HorizontalItemView(
            step: .mockNotStarted,
            stepLocation: .middle(
                previousProgress: .completed,
                nextProgress: .notStarted
            )
        )

        Warp.StepIndicator.HorizontalItemView(
            step: .mockInProgress,
            stepLocation: .middle(
                previousProgress: .completed,
                nextProgress: .notStarted
            )
        )

        Warp.StepIndicator.HorizontalItemView(
            step: .mockInProgress,
            stepLocation: .middle(
                previousProgress: .completed,
                nextProgress: .inProgress
            )
        )


        Warp.StepIndicator.HorizontalItemView(
            step: .mockCompleted,
            stepLocation: .middle(
                previousProgress: .completed,
                nextProgress: .notStarted
            )
        )

        Warp.StepIndicator.HorizontalItemView(
            step: .mockCompleted,
            stepLocation: .middle(
                previousProgress: .completed,
                nextProgress: .inProgress
            )
        )
    }
}

#Preview("Last Step") {
    VStack {
        Warp.StepIndicator.HorizontalItemView(
            step: .mockNotStarted,
            stepLocation: .last(previousProgress: .notStarted)
        )

        Warp.StepIndicator.HorizontalItemView(
            step: .mockNotStarted,
            stepLocation: .last(previousProgress: .inProgress)
        )

        Warp.StepIndicator.HorizontalItemView(
            step: .mockInProgress,
            stepLocation: .last(previousProgress: .notStarted)
        )

        Warp.StepIndicator.HorizontalItemView(
            step: .mockInProgress,
            stepLocation: .last(previousProgress: .inProgress)
        )

        Warp.StepIndicator.HorizontalItemView(
            step: .mockInProgress,
            stepLocation: .last(previousProgress: .completed)
        )

        Warp.StepIndicator.HorizontalItemView(
            step: .mockCompleted,
            stepLocation: .last(previousProgress: .notStarted)
        )

        Warp.StepIndicator.HorizontalItemView(
            step: .mockCompleted,
            stepLocation: .last(previousProgress: .inProgress)
        )

        Warp.StepIndicator.HorizontalItemView(
            step: .mockCompleted,
            stepLocation: .last(previousProgress: .completed)
        )
    }
}

#Preview("Combined") {
    HStack(spacing: 0) {
        Warp.StepIndicator.HorizontalItemView(
            step: .mockCompleted,
            stepLocation: .first(nextProgress: .inProgress)
        )

        Warp.StepIndicator.HorizontalItemView(
            step: .mockInProgress,
            stepLocation: .middle(
                previousProgress: .completed,
                nextProgress: .notStarted
            )
        )

        Warp.StepIndicator.HorizontalItemView(
            step: .mockNotStarted,
            stepLocation: .last(previousProgress: .notStarted)
        )
    }
}
