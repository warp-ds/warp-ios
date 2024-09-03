import SwiftUI

extension Warp {
    /// Warp representation of the style and appearance of visual text matter.
    public enum Typography {
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
    }
}

extension Warp.Typography {
    /// Bridge between `Warp` and `SwiftUI` font.
    /// Provides a font with size and font weight based on given typography.
    public var font: Font {
        let fontSize = fontSize
        let fontStyle = fontStyle

        switch self {
            case .display,
                 .title1,
                 .title2,
                 .title3,
                 .title4,
                 .title5,
                 .title6,
                 .bodyStrong,
                 .captionStrong,
                 .detailStrong:
                return createMediumBoldFont(for: fontSize, with: fontStyle)
            case .preamble,
                 .body,
                 .caption,
                 .detail:
                return createLightRegularFont(for: fontSize, with: fontStyle)
        }
    }
    
    /// Bridge between `Warp` and `UIKit` font.
    /// Provides a font with size and font weight based on given typography.
    public var uiFont: UIFont {
        let fontSize = fontSize
        let fontStyle = fontStyle

        switch self {
            case .display,
                 .title1,
                 .title2,
                 .title3,
                 .title4,
                 .title5,
                 .title6,
                 .bodyStrong,
                 .captionStrong,
                 .detailStrong:
                return createMediumBoldUIFont(for: fontSize, with: fontStyle)
            case .preamble,
                 .body,
                 .caption,
                 .detail:
                return createLightRegularUIFont(for: fontSize, with: fontStyle)
        }
    }

    private var fontSize: CGFloat {
        switch self {
            case .display:
                return 48.0
            case .title1:
                return 34.0
            case .title2:
                return 28.0
            case .title3:
                return 22.0
            case .title4:
                return 16.0
            case .title5:
                return 14.0
            case .title6:
                return 12.0
            case .preamble:
                return 20.0
            case .body, .bodyStrong:
                return 16.0
            case .caption, .captionStrong:
                return 14.0
            case .detail, .detailStrong:
                return 12.0
        }
    }

    private var fontStyle: Font.TextStyle {
        switch self {
            case .display, .title1:
                return .largeTitle
            case .title2:
                return .title
            case .title3:
                return .title2
            case .title4:
                return .callout
            case .title5:
                return .footnote
            case .title6:
                return .caption
            case .preamble:
                return .title3
            case .body, .bodyStrong:
                return .callout
            case .caption, .captionStrong:
                return .footnote
            case .detail, .detailStrong:
                return .caption
        }
    }
}

extension Warp.Typography {
    private func createFont(from fontStrategy: FontStrategyInterface) -> Font {
        return .custom(
            fontStrategy.font.name,
            size: fontStrategy.size,
            relativeTo: fontStrategy.style
        )
    }
    
    private func createUIFont(from fontStrategy: FontStrategyInterface) -> UIFont {
        let style: UIFont.TextStyle
        let font = UIFont(name: fontStrategy.font.name, size: fontStrategy.size)
        if let font = font {
            return font
        } else {
            switch fontStrategy.style {
            case .largeTitle:  style = .largeTitle
            case .title:       style = .title1
            case .title2:      style = .title2
            case .title3:      style = .title3
            case .headline:    style = .headline
            case .subheadline: style = .subheadline
            case .callout:     style = .callout
            case .caption:     style = .caption1
            case .caption2:    style = .caption2
            case .footnote:    style = .footnote
            case .body:        style = .body
            @unknown default:  style = .body
            }
            return UIFont.preferredFont(forTextStyle: style)
        }
    }

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
        }
    }

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
        }
    }
    
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
        }
    }

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
        }
    }
}
