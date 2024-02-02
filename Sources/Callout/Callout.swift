import Foundation
import SwiftUI

extension Warp {
    public struct Callout<Content: View>: View {
        private let arrowHeight: Double
        private let arrowWidth: Double
        private var edge: Edge

        /// Object responsible for providing colors in different environments and variants.
        private let colorProvider: ColorProvider

        private var content: Content

        public init(
            arrowHeight: Double = 8,
            arrowWidth: Double = 18,
            edge: Edge = .top,
            colorProvider: ColorProvider = Config.colorProvider,
            @ViewBuilder content: () -> Content
        ) {
            self.arrowHeight = arrowHeight
            self.arrowWidth = arrowWidth
            self.edge = edge
            self.colorProvider = colorProvider
            self.content = content()
        }

        public var body: some View {
            content
                .padding()
                .offset(
                    y: (arrowHeight / 2) * offsetMultiplier
                )
                .background(
                    CalloutShape(
                        arrowHeight: arrowHeight,
                        edge: edge
                    )
                    .inset(by: 1)
                    .fill(colorProvider.calloutBackground)
                    .overlay {
                        CalloutShape(
                            arrowHeight: arrowHeight,
                            edge: edge
                        )
                        .strokeBorder(colorProvider.calloutBorder, lineWidth: 2)
                    }
                    .rotation3DEffect(
                        .degrees(rotationDegrees),
                        axis: (x: xAxisRotation, y: yAxisRotation, z: 0.0)
                    )
                )
        }

        private var offsetMultiplier: Double {
            switch edge {
            case .top:
                -1.0
            case .leading:
                0.0
            case .bottom:
                1.0
            case .trailing:
                0.0
            }
        }

        private var rotationDegrees: Double {
            switch edge {
            case .top:
                180
            case .leading:
                180
            case .bottom:
                0
            case .trailing:
                0
            }
        }

        private var xAxisRotation: Double {
            switch edge {
            case .top:
                1
            case .leading:
                0
            case .bottom:
                0
            case .trailing:
                0
            }
        }

        private var yAxisRotation: Double {
            switch edge {
            case .top:
                0
            case .leading:
                1
            case .bottom:
                0
            case .trailing:
                0
            }
        }
    }
}
