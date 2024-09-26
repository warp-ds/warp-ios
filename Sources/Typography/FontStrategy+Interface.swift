import Foundation
import struct SwiftUI.Font

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

struct DbaBoldFont: FontStrategyInterface {
    let font: Warp.Font = .dbaBold
    let size: CGFloat
    let style: Font.TextStyle

    init(size: CGFloat, style: Font.TextStyle) {
        self.size = size
        self.style = style
    }
}

struct DbaRegularFont: FontStrategyInterface {
    let font: Warp.Font = .dbaRegular
    let size: CGFloat
    let style: Font.TextStyle

    init(size: CGFloat, style: Font.TextStyle) {
        self.size = size
        self.style = style
    }
}

struct BlocketDisplayFont: FontStrategyInterface {
    let font: Warp.Font = .blocketDisplay
    let size: CGFloat
    let style: Font.TextStyle

    init(size: CGFloat, style: Font.TextStyle) {
        self.size = size
        self.style = style
    }
}

struct BlocketBoldFont: FontStrategyInterface {
    let font: Warp.Font = .blocketBold
    let size: CGFloat
    let style: Font.TextStyle

    init(size: CGFloat, style: Font.TextStyle) {
        self.size = size
        self.style = style
    }
}

struct BlocketRegularFont: FontStrategyInterface {
    let font: Warp.Font = .blocketRegular
    let size: CGFloat
    let style: Font.TextStyle

    init(size: CGFloat, style: Font.TextStyle) {
        self.size = size
        self.style = style
    }
}
