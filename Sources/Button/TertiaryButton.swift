import SwiftUI

public struct TertiaryButton: View {
    let title: String
    let disabled: Bool
    let colorProvider = Config.colorProvider

    public init(title: String, disbled: Bool = false) {
        self.title = title
        self.disabled = disbled
    }
        
    public var body: some View {
        WarpButton(title: title, type: .tertiary, disbled: disabled)
    }
}

#Preview {
    VStack {
        TertiaryButton(title: "Button")
        TertiaryButton(title: "Button", disbled: true)
    }
}
