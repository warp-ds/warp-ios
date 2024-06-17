import SwiftUI

extension Warp {
    enum LayoutOrientation {
        case horizontal
        case vertical
    }
    struct StepIndicator: View {
        let layoutOrientation: LayoutOrientation

        /// Object responsible for providing colors in different environments and variants.
        let colorProvider: ColorProvider

        public init(
            layoutOrientation: LayoutOrientation,
            colorProvider: ColorProvider = Config.colorProvider
        ) {
            self.layoutOrientation = layoutOrientation
            self.colorProvider = colorProvider
        }

        var body: some View {
            SwiftUI.Text("Hello, World!")
        }

        struct Description: View {
            let title: String
            let description: String
            let layoutOrientation: LayoutOrientation
            let colorProvider: ColorProvider

            init(
                title: String,
                description: String,
                layoutOrientation: LayoutOrientation,
                colorProvider: ColorProvider = Config.colorProvider
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
}

#Preview {
    Warp.StepIndicator(
        layoutOrientation: .horizontal
    )
}

#Preview("Step Descriptions") {
    VStack(spacing: 8) {
        Warp.StepIndicator.Description(
            title: "Step 1",
            description: "Step Description Vertical",
            layoutOrientation: .vertical
        )

        Warp.StepIndicator.Description(
            title: "Step 1",
            description: "Step Description Horizontal",
            layoutOrientation: .horizontal
        )
    }
}
