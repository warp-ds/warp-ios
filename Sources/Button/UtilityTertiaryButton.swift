import Foundation
import SwiftUI

extension Warp.Button {
    private static let utilityTertiaryType: Warp.ButtonType = .utilityTertiary

    /// <#Description#>
    static func createUtilityTertiary(
        title: String,
        icon: Image? = nil,
        action: @escaping () -> Void,
        size: Warp.ButtonSize = .big,
        isEnabled: Bool = true,
        fullWidth: Bool = false
    ) -> Warp.Button {
        Warp.Button(
            title: title,
            icon: icon,
            action: action,
            type: utilityTertiaryType,
            size: size,
            isEnabled: isEnabled,
            fullWidth: fullWidth
        )
    }

    /// <#Description#>
    static func createDisabledUtilityTertiaryType(
        title: String,
        icon: Image? = nil,
        size: Warp.ButtonSize = .big,
        fullWidth: Bool = false
    ) -> Warp.Button {
        Warp.Button(
            title: title,
            icon: icon,
            action: {},
            type: utilityTertiaryType,
            size: size,
            isEnabled: false,
            fullWidth: fullWidth
        )
    }
}

private struct UtilityTertiaryButtonPreview: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 12) {
            Warp.Button.createUtilityTertiary(title: "Button", action: {})

            Warp.Button.createDisabledUtilityTertiaryType(title: "Disabled button")
        }
    }
}
