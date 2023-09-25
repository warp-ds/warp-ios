import Foundation
import SwiftUI

extension Warp.Button {
    private static let utilityTertiaryType: Warp.ButtonType = .utilityTertiary

    /// <#Description#>
    static func createUtilityTertiary(
        title: String,
        icon: Image? = nil,
        action: @escaping () -> Void = {},
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
}

private struct UtilityTertiaryButtonPreview: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 12) {
            Warp.Button.createUtilityTertiary(title: "Button")

            Warp.Button.createUtilityTertiary(title: "Disabled button", isEnabled: false)
        }
    }
}
