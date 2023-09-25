import Foundation
import SwiftUI

extension Warp.Button {
    private static let criticalTertiaryType: Warp.ButtonType = .criticalTertiary

    /// <#Description#>
    public static func createCriticalTertiary(
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
            type: criticalTertiaryType,
            size: size,
            isEnabled: isEnabled,
            fullWidth: fullWidth
        )
    }

    /// <#Description#>
    public static func createDisabledCriticalTertiary(
        title: String,
        icon: Image? = nil,
        size: Warp.ButtonSize = .big,
        fullWidth: Bool = false
    ) -> Warp.Button {
        Warp.Button(
            title: title,
            icon: icon,
            action: {},
            type: criticalTertiaryType,
            size: size,
            isEnabled: false,
            fullWidth: fullWidth
        )
    }
}

private struct CriticalTertiaryButtonPreview: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 8) {
            Warp.Button.createCriticalTertiary(title: "Button", action: {})

            Warp.Button.createDisabledCriticalTertiary(title: "Disabled button")
        }
    }
}
