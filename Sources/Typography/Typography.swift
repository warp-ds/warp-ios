import SwiftUI

extension Warp {
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

/// Source:
extension Warp.Typography {
    private var isFinnApp: Bool {
        Warp.Config.warpTheme == .finn
    }

    private func createFont(from fontStrategy: FontStrategyInterface) -> Font {
        return .custom(
            fontStrategy.name.fontName,
            size: fontStrategy.size,
            relativeTo: fontStrategy.style
        )
    }

    private func createMediumBoldFont(for size: CGFloat, with fontStyle: Font.TextStyle) -> Font {
        if isFinnApp {
            return createFont(from: FinnMediumFont(size: size, style: fontStyle))
        } else {
            return createFont(from: ToriBoldFont(size: size, style: fontStyle))
        }
    }

    private func createLightRegularFont(for size: CGFloat, with fontStyle: Font.TextStyle) -> Font {
        if isFinnApp {
            return createFont(from: FinnLightFont(size: size, style: fontStyle))
        } else {
            return createFont(from: ToriRegularFont(size: size, style: fontStyle))
        }
    }

    public var font: Font {
        switch self {
            case .display:
                let size = 48.0
                let fontStyle: Font.TextStyle = .largeTitle

                return createMediumBoldFont(for: size, with: fontStyle)

            case .title1:
                let size = 34.0
                let fontStyle: Font.TextStyle = .largeTitle

                return createMediumBoldFont(for: size, with: fontStyle)

            case .title2:
                let size = 28.0
                let fontStyle: Font.TextStyle = .title

                return createMediumBoldFont(for: size, with: fontStyle)

            case .title3:
                let size = 22.0
                let fontStyle: Font.TextStyle = .title2

                return createMediumBoldFont(for: size, with: fontStyle)

            case .title4:
                let size = 16.0
                let fontStyle: Font.TextStyle = .callout

                return createMediumBoldFont(for: size, with: fontStyle)

            case .title5:
                let size = 14.0
                let fontStyle: Font.TextStyle = .footnote

                return createMediumBoldFont(for: size, with: fontStyle)

            case .title6:
                let size = 12.0
                let fontStyle: Font.TextStyle = .caption

                return createMediumBoldFont(for: size, with: fontStyle)

            case .preamble:
                let size = 20.0
                let fontStyle: Font.TextStyle = .title3

                return createLightRegularFont(for: size, with: fontStyle)

            case .body:
                let size = 16.0
                let fontStyle: Font.TextStyle = .callout
                
                return createLightRegularFont(for: size, with: fontStyle)

            case .bodyStrong:
                let size = 16.0
                let fontStyle: Font.TextStyle = .callout

                return createMediumBoldFont(for: size, with: fontStyle)

            case .caption:
                let size = 14.0
                let fontStyle: Font.TextStyle = .footnote

                return createLightRegularFont(for: size, with: fontStyle)

            case .captionStrong:
                let size = 14.0
                let fontStyle: Font.TextStyle = .footnote

                return createMediumBoldFont(for: size, with: fontStyle)

            case .detail:
                let size = 12.0
                let fontStyle: Font.TextStyle = .caption

                return createLightRegularFont(for: size, with: fontStyle)

            case .detailStrong:
                let size = 12.0
                let fontStyle: Font.TextStyle = .caption

                return createMediumBoldFont(for: size, with: fontStyle)
        }
    }
}

