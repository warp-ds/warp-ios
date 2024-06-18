import Foundation
import SwiftUI

@MainActor extension Warp.Button {
    private static let utilityTertiaryType: Warp.ButtonType = .utilityTertiary

    /// Factory method for creating warp button with `UtilityTertiary` style.
    static func createUtilityTertiary(
        title: String,
        leadingIcon: Image? = nil,
        trailingIcon: Image? = nil,
        action: @escaping () -> Void = {},
        size: Warp.ButtonSize = .big,
        isEnabled: Bool = true,
        fullWidth: Bool = false,
        isLoading: Bool = false,
        colorProvider: ColorProvider = Warp.Config.colorProvider
    ) -> Warp.Button {
        Warp.Button(
            title: title,
            leadingIcon: leadingIcon,
            trailingIcon: trailingIcon,
            action: action,
            type: utilityTertiaryType,
            size: size,
            isEnabled: isEnabled,
            fullWidth: fullWidth,
            isLoading: isLoading,
            colorProvider: colorProvider
        )
    }
}

private struct UtilityTertiaryButtonPreview: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 12) {
            Warp.Button.createUtilityTertiary(title: "Button")

            Warp.Button.createUtilityTertiary(title: "Disabled button", isEnabled: false)
        }
    }
}
