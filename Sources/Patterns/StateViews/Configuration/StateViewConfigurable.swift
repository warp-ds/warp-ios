import SwiftUI

public protocol StateViewConfigurable {
    var configuration: StateViewConfiguration { get set }
}

public extension StateViewConfigurable {

    public func override(image: StateView.StateImage) -> Self {
        var copy = self
        copy.configuration.image = image
        return copy
    }

    public func override(tintColor: Color) -> Self {
        var copy = self
        copy.configuration.tintColor = tintColor
        return copy
    }

    public func override(imageContentDescription: String) -> Self {
        var copy = self
        copy.configuration.imageContentDescription = imageContentDescription
        return copy
    }

    public func override(title: String) -> Self {
        var copy = self
        copy.configuration.title = title
        return copy
    }

    public func override(description: String) -> Self {
        var copy = self
        copy.configuration.description = description
        return copy
    }

    public func override(actionButton: StateView.StateButton) -> Self {
        var copy = self
        copy.configuration.actionButton = actionButton
        return copy
    }

    public func override(quietButton: StateView.StateButton) -> Self {
        var copy = self
        copy.configuration.quietButton = quietButton
        return copy
    }

    public func override(showLogo: Bool) -> Self {
        var copy = self
        copy.configuration.showLogo = showLogo
        return copy
    }
}
