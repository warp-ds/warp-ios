import Foundation
import SwiftUI

extension Warp.Button {
    private static let utilityType: Warp.ButtonType = .tertiary

    /// <#Description#>
    public static func createUtility(
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
            type: utilityType,
            size: size,
            isEnabled: isEnabled,
            fullWidth: fullWidth
        )
    }

    /// <#Description#>
    public static func createDisabledUtility(
        title: String,
        icon: Image? = nil,
        size: Warp.ButtonSize = .big,
        fullWidth: Bool = false
    ) -> Warp.Button {
        Warp.Button(
            title: title,
            icon: icon,
            action: {},
            type: utilityType,
            size: size,
            isEnabled: false,
            fullWidth: fullWidth
        )
    }
}

private struct UtilityButtonPreview: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 12) {
            Warp.Button.createUtility(title: "Button", action: {})

            Warp.Button.createDisabledUtility(title: "Disabled button")
        }
    }
}
