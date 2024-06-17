import SwiftUI

extension Warp.StepIndicator {
    struct HorizontalProgressView: View {
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
                        HorizontalProgressShape(hasLine: !isLastStep)
                            .strokeBorder(progress.borderColor(using: colorProvider), lineWidth: 1)
                    case .inProgress:
                        HorizontalProgressShape(hasLine: !isLastStep)
                            .fill(progress.fillColor(using: colorProvider))
                    case .completed:
                        HorizontalProgressShape(hasLine: !isLastStep)
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
            }
            .frame(height: 20)
        }
    }
}

#Preview("Horizontal Progress Views") {
    VStack {
        Warp.StepIndicator.HorizontalProgressView(
            progress: .notStarted,
            isLastStep: false
        )
        Warp.StepIndicator.HorizontalProgressView(
            progress: .inProgress,
            isLastStep: false
        )
        Warp.StepIndicator.HorizontalProgressView(
            progress: .completed,
            isLastStep: false
        )
    }
    .padding(.horizontal, 2)
}
