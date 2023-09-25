import Foundation
import SwiftUI

extension Warp.Button {
    private static let criticalTertiaryType: Warp.ButtonType = .criticalTertiary

    /// <#Description#>
    static func createCriticalTertiary(
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
            type: criticalTertiaryType,
            size: size,
            isEnabled: isEnabled,
            fullWidth: fullWidth
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
