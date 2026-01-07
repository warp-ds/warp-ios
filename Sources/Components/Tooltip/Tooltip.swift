import Foundation
import SwiftUI

extension Warp {
    /**
     A tooltip is a message box that is displayed when a user hovers over or gives focus to a UI element.
     
     **When to use**
     
     Tooltips should be used sparingly and contain succinct, supplementary information.
     
     To use the iOS `Tooltip` View you need to provide it with
     - a `title`
     - an `arrowEdge` where you want the Tooltip to appear from
     */
    public struct Tooltip: View {
        /// Title to present in the tooltip view
        private var title: String
        
        /// Edge where to draw the arrow, default value is `.top`
        private var arrowEdge: Edge

        /// Custom arrow offset from top/leading edge
        private var arrowOffset: CGFloat?
        
        /// Object responsible for providing colors in different environments and variants.
        private let colorProvider: ColorProvider = Warp.Color
        
        /// Constants to create the view
        private let arrowHeight: CGFloat = 8
        private let arrowWidth: CGFloat = 18
        private let cornerRadius: CGFloat = 4
        
        /**
         - Parameter title: String to display in the `Tooltip`
         - Parameter arrowEdge: Edge where to draw the arrow, default value is `.top`
         - Parameter arrowOffset: Optional arrow offset from top/leading edge
         */
        public init(
            title: String,
            arrowEdge: Edge = .top,
            arrowOffset: CGFloat? = nil
        ) {
            self.title = title
            self.arrowEdge = arrowEdge
            self.arrowOffset = arrowOffset
        }
        
        public var body: some View {
            contentView
                .background(
                    sharedBackground
                )
                .addShadow(.medium)
        }
        
        private var contentView: some View {
            HStack {
                Text(title, style: .caption, color: colorProvider.token.textInvertedStatic)
            }
            .padding(.horizontal, horizontalPadding)
            .padding(.vertical, verticalPadding)
            .offset(
                x: xOffset, y: yOffset
            )
        }
        
        private var sharedBackground: some View {
            Warp.Callout.CalloutShape(
                arrowHeight: arrowHeight,
                arrowWidth: arrowWidth,
                cornerRadius: cornerRadius,
                edge: arrowEdge,
                arrowOffset: arrowOffset
            )
            .inset(by: 1)
            .fill(colorProvider.tooltipBackgroundStatic)
            .rotation3DEffect(
                .degrees(rotationDegrees),
                axis: axis
            )
        }
        
        private var horizontalPadding: Double {
            // the horizontal padding around the content depending on the arrowedge
            switch arrowEdge {
            case .leading, .trailing:
                12
            case .top, .bottom:
                8
            }
        }
        
        private var verticalPadding: Double {
            // the vertical padding around the content depending on the arrowedge
            switch arrowEdge {
            case .leading, .trailing:
                8
            case .top, .bottom:
                12
            }
        }
        
        private var xOffset: Double {
            // for leading and trailing arrows we want to push the content half the arrow height away from the arrow
            // on the x axis
            switch arrowEdge {
            case .leading:
                4
            case .trailing:
                -4
            case .top, .bottom:
                0
            }
        }
        
        private var yOffset: Double {
            // for top and bottom arrows we want to push the content half the arrow height away from the arrow
            // on the y axis
            switch arrowEdge {
            case .top:
                4
            case .bottom:
                -4
            case .leading, .trailing:
                0
            }
        }
        
        private var axis: (x: CGFloat, y: CGFloat, z: CGFloat) {
            // we're interested in rotating the "bubble" around either the x or y axis in bottom/trailing scenarios
            // and in top/leading scenarios we do nothing
            switch arrowEdge {
            case .top, .leading:
                (x: 0.0, y: 0.0, z: 0.0)
            case .bottom:
                (x: 1.0, y: 0.0, z: 0.0)
            case .trailing:
                (x: 0.0, y: 1.0, z: 0.0)
            }
        }
        
        private var rotationDegrees: Double {
            // same as above, for bottom/trailing we want to rotate 180 degrees and for top/leading: no rotation
            switch arrowEdge {
            case .top, .leading:
                0
            case .bottom, .trailing:
                180
            }
        }
    }
}
