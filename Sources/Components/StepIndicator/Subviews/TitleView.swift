import SwiftUI

extension Warp.StepIndicator {
    /// Default title and subtitle of a step, formatted for the given layout orientation.
    ///
    /// Use it directly, or as a building block inside a custom title slot of `Warp.StepIndicator`.
    public struct TitleView: View {
        public let title: String
        public let subtitle: String
        public let layoutOrientation: LayoutOrientation
        public let progress: Warp.StepIndicatorItem.Progress

        /// The current theme from the environment.
        @Environment(\.warpTheme) private var theme

        /// Object responsible for providing colors in different environments and variants.
        private var colorProvider: ColorProvider {
            theme.colors
        }

        public init(
            step: Warp.StepIndicatorItem,
            layoutOrientation: LayoutOrientation
        ) {
            self.init(
                title: step.title,
                subtitle: step.description,
                layoutOrientation: layoutOrientation,
                progress: step.progress
            )
        }

        public init(
            title: String,
            subtitle: String,
            layoutOrientation: LayoutOrientation,
            progress: Warp.StepIndicatorItem.Progress
        ) {
            self.title = title
            self.subtitle = subtitle
            self.layoutOrientation = layoutOrientation
            self.progress = progress
        }

        public var body: some View {
            let alignment: HorizontalAlignment =
            switch layoutOrientation {
            case .horizontal:
                .center
            case .vertical:
                .leading
            }

            VStack(alignment: alignment, spacing: Warp.Spacing.spacing50) {
                Warp.Text(
                    title,
                    style: .bodyStrong,
                    color: textColor
                )
                Warp.Text(
                    subtitle,
                    style: .caption,
                    color: textColor
                )
            }
            .accessibilityElement(children: .combine)
        }

        private var textColor: Color {
            switch progress {
            case .incomplete, .error:
                colorProvider.token.textSubtle
            case .inProgress, .complete:
                colorProvider.token.text
            }
        }
    }
}

#Preview("Horizontal - In Progress") {
    Warp.StepIndicator.TitleView(
        title: "Step 1",
        subtitle: "Step 1 - Description",
        layoutOrientation: .horizontal,
        progress: .inProgress
    )
}

#Preview("Vertical - In Progress") {
    Warp.StepIndicator.TitleView(
        title: "Step 1",
        subtitle: "Step 1 - Description",
        layoutOrientation: .vertical,
        progress: .inProgress
    )
}

#Preview("Horizontal - Not Started") {
    Warp.StepIndicator.TitleView(
        title: "Step 1",
        subtitle: "Step 1 - Description",
        layoutOrientation: .horizontal,
        progress: .incomplete
    )
}

#Preview("Vertical - Not Started") {
    Warp.StepIndicator.TitleView(
        title: "Step 1",
        subtitle: "Step 1 - Description",
        layoutOrientation: .vertical,
        progress: .incomplete
    )
}
