import SwiftUI

extension Warp {
    /// Typography enumeration defines a set of text styles and font sizes used throughout the Warp design system.
    ///
    /// Each case corresponds to a specific text style, ranging from large display styles to smaller detail styles.
    /// Fonts for these styles can be retrieved for both `SwiftUI` and `UIKit` using the appropriate methods.
    public enum Typography: CaseIterable {
        case display
        case title1
        case title2
        case title3
        case title4
        case title5
        case title6
        case preamble
        case body
        case bodyStrong
        case caption
        case captionStrong
        case detail
        case detailStrong
        
        /// Returns a bold `UIFont` for the current typography style, adjusted to the specified font size.
        ///
        /// This method searches for a matching typography style by font size and uses that style if found.
        /// Otherwise, it falls back to the default font style and size for the current typography.
        ///
        /// - Parameter fontSize: The desired font size, or `nil` to use the default size for this typography.
        /// - Returns: A `UIFont` instance with bold styling.
        public func boldUIFont(for fontSize: CGFloat?) -> UIFont {
            let fontStyle = Warp.Typography.allCases.first { $0.fontSize == fontSize }?.fontStyle
            return createMediumBoldUIFont(for: fontSize ?? self.fontSize, with: fontStyle ?? self.fontStyle)
        }
    }
}

extension Warp.Typography {
    /// A computed property that returns the `SwiftUI.Font` representation of the current typography.
    ///
    /// This method provides a `Font` with the correct size and weight based on the typography style.
    public var font: Font {
        let fontSize = fontSize
        let fontStyle = fontStyle

        switch self {
            case .display, .title1, .title2, .title3, .title4, .title5, .title6, .bodyStrong, .captionStrong, .detailStrong:
                return createMediumBoldFont(for: fontSize, with: fontStyle)
            case .preamble, .body, .caption, .detail:
                return createLightRegularFont(for: fontSize, with: fontStyle)
        }
    }
    
    /// A computed property that returns the `UIFont` representation of the current typography.
    ///
    /// This method provides a `UIFont` with the correct size and weight based on the typography style.
    public var uiFont: UIFont {
        let fontSize = fontSize
        let fontStyle = fontStyle

        switch self {
            case .display, .title1, .title2, .title3, .title4, .title5, .title6, .bodyStrong, .captionStrong, .detailStrong:
                return createMediumBoldUIFont(for: fontSize, with: fontStyle)
            case .preamble, .body, .caption, .detail:
                return createLightRegularUIFont(for: fontSize, with: fontStyle)
        }
    }

    // MARK: - Font Sizes

    /// Returns the font size for each typography style.
    private var fontSize: CGFloat {
        switch self {
            case .display: return 48.0
            case .title1: return 34.0
            case .title2: return 28.0
            case .title3: return 22.0
            case .title4: return 16.0
            case .title5: return 14.0
            case .title6: return 12.0
            case .preamble: return 20.0
            case .body, .bodyStrong: return 16.0
            case .caption, .captionStrong: return 14.0
            case .detail, .detailStrong: return 12.0
        }
    }

    /// Returns the font style for each typography case.
    private var fontStyle: Font.TextStyle {
        switch self {
            case .display, .title1: return .largeTitle
            case .title2: return .title
            case .title3: return .title2
            case .title4: return .callout
            case .title5: return .footnote
            case .title6: return .caption
            case .preamble: return .title3
            case .body, .bodyStrong: return .callout
            case .caption, .captionStrong: return .footnote
            case .detail, .detailStrong: return .caption
        }
    }
}

extension Warp.Typography {
    // MARK: - Font Creation Methods

    /// Creates a custom `Font` from a given `FontStrategyInterface`.
    private func createFont(from fontStrategy: FontStrategyInterface) -> Font {
        return .custom(
            fontStrategy.font.name,
            size: fontStrategy.size,
            relativeTo: fontStrategy.style
        )
    }
    
    /// Creates a custom `UIFont` from a given `FontStrategyInterface`.
    private func createUIFont(from fontStrategy: FontStrategyInterface) -> UIFont {
        let style = fontStrategy.style.uiFontTextStyle
        if let font = UIFont(name: fontStrategy.font.name, size: fontStrategy.size) {
            // Need to explicitly scale a custom UIFont
            let fontMetrics = UIFontMetrics(forTextStyle: style)
            return fontMetrics.scaledFont(for: font)
        } else {
            return UIFont.preferredFont(forTextStyle: style)
        }
    }

