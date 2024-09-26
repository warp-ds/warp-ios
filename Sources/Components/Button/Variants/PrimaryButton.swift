import Foundation
import SwiftUI

extension Warp.Button {
    private static let primaryType: Warp.ButtonType = .primary

    /// Factory method for creating warp button with `Primary` style.
    static func createPrimary(
        title: String,
        leadingIcon: Image? = nil,
        trailingIcon: Image? = nil,
        action: @escaping @Sendable () -> Void = {},
        size: Warp.ButtonSize = .big,
        isEnabled: Bool = true,
        fullWidth: Bool = false,
        isLoading: Bool = false,
        colorProvider: ColorProvider = Warp.Color) -> Warp.Button {
        Warp.Button(
            title: title,
            leadingIcon: leadingIcon,
            trailingIcon: trailingIcon,
            action: action,
            type: primaryType,
            size: size,
            isEnabled: isEnabled,
            fullWidth: fullWidth,
            isLoading: isLoading,
            colorProvider: colorProvider
        )
    }
}

private struct PrimaryButtonPreview: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 8) {
            Warp.Button.createPrimary(title: "Button")

            Warp.Button.createPrimary(title: "Disabled button", isEnabled: false)
        }
    }
}
