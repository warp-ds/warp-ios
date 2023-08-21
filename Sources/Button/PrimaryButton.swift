import SwiftUI

public struct PrimaryButton: View {
    let title: String
    let disabled: Bool
    let colorProvider = Config.colorProvider
    
    public init(title: String, disbled: Bool = false) {
        self.title = title
        self.disabled = disbled
    }
    
    var backgroundColor: Color {
        disabled ?
        colorProvider.primaryButtonDisabledBackgroundColor :
        colorProvider.primaryButtonBackgroundColor
    }
    
    var foregroundColor: Color {
        colorProvider.primaryButtonForegroundColor
    }
    
    public var body: some View {
        WarpButton(title: title, type: .primary, disbled: disabled)
    }
}

#Preview {
    VStack {
        PrimaryButton(title: "Button")
        PrimaryButton(title: "Button", disbled: true)
    }
}
