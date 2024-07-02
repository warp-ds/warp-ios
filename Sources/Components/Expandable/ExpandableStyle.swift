import SwiftUI

extension Warp {
    public enum ExpandableStyle {
        /// Basic expandable component.
        case `default`

        /// Expandable component with a boxed layout. Round corners
        case box

        /// Expandable component with a boxed layout. Square corners
        case boxBleed

        func backgroundColor(using colorProvider: ColorProvider) -> Color {
            switch self {
            case .default:
                .clear
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
