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





/// Source:
public enum WarpTypography {
    case display, title1, title2, title3, title4, title5, title6, preamble, body, bodyStrong, caption, captionStrong, detail, detailStrong

    private var theme: Warp.Theme {
        Warp.Config.warpTheme
    }

    private var isFinnApp: Bool {
        theme == .finn
    }

    //    private enum Apps {
    //        case tori(Fonts)
    //        case fin(Fonts)
    //
    //        enum Fonts {
    //            case me
    //        }
    //    }

    enum Fonts: String {
        case finMedium = "FINNType-Medium"
        case toriBold = "ToriSans-Bold"
    }

    private func createFont(for size: CGFloat, with fontStyle: Font.TextStyle) -> Font {
        //        let size = 48.0
        //        let fontStyle: Font.TextStyle = .largeTitle
        let finMedium = "FINNType-Medium"
        let toriBold = "ToriSans-Bold"

        if isFinnApp {
            return .custom(finMedium, size: size, relativeTo: fontStyle)
        } else {
            return .custom(toriBold, size: size, relativeTo: fontStyle)
        }
    }

    public var font: Font {
        switch self {
            case .display:
                let size = 48.0
                let fontStyle: Font.TextStyle = .largeTitle

                return createFont(for: size, with: fontStyle)

            case .title1:
                let size = 34.0
                let fontStyle: Font.TextStyle = .largeTitle

                return createFont(for: size, with: fontStyle)

            case .title2:
                let size = 28.0
                let fontStyle: Font.TextStyle = .title

                return createFont(for: size, with: fontStyle)

            case .title3:
                let size = 22.0
                let fontStyle: Font.TextStyle = .title2

                return createFont(for: size, with: fontStyle)

            case .title4:
                let size = 16.0
                let fontStyle: Font.TextStyle = .callout

                return createFont(for: size, with: fontStyle)

            case .title5:
                let size = 14.0
                let fontStyle: Font.TextStyle = .footnote

                return createFont(for: size, with: fontStyle)

            case .title6:
                let size = 12.0
                let fontStyle: Font.TextStyle = .caption

                return createFont(for: size, with: fontStyle)

            case .preamble:
                if isFinnApp {
                    return .custom("FINNType-Light", size: 20, relativeTo: .title3)
                } else {
                    return .custom("ToriSans-Regular", size: 20, relativeTo: .title3)
                }

            case .body:
                if isFinnApp {
                    return .custom("FINNType-Light", size: 16, relativeTo: .callout)
                } else {
                    return .custom("ToriSans-Regular", size: 16, relativeTo: .callout)
                }
            case .bodyStrong:
                if isFinnApp {
                    return .custom("FINNType-Medium", size: 16, relativeTo: .callout)
                } else {
                    return .custom("ToriSans-Bold", size: 16, relativeTo: .callout)
                }
            case .caption:
                if isFinnApp {
                    return .custom("FINNType-Light", size: 14, relativeTo: .footnote)
                } else {
                    return .custom("ToriSans-Regular", size: 14, relativeTo: .footnote)
                }
            case .captionStrong:
                if isFinnApp {
                    return .custom("FINNType-Medium", size: 14, relativeTo: .footnote)
                } else {
                    return .custom("ToriSans-Bold", size: 14, relativeTo: .footnote)
                }
            case .detail:
                if isFinnApp {
                    return .custom("FINNType-Light", size: 12, relativeTo: .caption)
                } else {
                    return .custom("ToriSans-Regular", size: 12, relativeTo: .caption)
                }
            case .detailStrong:
                if isFinnApp {
                    return .custom("FINNType-Medium", size: 12, relativeTo: .caption)
                } else {
                    return .custom("ToriSans-Bold", size: 12, relativeTo: .caption)
                }
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
