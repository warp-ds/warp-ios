import SwiftUI

extension Warp.StepIndicator {
    struct HorizontalProgressView: View {
        let colorProvider: ColorProvider
        let progress: Warp.StepIndicatorItem.Progress
        let stepLocation: Warp.StepIndicatorItem.StepLocation

        init(
            colorProvider: ColorProvider = Warp.Config.colorProvider,
            progress: Warp.StepIndicatorItem.Progress,
            stepLocation: Warp.StepIndicatorItem.StepLocation
        ) {
            self.colorProvider = colorProvider
            self.progress = progress
            self.stepLocation = stepLocation
        }

        var body: some View {
            HStack(alignment: .center, spacing: 0) {
                leadingView

                Group {
                    switch progress {
                    case .notStarted:
                        Circle()
                            .strokeBorder(progress.borderColor(using: colorProvider), lineWidth: 1)
                    case .inProgress:
                        Circle()
                            .fill(progress.fillColor(using: colorProvider))
                    case .completed:
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
        }

        @ViewBuilder
        private var leadingView: some View {
            switch stepLocation {
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
            switch stepLocation {
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
            case .notStarted:
                Rectangle()
                    .fill(colorProvider.token.backgroundDisabled)
                    .frame(height: 1)
            case .inProgress, .completed:
                let fillColor = ownProgress == .notStarted ?
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
            progress: .notStarted,
            stepLocation: .first(nextProgress: nil)
        )

        Warp.StepIndicator.HorizontalProgressView(
            progress: .notStarted,
            stepLocation: .first(nextProgress: .notStarted)
        )

        Warp.StepIndicator.HorizontalProgressView(
            progress: .inProgress,
            stepLocation: .first(nextProgress: .inProgress)
        )

        Warp.StepIndicator.HorizontalProgressView(
            progress: .completed,
            stepLocation: .first(nextProgress: .completed)
        )
    }
    .padding(.horizontal, 2)
}

#Preview("Middle Step Horizontal Progress Views") {
    VStack {
        Warp.StepIndicator.HorizontalProgressView(
            progress: .notStarted,
            stepLocation: .middle(
                previousProgress: .notStarted,
                nextProgress: .notStarted
            )
        )

        Warp.StepIndicator.HorizontalProgressView(
            progress: .notStarted,
            stepLocation: .middle(
                previousProgress: .completed,
                nextProgress: .notStarted
            )
        )

        Warp.StepIndicator.HorizontalProgressView(
            progress: .inProgress,
            stepLocation: .middle(
                previousProgress: .completed,
                nextProgress: .notStarted
            )
        )

        Warp.StepIndicator.HorizontalProgressView(
            progress: .completed,
            stepLocation: .middle(
                previousProgress: .completed,
                nextProgress: .notStarted
            )
        )

        Warp.StepIndicator.HorizontalProgressView(
            progress: .completed,
            stepLocation: .middle(
                previousProgress: .completed,
                nextProgress: .completed
            )
        )

    }
}

#Preview("Last Step Horizontal Progress Views") {
    VStack {
        Warp.StepIndicator.HorizontalProgressView(
            progress: .notStarted,
            stepLocation: .last(previousProgress: .notStarted)
        )

        Warp.StepIndicator.HorizontalProgressView(
            progress: .notStarted,
            stepLocation: .last(previousProgress: .inProgress)
        )

        Warp.StepIndicator.HorizontalProgressView(
            progress: .notStarted,
            stepLocation: .last(previousProgress: .completed)
        )

        Warp.StepIndicator.HorizontalProgressView(
            progress: .inProgress,
            stepLocation: .last(previousProgress: .completed)
        )

        Warp.StepIndicator.HorizontalProgressView(
            progress: .completed,
            stepLocation: .last(previousProgress: .completed)
        )
    }
}
