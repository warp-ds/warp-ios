import SwiftUI

public struct StateViewConfiguration {
    var image: StateView.StateImage?
    var tintColor: Color?
    var imageContentDescription: String?
    var title: String
    var description: String?
    var actionButton: StateView.StateButton?
    var quietButton: StateView.StateButton?
    var showLogo: Bool

    init(
        image: StateView.StateImage? = nil,
        tintColor: Color? = nil,
        imageContentDescription: String? = nil,
        title: String,
        description: String? = nil,
        actionButton: StateView.StateButton? = nil,
        quietButton: StateView.StateButton? = nil,
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
}
