import SwiftUI

extension Warp.StepIndicator {
    struct VerticalProgressView: View {
        let colorProvider: ColorProvider
        let progress: Warp.StepIndicatorItem.Progress
        let stepPosition: Warp.StepIndicatorItem.Position
        let lineWidth: Double = 2
        
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
            VStack(alignment: .center, spacing: 0) {
                switch progress {
                case .incomplete:
                    Circle()
                        .strokeBorder(
                            progress.borderColor(using: colorProvider),
                            lineWidth: lineWidth
                        )
                        .frame(width: 20, height: 20)
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
                
                lineView
            }
            .frame(width: 20)
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
                        orientation: .vertical
                    )
                } else {
                    Spacer()
                }
            case .middle(_, let nextProgress):
                LineBuilder.line(
                    for: nextProgress,
                    ownProgress: progress,
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
