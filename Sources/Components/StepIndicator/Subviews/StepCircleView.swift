import SwiftUI

extension Warp.StepIndicator {
    /// The circle marker of a step. Shows an icon, a step number, or nothing depending on progress.
    struct StepCircleView: View {
        let progress: Warp.StepIndicatorItem.Progress
        /// 1-based step number. When set, active and upcoming steps display it.
        let number: Int?
        let lineWidth: Double = 2

        @Environment(\.warpTheme) private var theme

        private var colorProvider: ColorProvider {
            theme.colors
        }

        var body: some View {
            Group {
                switch progress {
                case .incomplete:
                    Circle()
                        .strokeBorder(progress.borderColor(using: colorProvider), lineWidth: lineWidth)
                        .background(Circle().fill(progress.fillColor(using: colorProvider)))
                        .overlay { numberView(color: colorProvider.token.text) }
                case .inProgress:
                    Circle()
                        .strokeBorder(progress.borderColor(using: colorProvider), lineWidth: lineWidth)
                        .overlay { numberView(color: colorProvider.token.text) }
                case .complete:
                    Circle()
                        .fill(progress.fillColor(using: colorProvider))
                        .overlay { iconView("step-indicator-check", color: colorProvider.token.iconInverted) }
                case .error:
                    Circle()
                        .strokeBorder(progress.borderColor(using: colorProvider), lineWidth: lineWidth)
                        .background(Circle().fill(progress.fillColor(using: colorProvider)))
                        .overlay { iconView("step-indicator-cross", color: colorProvider.token.icon) }
                }
            }
            .frame(width: 20, height: 20)
        }

        private func iconView(_ name: String, color: Color) -> some View {
            Image(name, bundle: .module)
                .renderingMode(.template)
                .resizable()
                .foregroundColor(color)
                .frame(width: 20, height: 20)
        }

        @ViewBuilder
        private func numberView(color: Color) -> some View {
            if let number {
                Warp.Text("\(number)", style: .detailStrong, color: color)
                    .minimumScaleFactor(0.5)
                    .lineLimit(1)
                    .accessibilityHidden(true)
            }
        }
    }
}

#Preview("Step circles") {
    HStack {
        ForEach([.incomplete, .inProgress, .complete, .error] as [Warp.StepIndicatorItem.Progress], id: \.self) {
            Warp.StepIndicator.StepCircleView(progress: $0, number: nil)
            Warp.StepIndicator.StepCircleView(progress: $0, number: 2)
        }
    }
}
