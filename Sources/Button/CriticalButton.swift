import Foundation
import SwiftUI

extension Warp.Button {
    private static let criticalType: Warp.ButtonType = .critical

    /// <#Description#>
    static func createCritical(
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
            type: criticalType,
            size: size,
            isEnabled: isEnabled,
            fullWidth: fullWidth
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
