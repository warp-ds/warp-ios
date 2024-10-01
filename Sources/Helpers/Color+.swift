import SwiftUI

public extension UIColor {
    /// Initializes a `UIColor` using a hex string.
    ///
    /// Supported formats:
    /// - `#RRGGBB`: 6 characters (24-bit RGB)
    /// - `#RRGGBBAA`: 8 characters (32-bit RGBA)
    ///
    /// The initializer handles optional prefixes like `#` and `0x`, and falls back to black with 0 opacity if the string is invalid.
    ///
    /// - Parameter hex: A string representing a color in hexadecimal notation.
    convenience init(hex: String) {
        // Remove any non-alphanumeric characters (e.g., # or 0x) from the hex string
        let noHashString = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        let scanner = Scanner(string: noHashString)
        scanner.charactersToBeSkipped = CharacterSet.symbols
        
        var hexInt: UInt64 = 0
        
        // Scan the hex value
        if scanner.scanHexInt64(&hexInt) {
            let r, g, b, a: UInt64
            switch noHashString.count {
            case 6: // RGB (24-bit)
                r = (hexInt >> 16) & 0xFF
                g = (hexInt >> 8) & 0xFF
                b = hexInt & 0xFF
                a = 0xFF // Default alpha to 1 (fully opaque)
            case 8: // RGBA (32-bit)
                r = (hexInt >> 24) & 0xFF
                g = (hexInt >> 16) & 0xFF
                b = (hexInt >> 8) & 0xFF
                a = hexInt & 0xFF
            default:
                r = 0
                g = 0
                b = 0
                a = 0
            }
            
            // Initialize the color with the RGBA components
            self.init(
                red: CGFloat(r) / 255.0,
                green: CGFloat(g) / 255.0,
                blue: CGFloat(b) / 255.0,
                alpha: CGFloat(a) / 255.0
            )
        } else {
            // Fallback to a fully transparent black color in case of invalid hex
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
    /// Initializes a SwiftUI `Color` using a hex string.
    ///
    /// Supported formats:
    /// - `#RGB`: 3 characters (12-bit, shorthand)
    /// - `#RRGGBB`: 6 characters (24-bit, standard RGB)
    /// - `#RRGGBBAA`: 8 characters (32-bit, RGBA)
    ///
    /// The initializer also handles optional prefixes like `#` or `0x`.
    ///
    /// - Parameter hex: A string representing a color in hexadecimal notation.
    init(hex: String) {
        // Remove any non-alphanumeric characters (e.g., # or 0x) from the hex string
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        
        let a, r, g, b: UInt64
        
        // Switch on the length of the hex string to determine the color format
        switch hex.count {
        case 3: // RGB (12-bit, shorthand: #RGB)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit, standard: #RRGGBB)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // RGBA (32-bit: #RRGGBBAA)
            (r, g, b, a) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default: // Invalid format, fallback to black with no opacity
            (a, r, g, b) = (1, 1, 1, 0)
        }
        
        // Initialize the color using sRGB color space
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
