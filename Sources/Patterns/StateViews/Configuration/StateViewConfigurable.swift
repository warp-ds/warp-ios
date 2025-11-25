import SwiftUI

public protocol StateViewConfigurable {
    var configuration: StateViewConfiguration { get set }
}

public extension StateViewConfigurable {

    /// Changes the image displayed in the state view.
    /// - Parameter image: The new image to use.
    func override(image: StateView.StateImage) -> Self {
        var copy = self
        copy.configuration.image = image
        return copy
    }

    /// Changes the tint color applied to the image.
    /// - Parameter tintColor: The new tint color.
    func override(tintColor: Color) -> Self {
        var copy = self
        copy.configuration.tintColor = tintColor
        return copy
    }

    /// Changes the accessibility label for the image.
    /// - Parameter imageContentDescription: The new accessibility label.
    func override(imageContentDescription: String) -> Self {
        var copy = self
        copy.configuration.imageContentDescription = imageContentDescription
        return copy
    }

    /// Changes the title text displayed.
    /// - Parameter title: The new title string.
    func override(title: String) -> Self {
        var copy = self
        copy.configuration.title = title
        return copy
    }

    /// Changes the descriptive text displayed below the title.
    /// - Parameter description: The new description string.
    func override(description: String) -> Self {
        var copy = self
        copy.configuration.description = description
        return copy
    }

    /// Changes the primary action button configuration.
    /// - Parameter actionButton: The new primary action button.
    func override(actionButton: StateView.StateButton) -> Self {
        var copy = self
        copy.configuration.actionButton = actionButton
        return copy
    }

    /// Changes the secondary quiet action button configuration.
    /// - Parameter quietButton: The new quiet action button.
    func override(quietButton: StateView.StateButton) -> Self {
        var copy = self
        copy.configuration.quietButton = quietButton
        return copy
    }

    /// Changes whether the brand logo is shown.
    /// - Parameter showLogo: Boolean indicating the logo visibility.
    func override(showLogo: Bool) -> Self {
        var copy = self
        copy.configuration.showLogo = showLogo
        return copy
    }
}