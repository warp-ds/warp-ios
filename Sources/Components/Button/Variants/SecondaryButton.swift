import Foundation
import SwiftUI

extension Warp.Button {
    private static let secondaryType: Warp.ButtonType = .secondary

    /// Factory method for creating warp button with `Secondary` style.
    static func createSecondary(
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
            type: secondaryType,
            size: size,
            isEnabled: isEnabled,
            fullWidth: fullWidth,
            isLoading: isLoading,
            colorProvider: colorProvider
        )
    }
}

private struct SecondaryButtonPreview: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 8) {
            Warp.Button.createSecondary(title: "Button")

            Warp.Button.createSecondary(title: "Disabled button", isEnabled: false)
        }
    }
}
