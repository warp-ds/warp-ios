import SwiftUI

extension Warp.StepIndicator {
    struct VerticalProgressView: View {
        let progress: Warp.StepIndicatorItem.Progress
        let stepPosition: Warp.StepIndicatorItem.Position
        let number: Int?
        let lineWidth: Double = 2

        /// The current theme from the environment.
        @Environment(\.warpTheme) private var theme

        /// Object responsible for providing colors in different environments and variants.
        private var colorProvider: ColorProvider {
            theme.colors
        }

        init(
            progress: Warp.StepIndicatorItem.Progress,
            stepPosition: Warp.StepIndicatorItem.Position,
            number: Int? = nil
        ) {
            self.number = number
            self.progress = progress
            self.stepPosition = stepPosition
        }
        
        var body: some View {
            VStack(alignment: .center, spacing: Warp.Spacing.spacing50) {
                Warp.StepIndicator.StepCircleView(progress: progress, number: number)

                lineView
            }
            .frame(width: 20)
            .accessibilityElement(children: .ignore)
            .accessibilityLabel(progress.accessibilityLabel)
        }
        
        @ViewBuilder
        private var lineView: some View {
            switch stepPosition {
            case .first(let nextProgress):
                if let nextProgress {
                    LineBuilder.line(
                        for: nextProgress,
                        ownProgress: progress,
                        otherIsPrevious: false,
                        colorProvider: colorProvider,
                        orientation: .vertical
                    )
                } else {
                    Spacer()
                }
            case .middle(_, let nextProgress):
                LineBuilder.line(
                    for: nextProgress,
                    ownProgress: progress,
                    otherIsPrevious: false,
                    colorProvider: colorProvider,
                    orientation: .vertical
                )
            case .last:
                Spacer()
            }
        }
    }
}

#Preview("Vertical Progress Views") {
    HStack {
        Warp.StepIndicator.VerticalProgressView(
            progress: .incomplete,
            stepPosition: .first(nextProgress: nil)
        )

        Warp.StepIndicator.VerticalProgressView(
            progress: .inProgress,
            stepPosition: .first(nextProgress: nil)
        )

        Warp.StepIndicator.VerticalProgressView(
            progress: .complete,
            stepPosition: .first(nextProgress: nil)
        )

        Warp.StepIndicator.VerticalProgressView(
            progress: .inProgress,
            stepPosition: .first(nextProgress: .incomplete)
        )

        Warp.StepIndicator.VerticalProgressView(
            progress: .inProgress,
            stepPosition: .first(nextProgress: .inProgress)
        )
        Warp.StepIndicator.VerticalProgressView(
            progress: .inProgress,
            stepPosition: .first(nextProgress: .complete)
        )

        Warp.StepIndicator.VerticalProgressView(
            progress: .complete,
            stepPosition: .first(nextProgress: .incomplete)
        )

        Warp.StepIndicator.VerticalProgressView(
            progress: .complete,
            stepPosition: .first(nextProgress: .inProgress)
        )
        Warp.StepIndicator.VerticalProgressView(
            progress: .complete,
            stepPosition: .first(nextProgress: .complete)
        )
    }
}
