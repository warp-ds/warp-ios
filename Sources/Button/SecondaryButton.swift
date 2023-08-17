import SwiftUI

public struct SecondaryButton: View {
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
    
    var buttonBorderColor: Color {
        disabled ?
        colorProvider.secondaryButtonDisabledBorderColor :
        colorProvider.secondaryButtonBorderColor
    }
    
    public var body: some View {
        WarpButton(title: title, type: .secondary, disbled: disabled)
        Button(title) {
            
        }
        .disabled(disabled)
        .foregroundColor(foregroundColor)
        .padding()
        .background(backgroundColor)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(buttonBorderColor, lineWidth: 4))
        .cornerRadius(8)
    }
}

#Preview {
    VStack {
        SecondaryButton(title: "Button")
        SecondaryButton(title: "Button", disbled: true)
    }
}
