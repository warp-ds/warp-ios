import SwiftUI
import UIKit

/// Source: https://docs.google.com/spreadsheets/d/1Q-Tr_dwJVfxgh3527IFjXQKqtnPPM42QeIr-M6q-zu8/edit#gid=888578831
@preconcurrency @MainActor
public protocol TokenProvider {
    /// Surface
    var surfaceSunken: Color { get }
    var surfaceElevated100: Color { get }
    var surfaceElevated100Hover: Color { get }
    var surfaceElevated100Active: Color { get }
    var surfaceElevated200: Color { get }
    var surfaceElevated200Hover: Color { get }
    var surfaceElevated200Active: Color { get }
    var surfaceElevated300: Color { get }
    var surfaceElevated300Hover: Color { get }
    var surfaceElevated300Active: Color { get }
    
    
    /// Background
    var background: Color { get }
    var backgroundHover: Color { get }
    var backgroundActive: Color { get }
    var backgroundDisabled: Color { get }
    var backgroundDisabledSubtle: Color { get }
    var backgroundSubtle: Color { get }
    var backgroundSubtleHover: Color { get }
    var backgroundSubtleActive: Color { get }
    var backgroundSelected: Color { get }
    var backgroundSelectedHover: Color { get }
    var backgroundSelectedActive: Color { get }
    
    var backgroundInverted: Color { get }
    
    var backgroundPrimary: Color { get }
    var backgroundPrimaryHover: Color { get }
    var backgroundPrimaryActive: Color { get }
    var backgroundPrimarySubtle: Color { get }
    var backgroundPrimarySubtleHover: Color { get }
    var backgroundPrimarySubtleActive: Color { get }
    
    var backgroundSecondary: Color { get }
    var backgroundSecondaryHover: Color { get }
    var backgroundSecondaryActive: Color { get }
    
    var backgroundPositive: Color { get }
    var backgroundPositiveHover: Color { get }
    var backgroundPositiveActive: Color { get }
    var backgroundPositiveSubtle: Color { get }
    var backgroundPositiveSubtleHover: Color { get }
    var backgroundPositiveSubtleActive: Color { get }
    
    var backgroundNegative: Color { get }
    var backgroundNegativeHover: Color { get }
    var backgroundNegativeActive: Color { get }
    var backgroundNegativeSubtle: Color { get }
    var backgroundNegativeSubtleHover: Color { get }
    var backgroundNegativeSubtleActive: Color { get }
    
    var backgroundWarning: Color { get }
    var backgroundWarningHover: Color { get }
    var backgroundWarningActive: Color { get }
    var backgroundWarningSubtle: Color { get }
    var backgroundWarningSubtleHover: Color { get }
    var backgroundWarningSubtleActive: Color { get }
    
    var backgroundInfo: Color { get }
    var backgroundInfoHover: Color { get }
    var backgroundInfoActive: Color { get }
    var backgroundInfoSubtle: Color { get }
    var backgroundInfoSubtleHover: Color { get }
    var backgroundInfoSubtleActive: Color { get }
    
    var backgroundNotification: Color { get }
    
    
    /// Border
    var border: Color { get }
    var borderHover: Color { get }
    var borderActive: Color { get }
    var borderDisabled: Color { get }
    var borderSelected: Color { get }
    var borderSelectedHover: Color { get }
    var borderSelectedActive: Color { get }
    var borderFocus: Color { get }
    
    var borderPrimary: Color { get }
    var borderPrimaryHover: Color { get }
    var borderPrimaryActive: Color { get }
    var borderPrimarySubtle: Color { get }
    var borderPrimarySubtleHover: Color { get }
    var borderPrimarySubtleActive: Color { get }
    
    var borderSecondary: Color { get }
    var borderSecondaryHover: Color { get }
    var borderSecondaryActive: Color { get }
    
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
    var iconStatic: Color { get }
    var iconHover: Color { get }
    var iconActive: Color { get }
    var iconSelected: Color { get }
    var iconSelectedHover: Color { get }
    var iconSelectedActive: Color { get }
    var iconDisabled: Color { get }
    var iconSubtle: Color { get }
    var iconSubtleHover: Color { get }
    var iconSubtleActive: Color { get }
    var iconInverted: Color { get }
    var iconInvertedHover: Color { get }
    var iconInvertedActive: Color { get }
    var iconInvertedStatic: Color { get }
    var iconPrimary: Color { get }
    var iconSecondary: Color { get }
    var iconSecondaryHover: Color { get }
    var iconSecondaryActive: Color { get }
    var iconPositive: Color { get }
    var iconNegative: Color { get }
    var iconWarning: Color { get }
    var iconInfo: Color { get }
    
