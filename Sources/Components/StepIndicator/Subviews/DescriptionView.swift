import SwiftUI

extension Warp.StepIndicator {
    struct DescriptionView: View {
        let title: String
        let description: String
        let layoutOrientation: LayoutOrientation
        let progress: Warp.StepIndicatorItem.Progress
        let colorProvider: ColorProvider

        init(
            step: Warp.StepIndicatorItem,
            layoutOrientation: LayoutOrientation,
            colorProvider: ColorProvider = Warp.Config.colorProvider
        ) {
            self.init(
                title: step.title,
                description: step.description,
                layoutOrientation: layoutOrientation,
                progress: step.progress,
                colorProvider: colorProvider
            )
        }

        init(
            title: String,
            description: String,
            layoutOrientation: LayoutOrientation,
            progress: Warp.StepIndicatorItem.Progress,
            colorProvider: ColorProvider = Warp.Config.colorProvider
        ) {
            self.title = title
            self.description = description
            self.layoutOrientation = layoutOrientation
            self.progress = progress
            self.colorProvider = colorProvider
        }

        var body: some View {
            let alignment: HorizontalAlignment =
            switch layoutOrientation {
            case .horizontal:
                .center
            case .vertical:
                .leading
            }

            VStack(alignment: alignment, spacing: 8) {
                Warp.Text(
                    title,
                    style: .bodyStrong,
                    color: textColor
                )
                Warp.Text(
                    description,
                    style: .caption,
                    color: textColor
                )
            }
        }

        private var textColor: Color {
            switch progress {
            case .notStarted:
                colorProvider.token.textSubtle
            case .inProgress, .completed:
                colorProvider.token.text
            }
        }
    }
}

#Preview("Horizontal - In Progress") {
    Warp.StepIndicator.DescriptionView(
        title: "Step 1",
        description: "Step 1 - Description",
        layoutOrientation: .horizontal,
        progress: .inProgress
    )
}

#Preview("Vertical - In Progress") {
    Warp.StepIndicator.DescriptionView(
        title: "Step 1",
        description: "Step 1 - Description",
        layoutOrientation: .vertical,
        progress: .inProgress
    )
}

#Preview("Horizontal - Not Started") {
    Warp.StepIndicator.DescriptionView(
        title: "Step 1",
        description: "Step 1 - Description",
        layoutOrientation: .horizontal,
        progress: .notStarted
    )
}

#Preview("Vertical - Not Started") {
    Warp.StepIndicator.DescriptionView(
        title: "Step 1",
        description: "Step 1 - Description",
        layoutOrientation: .vertical,
        progress: .notStarted
    )
}
