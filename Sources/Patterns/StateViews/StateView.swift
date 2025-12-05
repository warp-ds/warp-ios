import SwiftUI

/// A versatile state view component that displays a visual state representation with optional image, title, description, and buttons, styled for WARP.
/// The component supports either an icon or illustration image, optional tint color, customizable accessibility description for the image, primary and secondary action buttons, and an optional brand logo endorsement.
///
/// **Usage:**
/// ```
/// StateView(
///    image: .icon(.check),
///    tintColor: .blue,
///    imageContentDescription: "Check icon",
///    title: "Operation Successful",
///    description: "Your changes have been saved.",
///    actionButton: StateView.StateButton(title: "Retry") {
///       print("Retry tapped")
///    },
///    quietButton: StateView.StateButton(title: "Cancel") {
///       print("Cancel tapped")
///    },
///    showLogo: true
/// )
/// ```
public struct StateView: View {

    /// Represents the types of images supported in the state view: either an icon from Warp.Icon or a custom illustration image.
    public enum StateImage {
        case icon(Warp.Icon)
        case illustration(Image)
    }

    /// Encapsulates a button with a title and an action closure to be used in the state view for user interaction.
    public struct StateButton {
        let title: String
        let action: () -> Void

        /// Creates a state button with a title and action.
        ///
        /// - Parameters:
        ///   - title: The text to display on the button.
        ///   - action: The action to perform when the button is pressed.
        public init(title: String, action: @escaping () -> Void) {
            self.title = title
            self.action = action
        }
    }

    private let configuration: StateViewConfiguration

    /// Initializes a `StateView` with the provided configuration parameters.
    ///
    /// - Parameters:
    ///   - image: An optional state image, either icon or illustration.
    ///   - imageWidth: An optional width for the image(overrides default icon size/illustration width, not recommended).
    ///   - imageHeight: An optional height for the image (overrides default illustration height, not recommended).
    ///   - tintColor: An optional tint color applied to the illustration.
    ///   - imageContentDescription: An optional accessibility description for the illustration.
    ///   - title: The title text to be displayed.
    ///   - description: An optional description text below the title.
    ///   - actionButton: An optional primary action button.
    ///   - quietButton: An optional secondary quiet action button.
    ///   - showLogo: Whether to display the brand logo endorsement.
    public init(
        image: StateImage? = nil,
        imageWidth: CGFloat? = nil,
        imageHeight: CGFloat? = nil,
        tintColor: Color? = nil,
        imageContentDescription: String? = nil,
        title: String,
        description: String? = nil,
        actionButton: StateButton? = nil,
        quietButton: StateButton? = nil,
        showLogo: Bool = false
    ) {
        configuration = StateViewConfiguration(
            image: image,
            imageWidth: imageWidth,
            imageHeight: imageHeight,
            tintColor: tintColor,
            imageContentDescription: imageContentDescription,
            title: title,
            description: description,
            actionButton: actionButton,
            quietButton: quietButton,
            showLogo: showLogo
        )
    }

    public init(configuration: StateViewConfiguration) {
        self.configuration = configuration
    }

    @ViewBuilder
    private var imageView: some View {
        switch configuration.image {
        case .none:
            EmptyView()
        case .icon(let icon):
            Warp.IconView(
                icon,
                size: .custom(configuration.imageWidth ?? 64),
                color: Warp.Token.iconPrimary
            )
        case .illustration(let illustration):
            illustration
                .resizable()
                .scaledToFit()
                .frame(width: configuration.imageWidth ?? 200, height: configuration.imageHeight ?? 200)
                .accessibilityLabel(configuration.imageContentDescription ?? "")
        }
    }

    private var textSectionView: some View {
        VStack(alignment: .center, spacing: Warp.Spacing.spacing50) {
            Warp.Text(configuration.title, style: .title3)
              .lineLimit(2)
              .multilineTextAlignment(.center)

            if let description = configuration.description {
                if #available(iOS 16.4, *) { // Make it scrollable if content is too long
                    Warp.Text(description, style: .body)
                      .lineLimit(nil) // Allow unlimited lines
                      .multilineTextAlignment(.center)
                      .colorMultiply(.clear)
                      .overlay {
                          ScrollView(.vertical) {
                              Warp.Text(description, style: .body)
                                .lineLimit(nil) // Allow unlimited lines
                                .multilineTextAlignment(.center)
                          }
                            .scrollBounceBehavior(.basedOnSize)
                      }
                } else {
                    Warp.Text(description, style: .body)
                      .lineLimit(nil) // Allow unlimited lines
                      .multilineTextAlignment(.center)
                }
            }
        }
    }

    private var buttonSectionView: some View {
        VStack(spacing: Warp.Spacing.spacing150) {
            if let actionButton = configuration.actionButton {
                Warp.Button(
                    title: actionButton.title,
                    action: actionButton.action,
                    type: .primary
                )
                  .makeMultilineAndCentered()
            }
            if let quietButton = configuration.quietButton {
                Warp.Button(
                    title: quietButton.title,
                    action: quietButton.action,
                    type: .quiet
                )
                .makeMultilineAndCentered()
            }
        }
    }

    private var endorsementView: some View {
        var logoName = "VendLogoTagLine"
        switch Warp.Theme {
        case .finn, .blocket:
            logoName.append("NO_SE")
        case .tori:
            logoName.append("FI")
        case .dba:
            logoName.append("DA")
        case .vend, .neutral:
            logoName.append("EN")
        }
        return Image.warpIcon(named: logoName)
          .resizable()
          .frame(width: 72, height: 38)
    }

    public var body: some View {
        VStack(alignment: .center, spacing: Warp.Spacing.spacing300) {
            imageView
            textSectionView
            buttonSectionView
            if configuration.showLogo {
                endorsementView
            }
        }
        .padding(Warp.Spacing.spacing400)
        .frame(maxWidth: 420) // Constrain width on large screens (like iPad)
        .frame(maxHeight: .infinity, alignment: .center)
    }
}

#Preview {
    StateView(
        image: .icon(.check),
        title: "An unexpected error occured right now please retry",
        description: "Description description description you have to try. Description description description you have to try. Description description description you have to try",
        actionButton: .init(title: "Call To Action") {
            print("Primary Action") // swiftlint:disable:this no_print
        },
        quietButton: .init(title: "Secondary Button") {
            print("Secondary Action") // swiftlint:disable:this no_print
        },
        showLogo: true
    )
}
