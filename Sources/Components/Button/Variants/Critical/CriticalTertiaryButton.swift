import Foundation
import SwiftUI

@MainActor extension Warp.Button {
    private static let criticalTertiaryType: Warp.ButtonType = .criticalTertiary

    /// Factory method for creating warp button with `CriticalTertiary` style.
    static func createCriticalTertiary(
        title: String,
        leadingIcon: Image? = nil,
        trailingIcon: Image? = nil,
        action: @escaping () -> Void = {},
        size: Warp.ButtonSize = .big,
        isEnabled: Bool = true,
        fullWidth: Bool = false,
        isLoading: Bool = false,
        colorProvider: ColorProvider = Warp.Color
    ) -> Warp.Button {
        Warp.Button(
            title: title,
            leadingIcon: leadingIcon,
            trailingIcon: trailingIcon,
            action: action,
            type: criticalTertiaryType,
            size: size,
            isEnabled: isEnabled,
            fullWidth: fullWidth,
            isLoading: isLoading,
            colorProvider: colorProvider
        )
    }
}

private struct CriticalTertiaryButtonPreview: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 8) {
            Warp.Button.createCriticalTertiary(title: "Button")

            Warp.Button.createCriticalTertiary(title: "Disabled button", isEnabled: false)
        }
    }
}
