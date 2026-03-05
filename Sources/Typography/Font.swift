import Foundation

extension Warp {
    /// An enumeration representing the fonts used within the Warp design system.
    ///
    /// Each case corresponds to a specific font used by different brands (e.g., `finn`, `tori`, `dba`, `blocket`), and each font has
    /// associated file names and font names that are used for registration and application in the design system.
    enum Font: CaseIterable, Sendable {
        // MARK: - Finn Fonts
        case finnLight
        case finnLightItalic
        case finnMedium

        // MARK: - Tori Fonts
        case toriBold
        case toriRegular
        
        // MARK: - DBA Fonts
        case dbaBold
        case dbaRegular
        
        // MARK: - Blocket Fonts
        case blocketBold
        case blocketMedium
        case blocketRegular

        // MARK: - Vend Fonts
        case vendRegular
        case vendBold

        // MARK: - Neutral Fonts
        case neutralRegular
        case neutralSemiBold
        
        // MARK: - Font File Names
        /// The file name for the font as it appears in the bundle (without extension).
        ///
        /// This is used to load the font file from the app's resources.
        var fileName: String {
            switch self {
            case .finnLight: return "finntype_light"
            case .finnLightItalic: return "finntype_light_italic"
            case .finnMedium: return "finntype_medium"
            case .toriBold: return "torisans_bold"
            case .toriRegular: return "torisans_regular"
            case .blocketBold: return "BlocketSans-Bold"
            case .blocketMedium: return "BlocketSans-Medium"
            case .blocketRegular: return "BlocketSans-Regular"
            case .vendRegular, .dbaRegular: return "VendSansText-Regular" // Vend and DBA share the same font files but use different names for registration.
            case .vendBold, .dbaBold: return "VendSansText-Bold" // Vend and DBA share the same font files but use different names for registration.
            case .neutralRegular: return "Inter-Regular"
            case .neutralSemiBold: return "Inter-SemiBold"
            }
        }
        
        // MARK: - Font Names
        /// The internal name for the font used by the system to render text.
        ///
        /// This is the name that is used to reference the font once it has been registered.
        var name: String {
            switch self {
            case .finnLight: return "FINNType-Light"
            case .finnLightItalic: return "FINNType-LightItalic"
            case .finnMedium: return "FINNType-Medium"
            case .toriBold: return "ToriSans-Bold"
            case .toriRegular: return "ToriSans-Regular"
            case .blocketBold: return "BlocketSans-Bold"
            case .blocketMedium: return "BlocketSans-Medium"
            case .blocketRegular: return "BlocketSans-Regular"
            case .vendRegular, .dbaRegular: return "VendSansText-Regular" // Vend and DBA share the same font files but use different names for registration.
            case .vendBold, .dbaBold: return "VendSansText-Bold" // Vend and DBA share the same font files but use different names for registration.
            case .neutralRegular: return "Inter-Regular"
            case .neutralSemiBold: return "Inter-SemiBold"
            }
        }
        
        // MARK: - Fonts for Themes
        /// Returns an array of fonts that should be registered based on the current theme.
        ///
        /// This property selects the appropriate fonts based on the active `Warp.Theme`.
        static var fontForTheme: [Font] {
            switch Theme {
            case .finn:
                return [.finnLight, .finnLightItalic, .finnMedium]
            case .tori:
                return [.toriBold, .toriRegular]
            case .dba:
                return [.dbaBold, .dbaRegular]
            case .blocket:
                return [.blocketBold, .blocketMedium, .blocketRegular]
            case .vend:
                return [.vendRegular, .vendBold]
            case .neutral:
                return [.neutralRegular, .neutralSemiBold]
            }
        }
    }
}
