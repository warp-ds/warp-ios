import Foundation
import SwiftUI

extension Warp.Button {
    private static let tertiaryType: Warp.ButtonType = .tertiary

    /// <#Description#>
    static func createTertiary(
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
            type: tertiaryType,
            size: size,
            isEnabled: isEnabled,
            fullWidth: fullWidth
        )
    }
}

private struct TertiaryButtonPreview: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 12) {
            Warp.Button.createTertiary(title: "Button")

            Warp.Button.createTertiary(title: "Disabled button", isEnabled: false)
        }
    }
}
