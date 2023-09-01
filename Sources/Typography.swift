import SwiftUI

/// Source:
public enum WarpTypography {
    case display, title1, title2, title3, title4, title5, title6, preamble, body, bodyStrong, caption, captionStrong, detail, detailStrong
    
    public var font: Font {
        switch self {
        case .display:
            return .system(size: 48).bold()
        case .title1:
            return .system(.largeTitle).bold()
        case .title2:
            return .system(.title).bold()
        case .title3:
            return .system(.title2).bold()
        case .title4:
            return .system(.callout).bold()
        case .title5:
            return .system(.footnote).bold()
        case .title6:
            return .system(.caption).bold()
        case .preamble:
            return .system(.title3)
        case .body:
            return .system(.callout)
        case .bodyStrong:
            return .system(.callout).bold()
        case .caption:
            return .system(.footnote)
        case .captionStrong:
            return .system(.footnote).bold()
        case .detail:
            return .system(.caption)
        case .detailStrong:
            return .system(.caption).bold()
        }
    }
}