    /// Creates a medium-bold `Font` for the current theme and typography style.
    private func createMediumBoldFont(for size: CGFloat, with fontStyle: Font.TextStyle) -> Font {
        switch Warp.Theme {
        case .finn:
            return createFont(from: FinnMediumFont(size: size, style: fontStyle))
        case .tori:
            return createFont(from: ToriBoldFont(size: size, style: fontStyle))
        case .dba:
            return createFont(from: DbaBoldFont(size: size, style: fontStyle))
        case .blocket:
            if self == .display {
                return createFont(from: BlocketDisplayFont(size: size, style: fontStyle))
            }
            return createFont(from: BlocketBoldFont(size: size, style: fontStyle))
        case .vend:
            return createFont(from: VendBoldFont(size: size, style: fontStyle))
        case .neutral:
            return createFont(from: NeutralSemiBoldFont(size: size, style: fontStyle) )
        }
    }

    /// Creates a light-regular `Font` for the current theme and typography style.
    private func createLightRegularFont(for size: CGFloat, with fontStyle: Font.TextStyle) -> Font {
        switch Warp.Theme {
        case .finn:
            return createFont(from: FinnLightFont(size: size, style: fontStyle))
        case .tori:
            return createFont(from: ToriRegularFont(size: size, style: fontStyle))
        case .dba:
            return createFont(from: DbaRegularFont(size: size, style: fontStyle))
        case .blocket:
            return createFont(from: BlocketRegularFont(size: size, style: fontStyle))
        case .vend:
            return createFont(from: VendRegularFont(size: size, style: fontStyle))
        case .neutral:
            return createFont(from: NeutralRegularFont(size: size, style: fontStyle) )
        }
    }
    
    /// Creates a medium-bold `UIFont` for the current theme and typography style.
    private func createMediumBoldUIFont(for size: CGFloat, with fontStyle: Font.TextStyle) -> UIFont {
        switch Warp.Theme {
        case .finn:
            return createUIFont(from: FinnMediumFont(size: size, style: fontStyle))
        case .tori:
            return createUIFont(from: ToriBoldFont(size: size, style: fontStyle))
        case .dba:
            return createUIFont(from: DbaBoldFont(size: size, style: fontStyle))
        case .blocket:
            if self == .display {
                return createUIFont(from: BlocketDisplayFont(size: size, style: fontStyle))
            }
            return createUIFont(from: BlocketBoldFont(size: size, style: fontStyle))
        case .vend:
            return createUIFont(from: VendBoldFont(size: size, style: fontStyle))
        case .neutral:
            return createUIFont(from: NeutralSemiBoldFont(size: size, style: fontStyle) )
        }
    }

    /// Creates a light-regular `UIFont` for the current theme and typography style.
    private func createLightRegularUIFont(for size: CGFloat, with fontStyle: Font.TextStyle) -> UIFont {
        switch Warp.Theme {
        case .finn:
            return createUIFont(from: FinnLightFont(size: size, style: fontStyle))
        case .tori:
            return createUIFont(from: ToriRegularFont(size: size, style: fontStyle))
        case .dba:
            return createUIFont(from: DbaRegularFont(size: size, style: fontStyle))
        case .blocket:
            return createUIFont(from: BlocketRegularFont(size: size, style: fontStyle))
        case .vend:
            return createUIFont(from: VendRegularFont(size: size, style: fontStyle))
        case .neutral:
            return createUIFont(from: NeutralRegularFont(size: size, style: fontStyle) )
        }
    }
}

private extension Font.TextStyle {
    var uiFontTextStyle: UIFont.TextStyle {
        let style: UIFont.TextStyle
        switch self {
        case .largeTitle: style = .largeTitle
        case .title: style = .title1
        case .title2: style = .title2
        case .title3: style = .title3
        case .headline: style = .headline
        case .subheadline: style = .subheadline
        case .callout: style = .callout
        case .caption: style = .caption1
        case .caption2: style = .caption2
        case .footnote: style = .footnote
        case .body: style = .body
        @unknown default: style = .body
        }
        return style
    }
}
