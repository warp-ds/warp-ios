import Foundation
import SwiftUI

extension Warp.Button {
    private static let tertiaryType: Warp.ButtonType = .tertiary

    /// <#Description#>
    public static func createTertiary(
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
            type: tertiaryType,
            size: size,
            isEnabled: isEnabled,
            fullWidth: fullWidth
        )
    }

    /// <#Description#>
    public static func createDisabledTertiary(
        title: String,
        icon: String? = nil,
        size: Warp.ButtonSize = .big,
        fullWidth: Bool = false
    ) -> Warp.Button {
        Warp.Button(
            title: title,
            icon: icon,
            action: {},
            type: tertiaryType,
            size: size,
            isEnabled: false,
            fullWidth: fullWidth
        )
    }
}

private struct TertiaryButtonPreview: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 12) {
            Warp.Button.createTertiary(title: "Button", action: {})

            Warp.Button.createDisabledTertiary(title: "Disabled button")
        }
    }
}
