import SwiftUI

public struct UtilityTertiaryButton: View {
    let title: String
    let disabled: Bool
    let colorProvider = Config.colorProvider

    public init(title: String, disbled: Bool = false) {
        self.title = title
        self.disabled = disbled
    }
    
    public var body: some View {
        WarpButton(title: title, type: .utilityTertiary, disbled: disabled)
    }
}

#Preview {
    VStack {
        UtilityButton(title: "Button")
        UtilityButton(title: "Button", disbled: true)
    }
}
