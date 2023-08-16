import SwiftUI

public struct TertiaryButton: View {
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
        colorProvider.secondaryButtonBackgroundColor
    }
    
    var foregroundColor: Color {
        disabled ?
        colorProvider.secondaryButtonDisabledForegroundColor :
        colorProvider.secondaryButtonForegroundColor
    }
        
    public var body: some View {
        Button(title) {
            
        }
        .disabled(disabled)
        .foregroundColor(foregroundColor)
        .padding()
        .background(backgroundColor)
        .cornerRadius(8)
    }
}

#Preview {
    VStack {
        TertiaryButton(title: "Button")
        TertiaryButton(title: "Button", disbled: true)
    }
}
