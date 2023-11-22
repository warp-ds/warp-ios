import Foundation
import SwiftUI

extension Warp.Button {
    private static let utilityOverlayType: Warp.ButtonType = .utilityOverlay

    /// Factory method for creating warp button with `UtilityOverlay` style.
    static func createUtilityOverlay(
        title: String,
        icon: Image? = nil,
        action: @escaping () -> Void = {},
        size: Warp.ButtonSize = .big,
        isEnabled: Bool = true,
        fullWidth: Bool = false,
        colorProvider: ColorProvider = Warp.Config.colorProvider
    ) -> Warp.Button {
        Warp.Button(
            title: title,
            icon: icon,
            action: action,
            type: utilityOverlayType,
            size: size,
            isEnabled: isEnabled,
            fullWidth: fullWidth,
            colorProvider: colorProvider
        )
    }
}

private struct UtilityOverlayButtonPreview: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 12) {
            Warp.Button.createUtilityOverlay(title: "Button")

            Warp.Button.createUtilityOverlay(title: "Disabled button", isEnabled: false)
        }
    }
}
