import SwiftUI

public struct TertiaryButton: View {
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
                   type: .tertiary,
                   disbled: disabled,
                   fullWidth: fullWidth)
    }
}

#Preview {
    VStack {
        TertiaryButton(title: "Button")
        TertiaryButton(title: "Button", disbled: true)
    }
}
