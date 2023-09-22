import SwiftUI

extension WarpButton {
    /// <#Description#>
    static func createTertiary(
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
            type: .tertiary,
            size: size,
            disbled: isEnabled,
            fullWidth: fullWidth
        )
    }
}

public struct TertiaryButton: View {
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
        size: WarpButtonSize,
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
        WarpButton.createTertiary(
            title: title,
            icon: icon,
            action: action,
            size: size,
            isEnabled: isEnabled,
            fullWidth: fullWidth
        )
    }
}

private struct TertiaryButtonPreview: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 12) {
            WarpButton.createTertiary(title: "Button", action: {})

            WarpButton.createTertiary(title: "Disabled button", action: {}, isEnabled: false)
        }
    }
}