    var iconNotification: Color { get }
    
    /// Text
    var text: Color { get }
    var textStatic: Color { get }
    var textSubtle: Color { get }
    var textPlaceholder: Color { get }
    var textInverted: Color { get }
    var textInvertedStatic: Color { get }
    var textInvertedSubtle: Color { get }
    var textLink: Color { get }
    var textDisabled: Color { get }
    var textNegative: Color { get }
    var textPositive: Color { get }
    var textNotification: Color { get }
}

@preconcurrency @MainActor
public protocol UITokenProvider {
    /// Surface
    var surfaceSunken: UIColor { get }
    var surfaceElevated100: UIColor { get }
    var surfaceElevated100Hover: UIColor { get }
    var surfaceElevated100Active: UIColor { get }
    var surfaceElevated200: UIColor { get }
    var surfaceElevated200Hover: UIColor { get }
    var surfaceElevated200Active: UIColor { get }
    var surfaceElevated300: UIColor { get }
    var surfaceElevated300Hover: UIColor { get }
    var surfaceElevated300Active: UIColor { get }
    
    
    /// Background
    var background: UIColor { get }
    var backgroundHover: UIColor { get }
    var backgroundActive: UIColor { get }
    var backgroundDisabled: UIColor { get }
    var backgroundDisabledSubtle: UIColor { get }
    var backgroundSubtle: UIColor { get }
    var backgroundSubtleHover: UIColor { get }
    var backgroundSubtleActive: UIColor { get }
    var backgroundSelected: UIColor { get }
    var backgroundSelectedHover: UIColor { get }
    var backgroundSelectedActive: UIColor { get }
    
    var backgroundInverted: UIColor { get }
    
    var backgroundPrimary: UIColor { get }
    var backgroundPrimaryHover: UIColor { get }
    var backgroundPrimaryActive: UIColor { get }
    var backgroundPrimarySubtle: UIColor { get }
    var backgroundPrimarySubtleHover: UIColor { get }
    var backgroundPrimarySubtleActive: UIColor { get }
    
    var backgroundSecondary: UIColor { get }
    var backgroundSecondaryHover: UIColor { get }
    var backgroundSecondaryActive: UIColor { get }
    
    var backgroundPositive: UIColor { get }
    var backgroundPositiveHover: UIColor { get }
    var backgroundPositiveActive: UIColor { get }
    var backgroundPositiveSubtle: UIColor { get }
    var backgroundPositiveSubtleHover: UIColor { get }
    var backgroundPositiveSubtleActive: UIColor { get }
    
    var backgroundNegative: UIColor { get }
    var backgroundNegativeHover: UIColor { get }
    var backgroundNegativeActive: UIColor { get }
    var backgroundNegativeSubtle: UIColor { get }
    var backgroundNegativeSubtleHover: UIColor { get }
    var backgroundNegativeSubtleActive: UIColor { get }
    
    var backgroundWarning: UIColor { get }
    var backgroundWarningHover: UIColor { get }
    var backgroundWarningActive: UIColor { get }
    var backgroundWarningSubtle: UIColor { get }
    var backgroundWarningSubtleHover: UIColor { get }
    var backgroundWarningSubtleActive: UIColor { get }
    
    var backgroundInfo: UIColor { get }
    var backgroundInfoHover: UIColor { get }
    var backgroundInfoActive: UIColor { get }
    var backgroundInfoSubtle: UIColor { get }
    var backgroundInfoSubtleHover: UIColor { get }
    var backgroundInfoSubtleActive: UIColor { get }
    
    var backgroundNotification: UIColor { get }
    
    
    /// Border
    var border: UIColor { get }
    var borderHover: UIColor { get }
    var borderActive: UIColor { get }
    var borderDisabled: UIColor { get }
    var borderSelected: UIColor { get }
    var borderSelectedHover: UIColor { get }
    var borderSelectedActive: UIColor { get }
    var borderFocus: UIColor { get }
    
    var borderPrimary: UIColor { get }
    var borderPrimaryHover: UIColor { get }
    var borderPrimaryActive: UIColor { get }
    var borderPrimarySubtle: UIColor { get }
    var borderPrimarySubtleHover: UIColor { get }
    var borderPrimarySubtleActive: UIColor { get }
    
