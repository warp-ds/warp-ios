import Foundation
import struct SwiftUI.Font

extension Warp {
    enum Font: CaseIterable {
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

        var name: String {
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

            return "\(component)-\(fontWeight)"
        }
    }
}

protocol FontStrategyInterface {
    var font: Warp.Font { get }
    var size: CGFloat { get }
    var style: Font.TextStyle { get }
}

struct FinnMediumFont: FontStrategyInterface {
    let font: Warp.Font = .finnMedium

    let size: CGFloat

    let style: Font.TextStyle

    init(size: CGFloat, style: Font.TextStyle) {
        self.size = size
        self.style = style
    }
}

struct FinnLightFont: FontStrategyInterface {
    let font: Warp.Font = .finnLight

    let size: CGFloat

    let style: Font.TextStyle

    init(size: CGFloat, style: Font.TextStyle) {
        self.size = size
        self.style = style
    }
}

struct ToriBoldFont: FontStrategyInterface {
    let font: Warp.Font = .toriBold

    let size: CGFloat

    let style: Font.TextStyle

    init(size: CGFloat, style: Font.TextStyle) {
        self.size = size
        self.style = style
    }
}

struct ToriRegularFont: FontStrategyInterface {
    let font: Warp.Font = .toriRegular

    let size: CGFloat

    let style: Font.TextStyle

    init(size: CGFloat, style: Font.TextStyle) {
        self.size = size
        self.style = style
    }
}
