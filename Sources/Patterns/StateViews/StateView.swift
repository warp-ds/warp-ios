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

    private let image: StateImage?
    private let tintColor: Color?
    private let imageContentDescription: String?
    private let title: String
    private let description: String?
    private let actionButton: StateButton?
    private let quietButton: StateButton?
    private let showLogo: Bool

    /// Initializes a `StateView` with the provided configuration parameters.
    ///
    /// - Parameters:
    ///   - image: An optional state image, either icon or illustration.
    ///   - tintColor: An optional tint color applied to the illustration.
    ///   - imageContentDescription: An optional accessibility description for the illustration.
    ///   - title: The title text to be displayed.
    ///   - description: An optional description text below the title.
    ///   - actionButton: An optional primary action button.
    ///   - quietButton: An optional secondary quiet action button.
    ///   - showLogo: Whether to display the brand logo endorsement.
    public init(
        image: StateImage? = nil,
        tintColor: Color? = nil,
        imageContentDescription: String? = nil,
        title: String,
        description: String? = nil,
        actionButton: StateButton? = nil,
        quietButton: StateButton? = nil,
        showLogo: Bool = false
    ) {
        self.image = image
        self.tintColor = tintColor
        self.imageContentDescription = imageContentDescription
        self.title = title
        self.description = description
        self.actionButton = actionButton
        self.quietButton = quietButton
        self.showLogo = showLogo
    }

    init(configuration: StateViewConfiguration) {
        self.image = configuration.image
        self.tintColor = configuration.tintColor
        self.imageContentDescription = configuration.imageContentDescription
        self.title = configuration.title
        self.description = configuration.description
        self.actionButton = configuration.actionButton
        self.quietButton = configuration.quietButton
        self.showLogo = configuration.showLogo
    }

    @ViewBuilder
    private var imageView: some View {
        switch image {
        case .none:
            EmptyView()
        case .icon(let icon):
            Warp.IconView(
                icon,
                size: .custom(64),
                color: Warp.Token.iconPrimary
            )
        case .illustration(let illustration):
            illustration
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .accessibilityLabel(imageContentDescription ?? "")
        }
    }

    private var textSectionView: some View {
        VStack(alignment: .center, spacing: Warp.Spacing.spacing50) {
            Warp.Text(title, style: .title3)
                .multilineTextAlignment(.center)

            if let description {
                Warp.Text(description, style: .body)
                    .lineLimit(nil) // Allow unlimited lines
                    .multilineTextAlignment(.center)
            }
        }
    }

    private var buttonSectionView: some View {
        VStack(spacing: Warp.Spacing.spacing150) {
            if let actionButton {
                Warp.Button(
                    title: actionButton.title,
                    action: actionButton.action,
                    type: .primary
                )
            }
            if let quietButton {
                Warp.Button(
                    title: quietButton.title,
                    action: quietButton.action,
                    type: .quiet
                )
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
            if showLogo {
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
        description: "Description description description you have to try",
        actionButton: .init(title: "Call To Action") {
            print("Primary Action") // swiftlint:disable:this no_print
        },
        quietButton: .init(title: "Secondary Button") {
            print("Secondary Action") // swiftlint:disable:this no_print
        },
        showLogo: true
    )
}
