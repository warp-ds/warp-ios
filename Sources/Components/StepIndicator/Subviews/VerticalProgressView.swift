import SwiftUI

extension Warp.StepIndicator {
    struct VerticalProgressView: View {
        let colorProvider: ColorProvider
        let progress: Warp.StepIndicatorItem.Progress
        let isLastStep: Bool

        init(
            colorProvider: ColorProvider = Warp.Config.colorProvider,
            progress: Warp.StepIndicatorItem.Progress,
            isLastStep: Bool
        ) {
            self.colorProvider = colorProvider
            self.progress = progress
            self.isLastStep = isLastStep
        }

        var body: some View {
            Group {
                VStack {
                    switch progress {
                    case .notStarted:
                        VerticalProgressShape(hasLine: !isLastStep)
                            .strokeBorder(progress.borderColor(using: colorProvider), lineWidth: 2)
                    case .inProgress:
                        VerticalProgressShape(hasLine: !isLastStep)
                            .fill(progress.fillColor(using: colorProvider))
                    case .completed:
                        VerticalProgressShape(hasLine: !isLastStep)
                            .fill(progress.fillColor(using: colorProvider))
                            .overlay(alignment: .top) {
                                Image("icon-stepindicator-completed", bundle: .module)
                                    .renderingMode(.template)
                                    .foregroundColor(colorProvider.token.iconInverted)
                                    .frame(width: 16, height: 16)
                                    .offset(y: 2)
                            }
                    }
                }
            }
            .frame(width: 20)
        }
    }
}

#Preview("Vertical Progress Views") {
    HStack {
        Warp.StepIndicator.VerticalProgressView(
            progress: .notStarted,
            isLastStep: false
        )

        Warp.StepIndicator.VerticalProgressView(
            progress: .inProgress,
            isLastStep: false
        )

        Warp.StepIndicator.VerticalProgressView(
            progress: .completed,
            isLastStep: false
        )

    }
}
