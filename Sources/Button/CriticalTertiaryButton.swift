import SwiftUI

public struct CriticalTertiaryButton: View {
    let title: String
    let disabled: Bool
    let colorProvider = Config.colorProvider

    public init(title: String, disbled: Bool = false) {
        self.title = title
        self.disabled = disbled
    }
    
    var backgroundColor: Color {
        disabled ?
        colorProvider.criticalTertiaryButtonDisabledBackgroundColor :
        colorProvider.criticalTertiaryButtonBackgroundColor
    }
    
    var foregroundColor: Color {
        disabled ?
        colorProvider.criticalTertiaryButtonDisabledForegroundColor :
        colorProvider.criticalTertiaryButtonForegroundColor
    }
        
    public var body: some View {
        WarpButton(title: title, type: .criticalTertiary, disbled: disabled)
    }
}

#Preview {
    VStack {
        CriticalTertiaryButton(title: "Button")
        CriticalTertiaryButton(title: "Button", disbled: true)
    }
}
