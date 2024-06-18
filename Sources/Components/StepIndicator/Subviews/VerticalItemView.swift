import SwiftUI

extension Warp.StepIndicator {
    struct VerticalItemView: View {
        let step: Warp.StepIndicatorItem
        let stepLocation: Warp.StepIndicatorItem.StepLocation

        var body: some View {
            HStack(alignment: .top, spacing: 8) {
                Warp.StepIndicator.VerticalProgressView(
                    progress: step.progress,
                    stepLocation: stepLocation
                )
                Warp.StepIndicator.DescriptionView(
                    title: step.title,
                    description: step.description,
                    layoutOrientation: .vertical
                )
                Spacer()
            }
        }
    }
}

#Preview("Not Started") {
    Warp.StepIndicator.VerticalItemView(
        step: .mockNotStarted,
        stepLocation: .first(nextProgress: nil)
    )
}

#Preview("In Progress") {
    Warp.StepIndicator.VerticalItemView(
        step: .mockInProgress,
        stepLocation: .first(nextProgress: nil)
    )
}

#Preview("Completed") {
    Warp.StepIndicator.VerticalItemView(
        step: .mockCompleted,
        stepLocation: .first(nextProgress: nil)
    )
}

#Preview("Combined") {
    VStack(spacing: -1) {
        Warp.StepIndicator.VerticalItemView(
            step: .mockCompleted,
            stepLocation: .first(nextProgress: nil)
        )
        Warp.StepIndicator.VerticalItemView(
            step: .mockInProgress,
            stepLocation: .first(nextProgress: nil)
        )
        Warp.StepIndicator.VerticalItemView(
            step: .mockNotStarted,
            stepLocation: .first(nextProgress: nil)
        )
    }
    .padding()
}
