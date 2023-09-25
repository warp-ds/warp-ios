import Foundation
import SwiftUI

extension Warp.Button {
    private static let utilityType: Warp.ButtonType = .tertiary

    /// <#Description#>
    static func createUtility(
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
            type: utilityType,
            size: size,
            isEnabled: isEnabled,
            fullWidth: fullWidth
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
