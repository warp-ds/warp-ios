import SwiftUI

public struct UtilityButton: View {
    let title: String
    let disabled: Bool
    let colorProvider = Config.colorProvider

    public init(title: String, disbled: Bool = false) {
        self.title = title
        self.disabled = disbled
    }
    
    var backgroundColor: Color {
        disabled ?
        colorProvider.utilityButtonDisabledBackgroundColor :
        colorProvider.utilityButtonBackgroundColor
    }
    
    var foregroundColor: Color {
        disabled ?
        colorProvider.utilityButtonDisabledForegroundColor :
        colorProvider.utilityButtonForegroundColor
    }
    
    var buttonBorderColor: Color {
        disabled ?
        colorProvider.utilityButtonDisabledBorderColor :
        colorProvider.utilityButtonBorderColor
    }
    
    public var body: some View {
        WarpButton(title: title, type: .utility, disbled: disabled)
        Button(title) {
            
        }
        .disabled(disabled)
        .foregroundColor(foregroundColor)
        .padding(8)
        .background(backgroundColor)
        .overlay(
            RoundedRectangle(cornerRadius: 4)
                .stroke(buttonBorderColor, lineWidth: 2))
        .cornerRadius(4)
    }
}

#Preview {
    VStack {
        UtilityButton(title: "Button")
        UtilityButton(title: "Button", disbled: true)
    }
}
