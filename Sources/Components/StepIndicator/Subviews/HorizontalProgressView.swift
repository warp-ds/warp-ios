import SwiftUI

extension Warp.StepIndicator {
    struct HorizontalProgressView: View {
        let colorProvider: ColorProvider
        let progress: Warp.StepIndicatorItem.Progress
        let stepPosition: Warp.StepIndicatorItem.Position
        let lineHeight: Double = 2

        init(
            colorProvider: ColorProvider = Warp.Color,
            progress: Warp.StepIndicatorItem.Progress,
            stepPosition: Warp.StepIndicatorItem.Position
        ) {
            self.colorProvider = colorProvider
            self.progress = progress
            self.stepPosition = stepPosition
        }

        var body: some View {
            HStack(alignment: .center, spacing: 0) {
                leadingView

                Group {
                    switch progress {
                    case .incomplete:
                        Circle()
                            .strokeBorder(
                                progress.borderColor(using: colorProvider),
                                lineWidth: lineHeight
                            )
                    case .inProgress:
                        Circle()
                            .fill(progress.fillColor(using: colorProvider))
                    case .complete:
                        Circle()
                            .fill(progress.fillColor(using: colorProvider))
                            .overlay(alignment: .leading) {
                                Image("icon-stepindicator-completed", bundle: .module)
                                    .renderingMode(.template)
                                    .foregroundColor(colorProvider.stepIndicatorHandleIcon)
                                    .frame(width: 16, height: 16)
                                    .offset(x: 2)
                            }
                    }
                }
                .frame(width: 20, height: 20, alignment: .center)

                trailingView
            }
            .accessibilityLabel(progress.accessibilityLabel)
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
                    orientation: .horizontal
                )
            case .last(let previousProgress):
                Warp.StepIndicator.LineBuilder.line(
                    for: previousProgress,
                    ownProgress: progress,
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
                        orientation: .horizontal
                    )
                } else {
                    EmptyView()
                }
            case .middle(_, let nextProgress):
                Warp.StepIndicator.LineBuilder.line(
                    for: nextProgress,
                    ownProgress: progress,
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
