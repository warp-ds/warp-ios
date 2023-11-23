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
        }
    }

    var fontName: String {
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
        }
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
