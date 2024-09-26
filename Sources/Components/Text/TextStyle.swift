import SwiftUI

extension Warp {
    /// Warp representation of the style and appearance of visual text matter.
    @MainActor
    public enum TextStyle: Equatable, CaseIterable {
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
        
        var asTypography: Typography {
            switch self {
            case .display:
                return Typography.display
            case .title1:
                return Typography.title1
            case .title2:
                return Typography.title2
            case .title3:
                return Typography.title3
            case .title4:
                return Typography.title4
            case .title5:
                return Typography.title5
            case .title6:
                return Typography.title6
            case .preamble:
                return Typography.preamble
            case .body:
                return Typography.body
            case .bodyStrong:
                return Typography.bodyStrong
            case .caption:
                return Typography.caption
            case .captionStrong:
                return Typography.captionStrong
            case .detail:
                return Typography.detail
            case .detailStrong:
                return Typography.detailStrong
            }
        }
    }
}
