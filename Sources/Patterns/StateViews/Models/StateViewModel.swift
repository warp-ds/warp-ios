import SwiftUI

public enum StateImageStyle {
    case icon
    case illustration

    var size: CGSize {
        switch self {
        case .icon: return CGSize(width: 64, height: 64)
        case .illustration: return CGSize(width: 200, height: 200)
        }
    }
}

public class StateViewModel: ObservableObject {
    @Published var icon: Warp.Icon?
    @Published var illustration: Image?
    @Published var imageStyle: StateImageStyle
    @Published var tintColor: Color?
    @Published var imageContentDescription: String?
    @Published var title: String?
    @Published var description: String?
    @Published var actionButtonTitle: String?
    @Published var secondaryButtonTitle: String?

    var primaryAction: () -> Void = {}
    var secondaryAction: () -> Void = {}

    public init(
        icon: Warp.Icon? = nil,
        illustration: Image? = nil,
        imageStyle: StateImageStyle = .icon,
        tintColor: Color? = nil,
        imageContentDescription: String? = nil,
        title: String? = nil,
        description: String? = nil,
        actionButtonTitle: String? = nil,
        primaryAction: @escaping () -> Void = {},
        secondaryButtonTitle: String? = nil,
        secondaryAction: @escaping () -> Void = {}
    ) {
        switch imageStyle {
        case .icon:
            if icon != nil {
                if imageContentDescription != nil {
                   debugPrint("⚠️ imageContentDescription is ignored when using Warp.Icon. We will use icon.localization instead. ⚠️")
                }
            }

        case .illustration:
            if illustration == nil {
                debugPrint("⚠️ Image must be provided when using .illustration style.")
            }
            if imageContentDescription?.isEmpty ?? true {
                debugPrint("⚠️ Accessibility description must be provided for illustrations. ⚠️")
            }
        }

        self.icon = icon
        self.illustration = illustration
        self.imageStyle = imageStyle
        self.tintColor = tintColor
        self.imageContentDescription = imageContentDescription

        self.title = title
        self.description = description

        self.actionButtonTitle = actionButtonTitle
        self.secondaryButtonTitle = secondaryButtonTitle

        self.primaryAction = primaryAction
        self.secondaryAction = secondaryAction
    }
}
