import Foundation
import SwiftUI

extension Warp.Button {
    private static let criticalType: Warp.ButtonType = .critical

    /// Factory method for creating warp button with `Critical` style.
    static func createCritical(
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
            type: criticalType,
            size: size,
            isEnabled: isEnabled,
            fullWidth: fullWidth,
            isLoading: isLoading,
            colorProvider: colorProvider
        )
    }
}

private struct CriticalButtonPreview: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 8) {
            Warp.Button.createCritical(title: "Button")

            Warp.Button.createCritical(title: "Disabled button", isEnabled: false)
        }
    }
}
