import SwiftUI

extension Warp.StepIndicator {
    struct VerticalProgressShape: Shape, InsettableShape {
        let circleRadius: Double
        let pinWidth: Double
        let hasLine: Bool
        var insetAmount: Double

        init(
            circleRadius: Double = 10,
            pinWidth: Double = 2,
            hasLine: Bool,
            insetAmount: Double = 0.0
        ) {
            self.circleRadius = circleRadius
            self.pinWidth = pinWidth
            self.hasLine = hasLine
            self.insetAmount = insetAmount
        }

        func path(in rect: CGRect) -> Path {
            var path = Path()

            // Circle
            path.addArc(
                center: .init(x: rect.midX, y: rect.minY + (circleRadius - insetAmount)),
                radius: circleRadius - insetAmount,
                startAngle: .degrees(0),
                endAngle: .degrees(360),
                clockwise: false
            )

            if hasLine {
                let circleDiameter = circleRadius * 2
                let stickHeight = rect.height - (circleDiameter)
                let stickRect = CGRect(
                    x: rect.midX - (pinWidth / 2),
                    y: circleDiameter - 1,
                    width: pinWidth,
                    height: stickHeight
                )

                path.addRect(stickRect)
            }

            return path
        }

        func inset(by amount: CGFloat) -> some InsettableShape {
            var progressShape = self
            progressShape.insetAmount += amount
            return progressShape
        }

    }
    struct VerticalProgressView: View {
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
            Group {
                VStack {
                    switch progress {
                    case .notStarted:
                        VerticalProgressShape(
                            pinWidth: 1,
                            hasLine: !isLastStep
                        )
                        .strokeBorder(progress.borderColor(using: colorProvider), lineWidth: 1)
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

        var isLastStep: Bool {
            switch stepLocation {
            case .first:
                false
            case .middle:
                false
            case .last:
                true
            }
        }
    }
}

#Preview("Vertical Progress Views") {
    HStack {
        Warp.StepIndicator.VerticalProgressView(
            progress: .notStarted,
            stepLocation: .first(nextProgress: nil)
        )

        Warp.StepIndicator.VerticalProgressView(
            progress: .inProgress,
            stepLocation: .first(nextProgress: nil)
        )

        Warp.StepIndicator.VerticalProgressView(
            progress: .completed,
            stepLocation: .first(nextProgress: nil)
        )
    }
}
