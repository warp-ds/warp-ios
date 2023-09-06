import SwiftUI

public struct CriticalTertiaryButton: View {
    let title: String
    let icon: String
    let size: WarpButtonSize
    let disabled: Bool
    let fullWidth: Bool
    let colorProvider = Config.colorProvider

    public init(title: String,
                icon: String = "",
                size: WarpButtonSize = .big,
                disbled: Bool = false,
                fullWidth: Bool = false) {
        self.title = title
        self.icon = icon
        self.size = size
        self.disabled = disbled
        self.fullWidth = fullWidth
    }
        
    public var body: some View {
        WarpButton(title: title,
                   icon: icon,
                   type: .criticalTertiary,
                   size: size,
                   disbled: disabled,
                   fullWidth: fullWidth)
    }
}

private struct CriticalTertiaryButtonPreview: PreviewProvider {
    static var previews: some View {
        VStack {
            CriticalTertiaryButton(title: "Button")
            CriticalTertiaryButton(title: "Button", disbled: true)
        }
    }
}
