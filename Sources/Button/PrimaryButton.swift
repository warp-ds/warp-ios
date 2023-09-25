import Foundation
import SwiftUI

extension Warp.Button {
    private static let primaryType: Warp.ButtonType = .primary

    /// <#Description#>
    public static func createPrimary(
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
            type: primaryType,
            size: size,
            isEnabled: isEnabled,
            fullWidth: fullWidth
        )
    }

    /// <#Description#>
    public static func createDisabledPrimary(
        title: String,
        icon: String? = nil,
        size: Warp.ButtonSize = .big,
        fullWidth: Bool = false
    ) -> Warp.Button {
        Warp.Button(
            title: title,
            icon: icon,
            action: {},
            type: primaryType,
            size: size,
            isEnabled: false,
            fullWidth: fullWidth
        )
    }
}

private struct PrimaryButtonPreview: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 8) {
            Warp.Button.createPrimary(title: "Button", action: {})

            Warp.Button.createDisabledPrimary(title: "Disabled button")
        }
    }
}
