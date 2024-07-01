import SwiftUI

extension Warp {
    public enum ExpandableStyle {
        case `default`
        case box
        case boxBleed

        func backgroundColor(using colorProvider: ColorProvider) -> Color {
            switch self {
            case .default:
                colorProvider.expandableDefaultBackground
            case .box, .boxBleed:
                colorProvider.expandableBackground
            }
        }
        
        var cornerRadius: Double {
            switch self {
            case .default, .boxBleed: 0
            case .box: 8
            }
        }
    }
}
