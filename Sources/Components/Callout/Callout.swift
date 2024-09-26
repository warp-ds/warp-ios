import Foundation
import SwiftUI

extension Warp {
    /**
     Callouts are snippets of information, drawing attention to important content.

     **When to use**

     Call attention to important pieces of information.

    To use the iOS `Callout` View you need to provide it with
     - a `title`
     - an `arrowHeight`, if you don't provide this, the default value is 8 px
     - an `arrowWidth`, if you don't provide this, the default value is 18px
     - an `arrowEdge` where you want the Callout to appear from
     - a `cornerRadius`, if you don't provide this, the default value is 8px
     */
    public struct Callout: View {
        /// Size of callout
        private let size: CalloutSize

        /// Callout type, default is inline
        private let type: CalloutType

        /// Title to present in the callout view
        private var title: String

        /// Height of the arrow to draw, value is 8 px
        private let arrowHeight: Double = 8

        /// Width of the arrow to draw, value is 18 px
        private let arrowWidth: Double = 18


        /// Edge where to draw the arrow, default value is `.top`
        private var arrowEdge: Edge

        /// Corner radius,
        private let cornerRadius: Double

        /// Object responsible for providing colors in different environments and variants.
        private let colorProvider: ColorProvider

        /**
         - Parameter size: Size of callout, default value is `.default`
         - Parameter type:  Type of callout, default is `.inline`
         - Parameter title: String to display in the `Callout`
         - Parameter arrowEdge: Edge where to draw the arrow, default value is `.top`
         - Parameter colorProvider: ColorProvider used for styling the `Callout`, default value is read from `Config`
         */
        public init(
            size: CalloutSize = .default,
            type: CalloutType = .inline,
            title: String,
            arrowEdge: Edge = .top,
            colorProvider: ColorProvider = Warp.Color
        ) {
            self.size = size
            self.type = type
            self.title = title
            self.arrowEdge = arrowEdge
            self.cornerRadius = size.cornerRadius
            self.colorProvider = colorProvider
        }

        public var body: some View {
            contentView
                .background(
                    calloutBackground
                )
        }

        private var contentView: some View {
            HStack {
                Text(title, style: size.textStyle)
                    .foregroundStyle(colorProvider.calloutText)

                switch type {
                case .inline:
                    EmptyView()
                case .popover(let onTapped):
                    if let onTapped = onTapped {
                        Image("icon-close", bundle: .module)
                            .accessibilityAddTraits(.isButton) // Make it behave like a button for VoiceOver
                            .accessibilityAction {
                                // VoiceOver double-tap handling
                                onTapped()
                            }
                    } else {
                        EmptyView()
                    }
                }
            }
            .padding(.horizontal, 12)
            .padding(.vertical, size.verticalPadding(for:arrowEdge, arrowHeight: arrowHeight))
            .offset(
                x: xOffset, y: yOffset
            )
        }

        @ViewBuilder
        private var calloutBackground: some View {
            switch type {
            case .inline:
                sharedBackground
            case .popover:
                sharedBackground
                    .onTapGesture {
                        type.onTapped?()
                    }
                    .addShadow(.large)
            }
        }

        private var sharedBackground: some View {
            CalloutShape(
                arrowHeight: arrowHeight,
                arrowWidth: arrowWidth,
                cornerRadius: cornerRadius,
                edge: arrowEdge
            )
            .inset(by: 1)
            .fill(colorProvider.calloutBackground)
            .overlay {
                CalloutShape(
                    arrowHeight: arrowHeight,
                    arrowWidth: arrowWidth,
                    cornerRadius: cornerRadius,
                    edge: arrowEdge
                )
                .strokeBorder(colorProvider.calloutBorder, lineWidth: 2)
            }
            .rotation3DEffect(
                .degrees(rotationDegrees),
                axis: axis
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
