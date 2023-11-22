import SwiftUI

public enum JetBrainsMono: String, CaseIterable {
    case finnLight = "finntype_light" // FINNType-Light
    case finnMedium = "finntype_medium" // FINNType-Medium
    case toriBold = "torisans_bold" // ToriSans-Bold
    case toriBoldItalic = "torisans_bolditalic" // ToriSans-BoldItalic
    case toriItalic = "torisans_italic" // ToriSans-Italic
    case toriMedium = "torisans_medium" // ToriSans-Medium
    case toriMediumItalic = "torisans_mediumitalic" // ToriSans-MediumItalic
    case toriRegular = "torisans_regular" // ToriSans-Regular
}

public extension Font.TextStyle {
    var size: CGFloat {
        switch self {
            case .largeTitle: return 60
            case .title: return 48
            case .title2: return 34
            case .title3: return 24
            case .headline, .body: return 18
            case .subheadline, .callout: return 16
            case .footnote: return 14
            case .caption, .caption2: return 12
            @unknown default:
                return 8
        }
    }
}

public extension Font {
    static func custom(_ font: String, relativeTo style: Font.TextStyle) -> Font {
        custom(font, size: style.size, relativeTo: style)
    }

    //    static let jetBrainsMono = custom(.regular, relativeTo: .body)
    //    static let jetBrainsMonoLargeTitle = custom(.bold, relativeTo: .largeTitle)
    //    static let jetBrainsMonoLargeTitleBlack = custom(.extraBold, relativeTo: .largeTitle)
    //    static let jetBrainsMonoLargeTitleSemiBold = custom(.medium, relativeTo: .largeTitle)
    //    static let jetBrainsMonoTitle1 = custom(.bold, relativeTo: .title)
    //    static let jetBrainsMonoTitle2 = custom(.medium, relativeTo: .title2)
    //    static let jetBrainsMonoTitle3 = custom(.medium, relativeTo: .title3)
    //    static let jetBrainsMonoHeadline = custom(.medium, relativeTo: .headline)
    //    static let jetBrainsMonoSubHeadline = custom(.regular, relativeTo: .subheadline)
    //    static let jetBrainsMonoSubHeadlineItalic = custom(.italic, relativeTo: .subheadline)
    //    static let jetBrainsMonoSubHeadlineSemiBold = custom(.medium, relativeTo: .subheadline)
    //    static let jetBrainsMonoFootnote = custom(.regular, relativeTo: .footnote)
    //    static let jetBrainsMonoFootnoteSemiBold = custom(.medium, relativeTo: .footnote)
    //    static let jetBrainsMonoCaption = custom(.regular, relativeTo: .caption2)

}


private enum FontName: String {
    case finMedium = "FINNType-Medium"
    case toriBold = "ToriSans-Bold"
    case finLight = "FINNType-Light"
    case toriRegular = "ToriSans-Regular"
}

/// Source:
public enum WarpTypography {
    case display, title1, title2, title3, title4, title5, title6, preamble, body, bodyStrong, caption, captionStrong, detail, detailStrong

    private var theme: Warp.Theme {
        Warp.Config.warpTheme
    }

    private var isFinnApp: Bool {
        theme == .finn
    }

    private func _createFont(
        _ fontName: FontName,
        size: CGFloat,
        style: Font.TextStyle
    ) -> Font {
        return .custom(fontName.rawValue, size: size, relativeTo: style)
    }
    
    private func createMediumBoldFont(for size: CGFloat, with fontStyle: Font.TextStyle) -> Font {
        if isFinnApp {
            return _createFont(.finMedium, size: size, style: fontStyle)
        } else {
            return _createFont(.toriBold, size: size, style: fontStyle)
        }
    }

    private func createLightRegularFont(for size: CGFloat, with fontStyle: Font.TextStyle) -> Font {
        if isFinnApp {
            return _createFont(.finLight, size: size, style: fontStyle)
        } else {
            return _createFont(.toriRegular, size: size, style: fontStyle)
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

public struct JBMono {
    public static func registerFonts() {
        JetBrainsMono.allCases.forEach {
            registerFont(bundle: .module, fontName: $0.rawValue, fontExtension: "otf")
        }
    }

    fileprivate static func registerFont(bundle: Bundle, fontName: String, fontExtension: String) {

        guard let fontURL = bundle.url(forResource: fontName, withExtension: fontExtension),
              let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
              let font = CGFont(fontDataProvider) else {
            fatalError("Couldn't create font from data")
        }

        var error: Unmanaged<CFError>?

        CTFontManagerRegisterGraphicsFont(font, &error)
    }


}
