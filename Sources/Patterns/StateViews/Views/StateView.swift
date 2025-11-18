import SwiftUI

public struct StateView: View {
    @ObservedObject var viewModel: StateViewModel

    @ViewBuilder
    private var imageView: some View {
        let size = viewModel.imageStyle.size
        let renderingMode: Image.TemplateRenderingMode = viewModel.tintColor != nil ? .template : .original

        if viewModel.imageStyle == .icon, let image = viewModel.icon?.image {
            image
                .resizable()
                .renderingMode(renderingMode)
                .foregroundColor(viewModel.tintColor)
                .frame(width: size.width, height: size.height)
                .padding(.bottom, Warp.Spacing.spacing200)
        }

        if viewModel.imageStyle == .illustration, let image = viewModel.illustration {
            image
                .resizable()
                .renderingMode(renderingMode)
                .foregroundColor(viewModel.tintColor)
                .frame(width: size.width, height: size.height)
                .padding(.bottom, Warp.Spacing.spacing200)
                .accessibilityLabel(viewModel.imageContentDescription ?? "")
        }
    }

    public init(viewModel: StateViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        VStack(alignment: .center, spacing: Warp.Spacing.spacing100) {
            imageView
            if let title = viewModel.title {
                Warp.Text(title, style: .title3)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, Warp.Spacing.spacing200)

            }

            if let description = viewModel.description {
                Warp.Text(description, style: .body)
                    .lineLimit(nil) // Allow unlimited lines
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, Warp.Spacing.spacing200)
            }

            Spacer().frame(height: Warp.Spacing.spacing100)

            if let primaryTitle = viewModel.actionButtonTitle {
                Warp.Button(
                    title: primaryTitle,
                    action: viewModel.primaryAction
                )
                .padding(Warp.Spacing.spacing200)
            }

            if let secondaryTitle = viewModel.secondaryButtonTitle {
                Warp.Button(
                    title: secondaryTitle,
                    action: viewModel.secondaryAction,
                    type: .secondary
                )
            }
        }
        .padding(.vertical, Warp.Spacing.spacing100)
        .frame(maxWidth: 600) // Constrain width on large screens (like iPad)
        .frame(maxWidth: .infinity, alignment: .center) // Center horizontally
    }
}

#Preview {
    let viewModel = StateViewModel(
        icon: Warp.Icon.check,
        imageStyle: .illustration,
        tintColor: .blue,
        title: "An unexpected error occured right now please retry",
        description: "Description description description you have to try",
        actionButtonTitle: "Call To Action",
        primaryAction: {
            print("Primary Action") // swiftlint:disable:this no_print
        },
        secondaryButtonTitle: "Secondary Button",
        secondaryAction: {
            print("Secodalry Action") // swiftlint:disable:this no_print
        }
    )

    StateView(viewModel: viewModel)
}
