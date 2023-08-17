import SwiftUI

public struct CriticalButton: View {
    let title: String
    let disabled: Bool
    let colorProvider = Config.colorProvider
    
    public init(title: String, disbled: Bool = false) {
        self.title = title
        self.disabled = disbled
    }
    
    var backgroundColor: Color {
        disabled ?
        colorProvider.criticalButtonDisabledBackgroundColor :
        colorProvider.criticalButtonBackgroundColor
    }
    
    var foregroundColor: Color {
        colorProvider.criticalButtonForegroundColor
    }
    
    public var body: some View {
        WarpButton(title: title, type: .critical, disbled: disabled)
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
        CriticalButton(title: "Button")
        CriticalButton(title: "Button", disbled: true)
    }
}
