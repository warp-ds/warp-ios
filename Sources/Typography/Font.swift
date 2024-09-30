import Foundation

extension Warp {
    /// Fonts in `Warp`.
    @preconcurrency @MainActor
    enum Font: CaseIterable {
        case finnLight
        case finnMedium
        
        case toriBold
        case toriBoldItalic
        case toriItalic
        case toriMedium
        case toriMediumItalic
        case toriRegular
        
        case dbaAltBold
        case dbaAltLight
        case dbaAltThin
        case dbaBlack
        case dbaBold
        case dbaExtraBold
        case dbaThin
        case dbaRegular
        
        case blocketDisplay
        case blocketBold
        case blocketMedium
        case blocketRegular
        
        var fileName: String {
            switch self {
            case .finnLight:
                return "finntype_light"
            case .finnMedium:
                return "finntype_medium"
            case .toriBold:
                return "torisans_bold"
            case .toriBoldItalic:
                return "torisans_bolditalic"
            case .toriItalic:
                return "torisans_italic"
            case .toriMedium:
                return "torisans_medium"
            case .toriMediumItalic:
                return "torisans_mediumitalic"
            case .toriRegular:
                return "torisans_regular"
            case .dbaAltBold:
                return "Proxima Nova Alt Bold"
            case .dbaAltLight:
                return "Proxima Nova Alt Light"
            case .dbaAltThin:
                return "Proxima Nova Alt Thin"
            case .dbaBlack:
                return "Proxima Nova Black"
            case .dbaBold:
                return "Proxima Nova Bold"
            case .dbaExtraBold:
                return "Proxima Nova Extrabold"
            case .dbaThin:
                return "Proxima Nova Thin"
            case .dbaRegular:
                return "ProximaNova-Regular"
            case .blocketDisplay:
                return "Blocket-Display"
            case .blocketBold:
                return "BlocketSans-Bold"
            case .blocketMedium:
                return "BlocketSans-Medium"
            case .blocketRegular:
                return "BlocketSans-Regular"
            }
        }
        
        var name: String {
            switch self {
            case .finnLight:
                return "FINNType-Light"
            case .finnMedium:
                return "FINNType-Medium"
            case .toriBold:
                return "ToriSans-Bold"
            case .toriBoldItalic:
                return "ToriSans-BoldItalic"
            case .toriItalic:
                return "ToriSans-Italic"
            case .toriMedium:
                return "ToriSans-Medium"
            case .toriMediumItalic:
                return "ToriSans-MediumItalic"
            case .toriRegular:
                return "ToriSans-Regular"
            case .dbaAltBold:
                return "ProximaNovaA-Bold"
            case .dbaAltLight:
                return "ProximaNovaA-Light"
            case .dbaAltThin:
                return "ProximaNovaA-Thin"
            case .dbaBlack:
                return "ProximaNova-Black"
            case .dbaBold:
                return "ProximaNova-Bold"
            case .dbaExtraBold:
                return "ProximaNova-Extrabld"
            case .dbaThin:
                return "ProximaNovaT-Thin"
            case .dbaRegular:
                return "ProximaNova-Regular"
            case .blocketDisplay:
                return "Blocket-Display"
            case .blocketBold:
                return "BlocketSans-Bold"
            case .blocketMedium:
                return "BlocketSans-Medium"
            case .blocketRegular:
                return "BlocketSans-Regular"
            }
        }
        
        static var fontForTheme: [Font] {
            switch Theme {
            case .finn:
                [.finnLight, .finnMedium]
            case .tori:
                [.toriBold, .toriBoldItalic, .toriItalic, .toriMedium, .toriMediumItalic, .toriRegular]
            case .dba:
                [.dbaAltBold, .dbaAltLight, .dbaAltThin, .dbaBlack, .dbaBold, .dbaExtraBold, .dbaThin, .dbaRegular]
            case .blocket:
                [.blocketDisplay, .blocketBold, .blocketMedium, .blocketRegular]
            }
        }
    }
}
