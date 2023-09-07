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
    
    public var font: Font {
        switch self {
        case .display:
            if Config.warpTheme == .finn {
                return .custom("FINNType-Medium", size: 48, relativeTo: .largeTitle)
            } else {
                return .custom("ToriSans-Bold", size: 48, relativeTo: .largeTitle)
            }
        case .title1:
            if Config.warpTheme == .finn {
                return .custom("FINNType-Medium", size: 34, relativeTo: .largeTitle)
            } else {
                return .custom("ToriSans-Bold", size: 34, relativeTo: .largeTitle)
            }
        case .title2:
            if Config.warpTheme == .finn {
                return .custom("FINNType-Medium", size: 28, relativeTo: .title)
            } else {
                return .custom("ToriSans-Bold", size: 28, relativeTo: .title)
            }
        case .title3:
            if Config.warpTheme == .finn {
                return .custom("FINNType-Medium", size: 22, relativeTo: .title2)
            } else {
                return .custom("ToriSans-Bold", size: 22, relativeTo: .title2)
            }
        case .title4:
            if Config.warpTheme == .finn {
                return .custom("FINNType-Medium", size: 16, relativeTo: .callout)
            } else {
                return .custom("ToriSans-Bold", size: 16, relativeTo: .callout)
            }
        case .title5:
            if Config.warpTheme == .finn {
                return .custom("FINNType-Medium", size: 14, relativeTo: .footnote)
            } else {
                return .custom("ToriSans-Bold", size: 14, relativeTo: .footnote)
            }
        case .title6:
            if Config.warpTheme == .finn {
                return .custom("FINNType-Medium", size: 12, relativeTo: .caption)
            } else {
                return .custom("ToriSans-Bold", size: 12, relativeTo: .caption)
            }
        case .preamble:
            if Config.warpTheme == .finn {
                return .custom("FINNType-Light", size: 20, relativeTo: .title3)
            } else {
                return .custom("ToriSans-Regular", size: 20, relativeTo: .title3)
            }
        case .body:
            if Config.warpTheme == .finn {
                return .custom("FINNType-Light", size: 16, relativeTo: .callout)
            } else {
                return .custom("ToriSans-Regular", size: 16, relativeTo: .callout)
            }
        case .bodyStrong:
            if Config.warpTheme == .finn {
                return .custom("FINNType-Medium", size: 16, relativeTo: .callout)
            } else {
                return .custom("ToriSans-Bold", size: 16, relativeTo: .callout)
            }
        case .caption:
            if Config.warpTheme == .finn {
                return .custom("FINNType-Light", size: 14, relativeTo: .footnote)
            } else {
                return .custom("ToriSans-Regular", size: 14, relativeTo: .footnote)
            }
        case .captionStrong:
            if Config.warpTheme == .finn {
                return .custom("FINNType-Medium", size: 14, relativeTo: .footnote)
            } else {
                return .custom("ToriSans-Bold", size: 14, relativeTo: .footnote)
            }
        case .detail:
            if Config.warpTheme == .finn {
                return .custom("FINNType-Light", size: 12, relativeTo: .caption)
            } else {
                return .custom("ToriSans-Regular", size: 12, relativeTo: .caption)
            }
        case .detailStrong:
            if Config.warpTheme == .finn {
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
