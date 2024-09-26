import Foundation
import SwiftUI

@MainActor extension Warp.Button {
    private static let utilityType: Warp.ButtonType = .utility

    /// Factory method for creating warp button with `Utility` style.
    @MainActor
    static func createUtility(
        title: String,
        leadingIcon: Image? = nil,
        trailingIcon: Image? = nil,
        action: @escaping @Sendable () -> Void = {},
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
            type: utilityType,
            size: size,
            isEnabled: isEnabled,
            fullWidth: fullWidth,
            isLoading: isLoading,
            colorProvider: colorProvider
        )
    }
}

private struct UtilityButtonPreview: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 12) {
            Warp.Button.createUtility(title: "Button")

            Warp.Button.createUtility(title: "Disabled button", isEnabled: false)
        }
    }
}
