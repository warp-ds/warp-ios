import SwiftUI

extension Warp.StepIndicator {
    struct HorizontalProgressView: View {
        let progress: Warp.StepIndicatorItem.Progress
        let stepPosition: Warp.StepIndicatorItem.Position
        let number: Int?
        let lineHeight: Double = 2

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
            HStack(alignment: .center, spacing: Warp.Spacing.spacing50) {
                leadingView

                Warp.StepIndicator.StepCircleView(progress: progress, number: number)

                trailingView
            }
            // The state is announced by the enclosing item view.
            .accessibilityHidden(true)
        }

        @ViewBuilder
        private var leadingView: some View {
            switch stepPosition {
            case .first(let nextProgress):
                if nextProgress != nil {
                    Rectangle()
                        .fill(.clear)
                        .frame(height: lineHeight)
                } else {
                    EmptyView()
                }
            case .middle(let previousProgress, _):
                Warp.StepIndicator.LineBuilder.line(
                    for: previousProgress,
                    ownProgress: progress,
                    otherIsPrevious: true,
                    colorProvider: colorProvider,
                    orientation: .horizontal
                )
            case .last(let previousProgress):
                Warp.StepIndicator.LineBuilder.line(
                    for: previousProgress,
                    ownProgress: progress,
                    otherIsPrevious: true,
                    colorProvider: colorProvider,
                    orientation: .horizontal
                )
            }
        }

        @ViewBuilder
        private var trailingView: some View {
            switch stepPosition {
            case .first(let nextProgress):
                if let nextProgress {
                    Warp.StepIndicator.LineBuilder.line(
                        for: nextProgress,
                        ownProgress: progress,
                        otherIsPrevious: false,
                        colorProvider: colorProvider,
                        orientation: .horizontal
                    )
                } else {
                    EmptyView()
                }
            case .middle(_, let nextProgress):
                Warp.StepIndicator.LineBuilder.line(
                    for: nextProgress,
                    ownProgress: progress,
                    otherIsPrevious: false,
                    colorProvider: colorProvider,
                    orientation: .horizontal
                )
            case .last:
                Rectangle()
                    .fill(.clear)
                    .frame(height: lineHeight)
            }
        }
    }
}

#Preview("First Step Horizontal Progress Views") {
    VStack {
        Warp.StepIndicator.HorizontalProgressView(
            progress: .incomplete,
            stepPosition: .first(nextProgress: nil)
        )

        Warp.StepIndicator.HorizontalProgressView(
            progress: .incomplete,
            stepPosition: .first(nextProgress: .incomplete)
        )

        Warp.StepIndicator.HorizontalProgressView(
            progress: .inProgress,
            stepPosition: .first(nextProgress: .inProgress)
        )

        Warp.StepIndicator.HorizontalProgressView(
            progress: .complete,
            stepPosition: .first(nextProgress: .complete)
        )
    }
    .padding(.horizontal, 2)
}

#Preview("Middle Step Horizontal Progress Views") {
    VStack {
        Warp.StepIndicator.HorizontalProgressView(
            progress: .incomplete,
            stepPosition: .middle(
                previousProgress: .incomplete,
                nextProgress: .incomplete
            )
        )

        Warp.StepIndicator.HorizontalProgressView(
            progress: .incomplete,
            stepPosition: .middle(
                previousProgress: .complete,
                nextProgress: .incomplete
            )
        )

        Warp.StepIndicator.HorizontalProgressView(
            progress: .inProgress,
            stepPosition: .middle(
                previousProgress: .complete,
                nextProgress: .incomplete
            )
        )

        Warp.StepIndicator.HorizontalProgressView(
            progress: .complete,
            stepPosition: .middle(
                previousProgress: .complete,
                nextProgress: .incomplete
            )
        )

        Warp.StepIndicator.HorizontalProgressView(
            progress: .complete,
            stepPosition: .middle(
                previousProgress: .complete,
                nextProgress: .complete
            )
        )

    }
}

#Preview("Last Step Horizontal Progress Views") {
    VStack {
        Warp.StepIndicator.HorizontalProgressView(
            progress: .incomplete,
            stepPosition: .last(previousProgress: .incomplete)
        )

        Warp.StepIndicator.HorizontalProgressView(
            progress: .incomplete,
            stepPosition: .last(previousProgress: .inProgress)
        )

        Warp.StepIndicator.HorizontalProgressView(
            progress: .incomplete,
            stepPosition: .last(previousProgress: .complete)
        )

        Warp.StepIndicator.HorizontalProgressView(
            progress: .inProgress,
            stepPosition: .last(previousProgress: .complete)
        )

        Warp.StepIndicator.HorizontalProgressView(
            progress: .complete,
            stepPosition: .last(previousProgress: .complete)
        )
    }
}
