import Foundation
import SwiftUI

extension Warp.Button {
    private static let utilityOverlayType: Warp.ButtonType = .utilityOverlay

    /// <#Description#>
    public static func createUtilityOverlay(
        title: String,
        icon: String? = nil,
        action: @escaping () -> Void,
        size: Warp.ButtonSize = .big,
        isEnabled: Bool = true,
        fullWidth: Bool = false
    ) -> Warp.Button {
        Warp.Button(
            title: title,
            icon: icon,
            action: action,
            type: utilityOverlayType,
            size: size,
            isEnabled: isEnabled,
            fullWidth: fullWidth
        )
    }

    /// <#Description#>
    public static func createDisabledUtilityOverlay(
        title: String,
        icon: String? = nil,
        size: Warp.ButtonSize = .big,
        fullWidth: Bool = false
    ) -> Warp.Button {
        Warp.Button(
            title: title,
            icon: icon,
            action: {},
            type: utilityOverlayType,
            size: size,
            isEnabled: false,
            fullWidth: fullWidth
        )
    }
}

private struct UtilityOverlayButtonPreview: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 12) {
            Warp.Button.createUtilityOverlay(title: "Button", action: {})

            Warp.Button.createDisabledUtilityOverlay(title: "Disabled button")
        }
    }
}
