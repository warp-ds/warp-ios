import SwiftUI
#if canImport(UIKit)
import UIKit
#endif

/// Source: https://docs.google.com/spreadsheets/d/1Q-Tr_dwJVfxgh3527IFjXQKqtnPPM42QeIr-M6q-zu8/edit#gid=888578831
protocol TokenProvider {
    /// Background
    var background: Color { get }
    var backgroundHover: Color { get }
    var backgroundActive: Color { get }
    var backgroundDisabled: Color { get }
    var backgroundSubtle: Color { get }
    var backgroundSubtleHover: Color { get }
    var backgroundSubtleActive: Color { get }
    var backgroundSelected: Color { get }
    var backgroundSelectedHover: Color { get }
                        
    var backgroundInverted: Color { get }
              
    var backgroundButtonPrimary: Color { get } // Not on documents
    var backgroundPrimary: Color { get }
    var backgroundPrimaryHover: Color { get }
    var backgroundPrimaryActive: Color { get }
    var backgroundPrimarySubtle: Color { get }
    var backgroundPrimarySubtleHover: Color { get }
    var backgroundPrimarySubtleActive: Color { get }
                        
    var backgroundPositive: Color { get }
    var backgroundPositiveHover: Color { get }
    var backgroundPositiveActive: Color { get }
    var backgroundPositiveSubtle: Color { get }
    var backgroundPositiveSubtleHover: Color { get }
    var backgroundPositiveSubtleActive: Color { get }
    var backgroundPositiveSelected: Color { get }
    var backgroundPositiveSelectedHover: Color { get }
                        
    var backgroundNegative: Color { get }
    var backgroundNegativeHover: Color { get }
    var backgroundNegativeActive: Color { get }
    var backgroundNegativeSubtle: Color { get }
    var backgroundNegativeSubtleHover: Color { get }
    var backgroundNegativeSubtleActive: Color { get }
    var backgroundNegativeSelected: Color { get }
    var backgroundNegativeSelectedHover: Color { get }
                        
    var backgroundWarning: Color { get }
    var backgroundWarningHover: Color { get }
    var backgroundWarningActive: Color { get }
    var backgroundWarningSubtle: Color { get }
    var backgroundWarningSubtleHover: Color { get }
    var backgroundWarningSubtleActive: Color { get }
    var backgroundWarningSelected: Color { get }
    var backgroundWarningSelectedHover: Color { get }
                        
    var backgroundInfo: Color { get }
    var backgroundInfoHover: Color { get }
    var backgroundInfoActive: Color { get }
    var backgroundInfoSubtle: Color { get }
    var backgroundInfoSubtleHover: Color { get }
    var backgroundInfoSubtleActive: Color { get }
    var backgroundInfoSelected: Color { get }
                        
    var backgroundNotification: Color { get }
                        
    /// Border
    var border: Color { get }
    var borderHover: Color { get }
    var borderActive: Color { get }
    var borderDisabled: Color { get }
    var borderSelected: Color { get }
    var borderSelectedHover: Color { get }
              
    var borderButtonPrimary: Color { get } // Not on documents
    var borderButtonSecondary: Color { get } // Not on documents
    var borderPrimary: Color { get }
    var borderPrimaryHover: Color { get }
    var borderPrimaryActive: Color { get }
    var borderPrimarySubtle: Color { get }
    var borderPrimarySubtleHover: Color { get }
    var borderPrimarySubtleActive: Color { get }
                        
    var borderPositive: Color { get }
    var borderPositiveHover: Color { get }
    var borderPositiveActive: Color { get }
    var borderPositiveSubtle: Color { get }
    var borderPositiveSubtleHover: Color { get }
    var borderPositiveSubtleActive: Color { get }
                        
    var borderNegative: Color { get }
    var borderNegativeHover: Color { get }
    var borderNegativeActive: Color { get }
    var borderNegativeSubtle: Color { get }
    var borderNegativeSubtleHover: Color { get }
    var borderNegativeSubtleActive: Color { get }
                        
    var borderWarning: Color { get }
    var borderWarningHover: Color { get }
    var borderWarningActive: Color { get }
    var borderWarningSubtle: Color { get }
    var borderWarningSubtleHover: Color { get }
    var borderWarningSubtleActive: Color { get }
                        
    var borderInfo: Color { get }
    var borderInfoHover: Color { get }
    var borderInfoActive: Color { get }
    var borderInfoSubtle: Color { get }
    var borderInfoSubtleHover: Color { get }
    var borderInfoSubtleActive: Color { get }
                        
    /// Icon
    var icon: Color { get }
    var iconHover: Color { get }
    var iconActive: Color { get }
    var iconSelected: Color { get }
    var iconSelectedHover: Color { get }
    var iconDisabled: Color { get }
    var iconSubtle: Color { get }
    var iconSubtleHover: Color { get }
    var iconSubtleActive: Color { get }
    var iconInverted: Color { get }
    var iconInvertedHover: Color { get }
    var iconInvertedActive: Color { get }
    var iconPrimary: Color { get }
    var iconPositive: Color { get }
    var iconNegative: Color { get }
    var iconWarning: Color { get }
    var iconInfo: Color { get }
                        
    var iconNotification: Color { get }
                        
    /// Text
    var text: Color { get }
    var textSubtle: Color { get }
    var textPlaceholder: Color { get }
    var textInverted: Color { get }
    var textInvertedSubtle: Color { get }
    var textLink: Color { get }
    var textDisabled: Color { get }
    var textNegative: Color { get }
    var textPositive: Color { get }
    var textNotification: Color { get }
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

#if canImport(UIKit)
extension Color {
    static func dynamicColor(defaultColor: Color, darkModeColor: Color) -> Color {
        return Color(
            UIColor.dynamicColor(
                defaultColor: UIColor(defaultColor),
                darkModeColor: UIColor(darkModeColor)
            )
        )
    }
}

extension UIColor {
    /// Convenience method to create dynamic colors for dark mode if the OS supports it (independant of FinniversKit
    /// settings)
    /// - Parameters:
    ///   - defaultColor: light mode version of the color
    ///   - darkModeColor: dark mode version of the color
    class func dynamicColor(defaultColor: UIColor, darkModeColor: UIColor) -> UIColor {
        UIColor { traitCollection -> UIColor in
            switch traitCollection.userInterfaceStyle {
            case .dark:
                return darkModeColor
            default:
                return defaultColor
            }
        }
    }
}
#endif

#if canImport(AppKit)
extension Color {
    // Poor implementation, rework it when `macOS` needed support.
    static func dynamicColor(defaultColor: Color, darkModeColor: Color) -> Color {
        if isInDarkMode {
            return darkModeColor
        }

        return defaultColor
    }

    private static var isInDarkMode: Bool {
        NSApplication
            .shared
            .mainWindow?
            .contentView?
            .effectiveAppearance
            .bestMatch(from: [.darkAqua, .aqua]) == .darkAqua
    }
}
#endif
