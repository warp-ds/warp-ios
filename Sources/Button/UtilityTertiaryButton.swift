import Foundation
import SwiftUI

extension WarpButton {
    /// <#Description#>
    static func createUtilityTertiary(
        title: String,
        icon: String? = nil,
        action: @escaping () -> Void,
        size: WarpButtonSize = .big,
        isEnabled: Bool = false,
        fullWidth: Bool = false
    ) -> WarpButton {
        WarpButton(
            title: title,
            icon: icon,
            action: action,
            type: .utilityTertiary,
            size: size,
            disbled: isEnabled,
            fullWidth: fullWidth
        )
    }
}

public struct UtilityTertiaryButton: View {
    /// <#Description#>
    let title: String
    
    /// <#Description#>
    let icon: String?

    /// <#Description#>
    let action: () -> Void

    /// <#Description#>
    let size: WarpButtonSize

    /// <#Description#>
    let isEnabled: Bool

    /// <#Description#>
    let fullWidth: Bool

    public init(
        title: String,
        icon: String?,
        action: @escaping () -> Void,
        size: WarpButtonSize = .big,
        isEnabled: Bool,
        fullWidth: Bool
    ) {
        self.title = title
        self.icon = icon
        self.action = action
        self.size = size
        self.isEnabled = isEnabled
        self.fullWidth = fullWidth
    }

    public var body: some View {
        WarpButton.createUtilityTertiary(
            title: title,
            icon: icon,
            action: action,
            size: size,
            isEnabled: isEnabled,
            fullWidth: fullWidth
        )
    }
}

private struct UtilityTertiaryButtonPreview: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 12) {
            WarpButton.createUtilityTertiary(title: "Button", action: {})

            WarpButton.createUtilityTertiary(title: "Disabled button", action: {}, isEnabled: false)
        }
    }
}
