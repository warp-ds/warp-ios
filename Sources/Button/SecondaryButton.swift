import Foundation
import SwiftUI

extension Warp.Button {
    private static let secondaryType: Warp.ButtonType = .secondary

    /// <#Description#>
    public static func createSecondary(
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
            type: secondaryType,
            size: size,
            isEnabled: isEnabled,
            fullWidth: fullWidth
        )
    }

    /// <#Description#>
    public static func createDisabledSecondary(
        title: String,
        icon: String? = nil,
        size: Warp.ButtonSize = .big,
        fullWidth: Bool = false
    ) -> Warp.Button {
        Warp.Button(
            title: title,
            icon: icon,
            action: {},
            type: secondaryType,
            size: size,
            isEnabled: false,
            fullWidth: fullWidth
        )
    }
}

private struct SecondaryButtonPreview: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 8) {
            Warp.Button.createSecondary(title: "Button", action: {})

            Warp.Button.createDisabledSecondary(title: "Disabled button")
        }
    }
}
