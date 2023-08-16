import SwiftUI

public protocol ColorProvider {
    var primaryButtonForegroundColor: Color { get }
    var primaryButtonBackgroundColor: Color { get }
    var primaryButtonDisabledBackgroundColor: Color { get }
    
    var secondaryButtonForegroundColor: Color { get }
    var secondaryButtonBackgroundColor: Color { get }
    var secondaryButtonBorderColor: Color { get }
    var secondaryButtonDisabledForegroundColor: Color { get }
    var secondaryButtonDisabledBackgroundColor: Color { get }
    var secondaryButtonDisabledBorderColor: Color { get }
    
    var tertiaryButtonForegroundColor: Color { get }
    var tertiaryButtonBackgroundColor: Color { get }
    var tertiaryButtonDisabledForegroundColor: Color { get }
    var tertiaryButtonDisabledBackgroundColor: Color { get }
    
    var criticalButtonForegroundColor: Color { get }
    var criticalButtonBackgroundColor: Color { get }
    var criticalButtonDisabledBackgroundColor: Color { get }
    
    var criticalTertiaryButtonForegroundColor: Color { get }
    var criticalTertiaryButtonBackgroundColor: Color { get }
    var criticalTertiaryButtonDisabledForegroundColor: Color { get }
    var criticalTertiaryButtonDisabledBackgroundColor: Color { get }
    
    var utilityButtonForegroundColor: Color { get }
    var utilityButtonBackgroundColor: Color { get }
    var utilityButtonBorderColor: Color { get }
    var utilityButtonDisabledForegroundColor: Color { get }
    var utilityButtonDisabledBackgroundColor: Color { get }
    var utilityButtonDisabledBorderColor: Color { get }
    
    var inputOptionalHeaderForegroundColor: Color { get }
    var inputOptionalHelpTextForegroundColor: Color { get }
    var inputActiveBorderColor: Color { get }
}

public struct DefaultColorProvider: ColorProvider {
    public var primaryButtonForegroundColor: Color { FinnColors.white }
    public var primaryButtonBackgroundColor: Color { FinnColors.blue600 }
    public var primaryButtonDisabledBackgroundColor: Color { FinnColors.blueGray300 }
    
    public var secondaryButtonForegroundColor: Color { FinnColors.blue600 }
    public var secondaryButtonBackgroundColor: Color { FinnColors.white }
    public var secondaryButtonBorderColor: Color { FinnColors.blueGray300 }
    public var secondaryButtonDisabledForegroundColor: Color { FinnColors.white }
    public var secondaryButtonDisabledBackgroundColor: Color { FinnColors.blueGray300 }
    public var secondaryButtonDisabledBorderColor: Color { FinnColors.blueGray300 }
    
    public var tertiaryButtonForegroundColor: Color { FinnColors.blue600 }
    public var tertiaryButtonBackgroundColor: Color { FinnColors.white }
    public var tertiaryButtonDisabledForegroundColor: Color { FinnColors.white }
    public var tertiaryButtonDisabledBackgroundColor: Color { FinnColors.blueGray300 }
    
    public var criticalButtonForegroundColor: Color { FinnColors.white }
    public var criticalButtonBackgroundColor: Color { FinnColors.red600 }
    public var criticalButtonDisabledBackgroundColor: Color { FinnColors.blueGray300 }
    
    public var criticalTertiaryButtonForegroundColor: Color { FinnColors.red600 }
    public var criticalTertiaryButtonBackgroundColor: Color { FinnColors.white }
    public var criticalTertiaryButtonDisabledForegroundColor: Color { FinnColors.white }
    public var criticalTertiaryButtonDisabledBackgroundColor: Color { FinnColors.blueGray300 }
    
    public var utilityButtonForegroundColor: Color { FinnColors.gray700 }
    public var utilityButtonBackgroundColor: Color { FinnColors.white }
    public var utilityButtonBorderColor: Color { FinnColors.blueGray300 }
    public var utilityButtonDisabledForegroundColor: Color { FinnColors.white }
    public var utilityButtonDisabledBackgroundColor: Color { FinnColors.blueGray300 }
    public var utilityButtonDisabledBorderColor: Color { FinnColors.blueGray300 }
    
    public var inputOptionalHeaderForegroundColor: Color { FinnColors.gray500 }
    public var inputOptionalHelpTextForegroundColor: Color { FinnColors.gray700 }
    public var inputActiveBorderColor: Color { FinnColors.blue600 }
}



extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
