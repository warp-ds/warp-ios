import SwiftUI

public struct CriticalTertiaryButton: View {
    let title: String
    let icon: String
    let disabled: Bool
    let fullWidth: Bool
    let colorProvider = Config.colorProvider

    public init(title: String,
                icon: String = "",
                disbled: Bool = false,
                fullWidth: Bool = false) {
        self.title = title
        self.icon = icon
        self.disabled = disbled
        self.fullWidth = fullWidth
    }
        
    public var body: some View {
        WarpButton(title: title,
                   icon: icon,
                   type: .criticalTertiary,
                   disbled: disabled,
                   fullWidth: fullWidth)
    }
}

#Preview {
    VStack {
        CriticalTertiaryButton(title: "Button")
        CriticalTertiaryButton(title: "Button", disbled: true)
    }
}
