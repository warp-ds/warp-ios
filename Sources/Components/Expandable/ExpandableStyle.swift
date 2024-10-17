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
                colorProvider.token.backgroundTransparent0
            case .box, .boxBleed:
                colorProvider.token.backgroundSubtle
            }
        }
        
        var cornerRadius: Double {
            switch self {
            case .default, .boxBleed: 0
            case .box: Warp.Border.borderRadius100
            }
        }
    }
}
