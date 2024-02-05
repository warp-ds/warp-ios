import Foundation
import SwiftUI

extension Warp {
    public struct Callout: View {
        /// Title to present in the callout view
        private var title: String

        /// Height of the arrow to draw, default value is 8 px
        private let arrowHeight: Double

        /// Width of the arrow to draw, default value is 18 px
        private let arrowWidth: Double

        /// Edge where to draw the arrow
        private var arrowEdge: Edge

        /// Object responsible for providing colors in different environments and variants.
        private let colorProvider: ColorProvider

        public init(
            title: String,
            arrowHeight: Double = 8,
            arrowWidth: Double = 18,
            arrowEdge: Edge = .top,
            colorProvider: ColorProvider = Config.colorProvider
        ) {
            self.title = title
            self.arrowHeight = arrowHeight
            self.arrowWidth = arrowWidth
            self.arrowEdge = arrowEdge
            self.colorProvider = colorProvider
        }

        public var body: some View {
            Text(title)
                .font(from: Typography.body)
                .foregroundStyle(colorProvider.calloutText)
                .padding()
                .offset(
                    x: xOffset, y: yOffset
                )
                .background(
                    CalloutShape(
                        arrowHeight: arrowHeight,
                        edge: arrowEdge
                    )
                    .inset(by: 1)
                    .fill(colorProvider.calloutBackground)
                    .overlay {
                        CalloutShape(
                            arrowHeight: arrowHeight,
                            edge: arrowEdge
                        )
                        .strokeBorder(colorProvider.calloutBorder, lineWidth: 2)
                    }
                    .rotation3DEffect(
                        .degrees(rotationDegrees),
                        axis: axis
                    )
                )
        }

        private var xOffset: Double {
            // for leading and trailing arrows we want to push the content half the arrow height away from the arrow
            // on the x axis
            switch arrowEdge {
            case .leading:
                (arrowHeight / 2)
            case .trailing:
                -(arrowHeight / 2)
            case .top, .bottom:
                0
            }
        }

        private var yOffset: Double {
            // for top and bottom arrows we want to push the content half the arrow height away from the arrow
            // on the y axis
            switch arrowEdge {
            case .top:
                (arrowHeight / 2)
            case .bottom:
                -(arrowHeight / 2)
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
