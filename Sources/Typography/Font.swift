import Foundation

extension Warp {
    /// An enumeration representing the fonts used within the Warp design system.
    ///
    /// Each case corresponds to a specific font used by different brands (e.g., `finn`, `tori`, `dba`, `blocket`), and each font has
    /// associated file names and font names that are used for registration and application in the design system.
    enum Font: CaseIterable {
        // MARK: - Finn Fonts
        case finnLight
        case finnLightItalic
        case finnMedium
        case finnMediumItalic

        // MARK: - Tori Fonts
        case toriBold
        case toriBoldItalic
        case toriItalic
        case toriMedium
        case toriMediumItalic
        case toriRegular
        
        // MARK: - DBA Fonts
        case dbaAltBold
        case dbaAltLight
        case dbaAltThin
        case dbaBlack
        case dbaBold
        case dbaExtraBold
        case dbaThin
        case dbaRegular
        
        // MARK: - Blocket Fonts
        case blocketDisplay
        case blocketBold
        case blocketMedium
        case blocketRegular
        
        // MARK: - Font File Names
        /// The file name for the font as it appears in the bundle (without extension).
        ///
        /// This is used to load the font file from the app's resources.
        var fileName: String {
            switch self {
            case .finnLight: return "finntype_light"
            case .finnLightItalic: return "finntype_light_italic"
            case .finnMedium: return "finntype_medium"
            case .finnMediumItalic: return "finntype_medium_italic"
            case .toriBold: return "torisans_bold"
            case .toriBoldItalic: return "torisans_bolditalic"
            case .toriItalic: return "torisans_italic"
            case .toriMedium: return "torisans_medium"
            case .toriMediumItalic: return "torisans_mediumitalic"
            case .toriRegular: return "torisans_regular"
            case .dbaAltBold: return "Proxima Nova Alt Bold"
            case .dbaAltLight: return "Proxima Nova Alt Light"
            case .dbaAltThin: return "Proxima Nova Alt Thin"
            case .dbaBlack: return "Proxima Nova Black"
            case .dbaBold: return "Proxima Nova Bold"
            case .dbaExtraBold: return "Proxima Nova Extrabold"
            case .dbaThin: return "Proxima Nova Thin"
            case .dbaRegular: return "ProximaNova-Regular"
            case .blocketDisplay: return "Blocket-Display"
            case .blocketBold: return "BlocketSans-Bold"
            case .blocketMedium: return "BlocketSans-Medium"
            case .blocketRegular: return "BlocketSans-Regular"
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
            case .finnMediumItalic: return "FINNType-MediumItalic"
            case .toriBold: return "ToriSans-Bold"
            case .toriBoldItalic: return "ToriSans-BoldItalic"
            case .toriItalic: return "ToriSans-Italic"
            case .toriMedium: return "ToriSans-Medium"
            case .toriMediumItalic: return "ToriSans-MediumItalic"
            case .toriRegular: return "ToriSans-Regular"
            case .dbaAltBold: return "ProximaNovaA-Bold"
            case .dbaAltLight: return "ProximaNovaA-Light"
            case .dbaAltThin: return "ProximaNovaA-Thin"
            case .dbaBlack: return "ProximaNova-Black"
            case .dbaBold: return "ProximaNova-Bold"
            case .dbaExtraBold: return "ProximaNova-Extrabld"
            case .dbaThin: return "ProximaNovaT-Thin"
            case .dbaRegular: return "ProximaNova-Regular"
            case .blocketDisplay: return "Blocket-Display"
            case .blocketBold: return "BlocketSans-Bold"
            case .blocketMedium: return "BlocketSans-Medium"
            case .blocketRegular: return "BlocketSans-Regular"
            }
        }
        
        // MARK: - Fonts for Themes
        /// Returns an array of fonts that should be registered based on the current theme.
        ///
        /// This property selects the appropriate fonts based on the active `Warp.Theme`.
        static var fontForTheme: [Font] {
            switch Theme {
            case .finn:
                return [.finnLight, .finnLightItalic, .finnMedium, .finnMediumItalic]
            case .tori:
                return [.toriBold, .toriBoldItalic, .toriItalic, .toriMedium, .toriMediumItalic, .toriRegular]
            case .dba:
                return [.dbaAltBold, .dbaAltLight, .dbaAltThin, .dbaBlack, .dbaBold, .dbaExtraBold, .dbaThin, .dbaRegular]
            case .blocket:
                return [.blocketDisplay, .blocketBold, .blocketMedium, .blocketRegular]
            }
        }
    }
}
