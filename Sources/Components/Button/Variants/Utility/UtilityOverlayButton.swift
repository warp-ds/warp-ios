import Foundation
import SwiftUI

extension Warp.Button {
    private static let utilityOverlayType: Warp.ButtonType = .utilityOverlay

    /// Factory method for creating warp button with `UtilityOverlay` style.
    static func createUtilityOverlay(
        title: String,
        leadingIcon: Image? = nil,
        trailingIcon: Image? = nil,
        action: @escaping () -> Void = {},
        size: Warp.ButtonSize = .big,
        isEnabled: Bool = true,
        fullWidth: Bool = false,
        isLoading: Binding<Bool> = .constant(false),
        colorProvider: ColorProvider = Warp.Config.colorProvider
    ) -> Warp.Button {
        Warp.Button(
            title: title,
            leadingIcon: leadingIcon,
            trailingIcon: trailingIcon,
            action: action,
            type: utilityOverlayType,
            size: size,
            isEnabled: isEnabled,
            fullWidth: fullWidth,
            isLoading: isLoading,
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