    var borderSecondary: UIColor { get }
    var borderSecondaryHover: UIColor { get }
    var borderSecondaryActive: UIColor { get }
    
    var borderPositive: UIColor { get }
    var borderPositiveHover: UIColor { get }
    var borderPositiveActive: UIColor { get }
    var borderPositiveSubtle: UIColor { get }
    var borderPositiveSubtleHover: UIColor { get }
    var borderPositiveSubtleActive: UIColor { get }
    
    var borderNegative: UIColor { get }
    var borderNegativeHover: UIColor { get }
    var borderNegativeActive: UIColor { get }
    var borderNegativeSubtle: UIColor { get }
    var borderNegativeSubtleHover: UIColor { get }
    var borderNegativeSubtleActive: UIColor { get }
    
    var borderWarning: UIColor { get }
    var borderWarningHover: UIColor { get }
    var borderWarningActive: UIColor { get }
    var borderWarningSubtle: UIColor { get }
    var borderWarningSubtleHover: UIColor { get }
    var borderWarningSubtleActive: UIColor { get }
    
    var borderInfo: UIColor { get }
    var borderInfoHover: UIColor { get }
    var borderInfoActive: UIColor { get }
    var borderInfoSubtle: UIColor { get }
    var borderInfoSubtleHover: UIColor { get }
    var borderInfoSubtleActive: UIColor { get }
    
    /// Icon
    var icon: UIColor { get }
    var iconStatic: UIColor { get }
    var iconHover: UIColor { get }
    var iconActive: UIColor { get }
    var iconSelected: UIColor { get }
    var iconSelectedHover: UIColor { get }
    var iconSelectedActive: UIColor { get }
    var iconDisabled: UIColor { get }
    var iconSubtle: UIColor { get }
    var iconSubtleHover: UIColor { get }
    var iconSubtleActive: UIColor { get }
    var iconInverted: UIColor { get }
    var iconInvertedHover: UIColor { get }
    var iconInvertedActive: UIColor { get }
    var iconInvertedStatic: UIColor { get }
    var iconPrimary: UIColor { get }
    var iconSecondary: UIColor { get }
    var iconSecondaryHover: UIColor { get }
    var iconSecondaryActive: UIColor { get }
    var iconPositive: UIColor { get }
    var iconNegative: UIColor { get }
    var iconWarning: UIColor { get }
    var iconInfo: UIColor { get }
    
    var iconNotification: UIColor { get }
    
    /// Text
    var text: UIColor { get }
    var textStatic: UIColor { get }
    var textSubtle: UIColor { get }
    var textPlaceholder: UIColor { get }
    var textInverted: UIColor { get }
    var textInvertedStatic: UIColor { get }
    var textInvertedSubtle: UIColor { get }
    var textLink: UIColor { get }
    var textDisabled: UIColor { get }
    var textNegative: UIColor { get }
    var textPositive: UIColor { get }
    var textNotification: UIColor { get }
}

public extension UIColor {
    /// Base initializer, it creates an instance of `UIColor` using an HEX string.
    ///
    /// - Parameter hex: The base HEX string to create the color.
    convenience init(hex: String) {
        let noHashString = hex.replacingOccurrences(of: "#", with: "")
        let scanner = Scanner(string: noHashString)
        scanner.charactersToBeSkipped = CharacterSet.symbols
        
        var hexInt: UInt64 = 0
        if scanner.scanHexInt64(&hexInt) {
            let red = (hexInt >> 16) & 0xFF
            let green = (hexInt >> 8) & 0xFF
            let blue = (hexInt) & 0xFF
            
            self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
        } else {
            self.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
        }
    }
    
    /// Returns hexadecimal representation of a color converted to the sRGB color space.
    var hexString: String {
        guard
            let targetColorSpace = CGColorSpace(name: CGColorSpace.sRGB),
            let cgColor = self.cgColor.converted(to: targetColorSpace, intent: .relativeColorimetric, options: nil)
        else {
            // Not possible to convert source color space to RGB
            return "#000000"
        }
        let components = cgColor.components
        let red = components?[0] ?? 0.0
        let green = components?[1] ?? 0.0
        let blue = components?[2] ?? 0.0
        return String(format: "#%02x%02x%02x", (Int)(red * 255), (Int)(green * 255), (Int)(blue * 255))
    }
}

public extension Color {
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

extension Color {
    public static func dynamicColor(defaultColor: Color, darkModeColor: Color) -> Color {
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
    public class func dynamicColor(defaultColor: UIColor, darkModeColor: UIColor) -> UIColor {
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
