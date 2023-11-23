import Foundation
import struct SwiftUI.Font

enum FontName: CaseIterable {
    case finnLight
    case finnMedium
    case toriBold
    case toriBoldItalic
    case toriItalic
    case toriMedium
    case toriMediumItalic
    case toriRegular

    var fileName: String {
        let component: String

        switch self {
            case .finnLight, .finnMedium:
                component = "finntype"

            default:
                component = "torisans"
        }

        let fontWeight: String

        switch self {
            case .finnLight:
                fontWeight = "light"

            case .finnMedium, .toriMedium:
                fontWeight = "medium"

            case .toriBold:
                fontWeight = "bold"

            case .toriBoldItalic:
                fontWeight = "bolditalic"

            case .toriItalic:
                fontWeight = "italic"

            case .toriMediumItalic:
                fontWeight = "mediumitalic"

            case .toriRegular:
                fontWeight = "regular"
        }

        return "\(component)_\(fontWeight)"
    }

    var fontName: String {
        let component: String

        switch self {
            case .finnLight, .finnMedium:
                component = "FINNType"

            default:
                component = "ToriSans"
        }

        let fontWeight: String

        switch self {
            case .finnLight:
                fontWeight = "Light"

            case .finnMedium, .toriMedium:
                fontWeight = "Medium"

            case .toriBold:
                fontWeight = "Bold"

            case .toriBoldItalic:
                fontWeight = "BoldItalic"

            case .toriItalic:
                fontWeight = "Italic"

            case .toriMediumItalic:
                fontWeight = "MediumItalic"

            case .toriRegular:
                fontWeight = "Regular"
        }

        return "\(component)_\(fontWeight)"
    }
}

protocol FontStrategyInterface {
    var name: FontName { get }
    var size: CGFloat { get }
    var style: Font.TextStyle { get }
}

struct FinnMediumFont: FontStrategyInterface {
    let name: FontName = .finnMedium

    let size: CGFloat

    let style: Font.TextStyle

    init(size: CGFloat, style: Font.TextStyle) {
        self.size = size
        self.style = style
    }
}

struct FinnLightFont: FontStrategyInterface {
    let name: FontName = .finnLight

    let size: CGFloat

    let style: Font.TextStyle

    init(size: CGFloat, style: Font.TextStyle) {
        self.size = size
        self.style = style
    }
}

struct ToriBoldFont: FontStrategyInterface {
    let name: FontName = .toriBold

    let size: CGFloat

    let style: Font.TextStyle

    init(size: CGFloat, style: Font.TextStyle) {
        self.size = size
        self.style = style
    }
}

struct ToriRegularFont: FontStrategyInterface {
    let name: FontName = .toriRegular

    let size: CGFloat

    let style: Font.TextStyle

    init(size: CGFloat, style: Font.TextStyle) {
        self.size = size
        self.style = style
    }
}
