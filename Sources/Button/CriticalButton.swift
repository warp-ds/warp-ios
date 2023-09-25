import Foundation
import SwiftUI

extension Warp.Button {
    private static let criticalType: Warp.ButtonType = .critical

    /// <#Description#>
    public static func createCritical(
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
            type: criticalType,
            size: size,
            isEnabled: isEnabled,
            fullWidth: fullWidth
        )
    }

    /// <#Description#>
    public static func createDisabledCritical(
        title: String,
        icon: Image? = nil,
        size: Warp.ButtonSize = .big,
        fullWidth: Bool = false
    ) -> Warp.Button {
        Warp.Button(
            title: title,
            icon: icon,
            action: {},
            type: criticalType,
            size: size,
            isEnabled: false,
            fullWidth: fullWidth
        )
    }
}

private struct CriticalButtonPreview: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 8) {
            Warp.Button.createCritical(title: "Button", action: {})

            Warp.Button.createDisabledCritical(title: "Disabled button")
        }
    }
}
