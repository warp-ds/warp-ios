import Foundation
import struct SwiftUI.Font

/// A protocol defining the interface for font strategies within the Warp design system.
///
/// This protocol is used to abstract font properties such as font type, size, and style for each brand.
protocol FontStrategyInterface {
    /// The font used for this strategy.
    var font: Warp.Font { get }
    /// The size of the font.
    var size: CGFloat { get }
    /// The text style for this font.
    var style: Font.TextStyle { get }
}

// MARK: - Finn Fonts

/// A medium-weight font strategy for the `Finn` brand.
struct FinnMediumFont: FontStrategyInterface {
    let font: Warp.Font = .finnMedium
    let size: CGFloat
    let style: Font.TextStyle
    
    /// Initializes a new `FinnMediumFont` with the specified size and text style.
    ///
    /// - Parameters:
    ///   - size: The font size.
    ///   - style: The SwiftUI text style.
    init(size: CGFloat, style: Font.TextStyle) {
        self.size = size
        self.style = style
    }
}

/// A light-weight font strategy for the `Finn` brand.
struct FinnLightFont: FontStrategyInterface {
    let font: Warp.Font = .finnLight
    let size: CGFloat
    let style: Font.TextStyle
    
    /// Initializes a new `FinnLightFont` with the specified size and text style.
    ///
    /// - Parameters:
    ///   - size: The font size.
    ///   - style: The SwiftUI text style.
    init(size: CGFloat, style: Font.TextStyle) {
        self.size = size
        self.style = style
    }
}

// MARK: - Tori Fonts

/// A bold font strategy for the `Tori` brand.
struct ToriBoldFont: FontStrategyInterface {
    let font: Warp.Font = .toriBold
    let size: CGFloat
    let style: Font.TextStyle
    
    /// Initializes a new `ToriBoldFont` with the specified size and text style.
    ///
    /// - Parameters:
    ///   - size: The font size.
    ///   - style: The SwiftUI text style.
    init(size: CGFloat, style: Font.TextStyle) {
        self.size = size
        self.style = style
    }
}

/// A regular-weight font strategy for the `Tori` brand.
struct ToriRegularFont: FontStrategyInterface {
    let font: Warp.Font = .toriRegular
    let size: CGFloat
    let style: Font.TextStyle
    
    /// Initializes a new `ToriRegularFont` with the specified size and text style.
    ///
    /// - Parameters:
    ///   - size: The font size.
    ///   - style: The SwiftUI text style.
    init(size: CGFloat, style: Font.TextStyle) {
        self.size = size
        self.style = style
    }
}

// MARK: - DBA Fonts

/// A bold font strategy for the `DBA` brand.
struct DbaBoldFont: FontStrategyInterface {
    let font: Warp.Font = .dbaBold
    let size: CGFloat
    let style: Font.TextStyle
    
    /// Initializes a new `DbaBoldFont` with the specified size and text style.
    ///
    /// - Parameters:
    ///   - size: The font size.
    ///   - style: The SwiftUI text style.
    init(size: CGFloat, style: Font.TextStyle) {
        self.size = size
        self.style = style
    }
}

/// A regular-weight font strategy for the `DBA` brand.
struct DbaRegularFont: FontStrategyInterface {
    let font: Warp.Font = .dbaRegular
    let size: CGFloat
    let style: Font.TextStyle
    
    /// Initializes a new `DbaRegularFont` with the specified size and text style.
    ///
    /// - Parameters:
    ///   - size: The font size.
    ///   - style: The SwiftUI text style.
    init(size: CGFloat, style: Font.TextStyle) {
        self.size = size
        self.style = style
    }
}

// MARK: - Blocket Fonts

/// A display font strategy for the `Blocket` brand, typically used for larger titles.
struct BlocketDisplayFont: FontStrategyInterface {
    let font: Warp.Font = .blocketDisplay
    let size: CGFloat
    let style: Font.TextStyle
    
    /// Initializes a new `BlocketDisplayFont` with the specified size and text style.
    ///
    /// - Parameters:
    ///   - size: The font size.
    ///   - style: The SwiftUI text style.
    init(size: CGFloat, style: Font.TextStyle) {
        self.size = size
        self.style = style
    }
}

/// A bold font strategy for the `Blocket` brand.
struct BlocketBoldFont: FontStrategyInterface {
    let font: Warp.Font = .blocketBold
    let size: CGFloat
    let style: Font.TextStyle
    
    /// Initializes a new `BlocketBoldFont` with the specified size and text style.
    ///
    /// - Parameters:
    ///   - size: The font size.
    ///   - style: The SwiftUI text style.
    init(size: CGFloat, style: Font.TextStyle) {
        self.size = size
        self.style = style
    }
}

/// A regular-weight font strategy for the `Blocket` brand.
struct BlocketRegularFont: FontStrategyInterface {
    let font: Warp.Font = .blocketRegular
    let size: CGFloat
    let style: Font.TextStyle
    
    /// Initializes a new `BlocketRegularFont` with the specified size and text style.
    ///
    /// - Parameters:
    ///   - size: The font size.
    ///   - style: The SwiftUI text style.
    init(size: CGFloat, style: Font.TextStyle) {
        self.size = size
        self.style = style
    }
}

// MARK: - Vend Fonts

/// A regular-weight font strategy for the `Vend` brand.
struct VendRegularFont: FontStrategyInterface {
    let font: Warp.Font = .vendRegular
    let size: CGFloat
    let style: Font.TextStyle

    /// Initializes a new `VendRegularFont` with the specified size and text style.
    ///
    /// - Parameters:
    ///   - size: The font size.
    ///   - style: The SwiftUI text style.
    init(size: CGFloat, style: Font.TextStyle) {
        self.size = size
        self.style = style
    }
}

/// A bold font strategy for the `Vend` brand.
struct VendBoldFont: FontStrategyInterface {
    let font: Warp.Font = .vendBold
    let size: CGFloat
    let style: Font.TextStyle

    /// Initializes a new `VendBoldFont` with the specified size and text style.
    ///
    /// - Parameters:
    ///   - size: The font size.
    ///   - style: The SwiftUI text style.
    init(size: CGFloat, style: Font.TextStyle) {
        self.size = size
        self.style = style
    }
}

// MARK: - Neutral Fonts

/// A regular-weight font strategy for a `Neutral` brand.
struct NeutralRegularFont: FontStrategyInterface {
    let font: Warp.Font = .neutralRegular
    let size: CGFloat
    let style: Font.TextStyle

    /// Initializes a new `NeutralRegularFont` with the specified size and text style.
    ///
    /// - Parameters:
    ///   - size: The font size.
    ///   - style: The SwiftUI text style.
    init(size: CGFloat, style: Font.TextStyle) {
        self.size = size
        self.style = style
    }
}

/// A semi-bold font strategy for a `Neutral` brand.
struct NeutralSemiBoldFont: FontStrategyInterface {
    let font: Warp.Font = .neutralSemiBold
    let size: CGFloat
    let style: Font.TextStyle

    /// Initializes a new `NeutralSemiBoldFont` with the specified size and text style.
    ///
    /// - Parameters:
    ///   - size: The font size.
    ///   - style: The SwiftUI text style.
    init(size: CGFloat, style: Font.TextStyle) {
        self.size = size
        self.style = style
    }
}
