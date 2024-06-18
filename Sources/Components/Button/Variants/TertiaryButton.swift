import Foundation
import SwiftUI

@MainActor extension Warp.Button {
    private static let tertiaryType: Warp.ButtonType = .tertiary

    /// Factory method for creating warp button with `Tertiary` style.
    static func createTertiary(
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
            type: tertiaryType,
            size: size,
            isEnabled: isEnabled,
            fullWidth: fullWidth,
            isLoading: isLoading,
            colorProvider: colorProvider
        )
    }
}

private struct TertiaryButtonPreview: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 12) {
            Warp.Button.createTertiary(title: "Button")

            Warp.Button.createTertiary(title: "Disabled button", isEnabled: false)
        }
    }
}
