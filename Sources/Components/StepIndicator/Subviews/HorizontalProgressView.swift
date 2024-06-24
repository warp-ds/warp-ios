import SwiftUI

extension Warp.StepIndicator {
    struct HorizontalProgressView: View {
        let colorProvider: ColorProvider
        let progress: Warp.StepIndicatorItem.Progress
        let stepPosition: Warp.StepIndicatorItem.Position

        init(
            colorProvider: ColorProvider = Warp.Config.colorProvider,
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
                            .strokeBorder(progress.borderColor(using: colorProvider), lineWidth: 1)
                    case .inProgress:
                        Circle()
                            .fill(progress.fillColor(using: colorProvider))
                    case .complete:
                        Circle()
                            .fill(progress.fillColor(using: colorProvider))
                            .overlay(alignment: .leading) {
                                Image("icon-stepindicator-completed", bundle: .module)
                                    .renderingMode(.template)
                                    .foregroundColor(colorProvider.token.iconInverted)
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
                        .frame(height: 1)
                } else {
                    EmptyView()
                }
            case .middle(let previousProgress, _):
                line(
                    for: previousProgress,
                    ownProgress: progress
                )
            case .last(let previousProgress):
                line(
                    for: previousProgress,
                    ownProgress: progress
                )
            }
        }

        @ViewBuilder
        private var trailingView: some View {
            switch stepPosition {
            case .first(let nextProgress):
                if let nextProgress {
                    line(
                        for: nextProgress,
                        ownProgress: progress
                    )
                } else {
                    EmptyView()
                }
            case .middle(_, let nextProgress):
                line(
                    for: nextProgress,
                    ownProgress: progress
                )
            case .last:
                Rectangle()
                    .fill(.clear)
                    .frame(height: 1)
            }
        }

        @ViewBuilder
        private func line(
            for previousProgress: Warp.StepIndicatorItem.Progress,
            ownProgress: Warp.StepIndicatorItem.Progress
        ) -> some View {
            switch previousProgress {
            case .incomplete:
                Rectangle()
                    .fill(colorProvider.token.backgroundDisabled)
                    .frame(height: 1)
            case .inProgress, .complete:
                let fillColor = ownProgress == .incomplete ?
                    colorProvider.token.backgroundDisabled :
                    colorProvider.token.backgroundPrimary
                Rectangle()
                    .fill(fillColor)
                    .frame(height: 1)
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
