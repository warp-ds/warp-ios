import Foundation
import SwiftUI

extension Warp.Button {
    private static let primaryType: Warp.ButtonType = .primary

    /// <#Description#>
    static func createPrimary(
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
            type: primaryType,
            size: size,
            isEnabled: isEnabled,
            fullWidth: fullWidth
        )
    }
}

private struct PrimaryButtonPreview: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 8) {
            Warp.Button.createPrimary(title: "Button")

            Warp.Button.createPrimary(title: "Disabled button", isEnabled: false)
        }
    }
}
