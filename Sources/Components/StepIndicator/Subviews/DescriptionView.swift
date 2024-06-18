import SwiftUI

extension Warp.StepIndicator {
    struct DescriptionView: View {
        let title: String
        let description: String
        let layoutOrientation: LayoutOrientation
        let colorProvider: ColorProvider

        init(
            title: String,
            description: String,
            layoutOrientation: LayoutOrientation,
            colorProvider: ColorProvider = Warp.Config.colorProvider
        ) {
            self.title = title
            self.description = description
            self.layoutOrientation = layoutOrientation
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
                Warp.Text(title, style: .bodyStrong, color: colorProvider.token.textSubtle)
                Warp.Text(description, style: .caption, color: colorProvider.token.textSubtle)
            }
        }
    }
}

#Preview("Horizontal") {
    Warp.StepIndicator.DescriptionView(
        title: "Step 1",
        description: "Step 1 - Description",
        layoutOrientation: .horizontal
    )
}

#Preview("Vertical") {
    Warp.StepIndicator.DescriptionView(
        title: "Step 1",
        description: "Step 1 - Description",
        layoutOrientation: .vertical
    )
}
