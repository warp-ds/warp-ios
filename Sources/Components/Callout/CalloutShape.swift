import SwiftUI

@MainActor extension Warp.Callout {

    struct CalloutShape: Shape {
        private struct Corner: Hashable {
            enum Location {
                case topLeft
                case topRight
                case bottomLeft
                case bottomRight
            }

            let point: CGPoint
            let startAngle: Angle
            let endAngle: Angle

            func hash(into hasher: inout Hasher) {
                hasher.combine(startAngle)
                hasher.combine(endAngle)
            }
        }

        private let arrowHeight: Double
        private let arrowWidth: Double
        private let cornerRadius: Double
        private let edge: Edge

        var insetAmount = 0.0

        init(
            arrowHeight: Double,
            arrowWidth: Double,
            cornerRadius: Double,
            edge: Edge
        ) {
            self.arrowHeight = arrowHeight
            self.arrowWidth = arrowWidth
            self.cornerRadius = cornerRadius
            self.edge = edge
        }

        func path(in rect: CGRect) -> Path {
            /*
             I'll dump my knowledge here in case I - or someone else - needs to revisit this.

             Basically the strategy is:

             1. We can draw a callout shape either like this (edge: .top)

              +-----^-----+
              |           |
              +-----------+

             or like this (edge: . leading)

              +-----------+
             <            |
              +-----------+

             and if we need a .bottom or .trailing variant we flip the shape in the `Callout` view

             2. Before we draw, we need to calculate where the corners are.

             - In the .top edge scenario we need to add some room above the top line for the arrow
             - In the .leading edge scenario we need to add some room to the left for the arrow

             That is handled in:

             `CalloutShape.corners(for:edge:)`


             3. Time to draw! We always start in the top left corner and use:

             `Path.addArc(center:radius:startAngle:endAngle:clockwise:transform:)` 

             to draw the corners. We don't have to add lines between those arc'es, that is handled for us.

             4. Armed with this you could draw a shape with rounded corners, but we need to add the arrow as well.

             For that we have to use the:

             `Path.addArc(tangent1End:tangent2End:radius:transform:)`

             variant of addArc.

             For an introduction to how that works, please see this:

             https://stackoverflow.com/questions/66838135/what-are-the-tangent-parameters-found-in-the-addarc-method-for-swiftui

             -  if we are drawing the .top variant we start in the top left corner, then we add an arc at midX - half of
                the arrow width (tangent1End at X1, tangent2End at X2)
             -  we add another arc at midX, minY (+ inset to take a border into account) (tangent1End at Y1, tangent2End at Y2)
             -  we add a final arc at midX + half of the arrow width (tangent1End at Z1, tangent2End at Z2)


                       midX, minY
                         Y1
                        /  \
                       X2  Y2
                      /      \
             +------X1       Z1----Z2----

             -  if we are drawing the .leading variant it is the same...just different :) Instead of midX we operate
                around midY and work our way towards minX.


             I hope the above helps you (me) to understand the drawing code below
             */

            let corners = corners(for: rect, edge: edge)
            guard
                let topLeft = corners[.topLeft],
                let topRight = corners[.topRight],
                let bottomRight = corners[.bottomRight],
                let bottomLeft = corners[.bottomLeft]
            else { return Path() }

            return switch edge {
            case .top, .bottom:
                horizontalCalloutPath(
                    for: rect,
                    topLeft: topLeft,
                    topRight: topRight,
                    bottomRight: bottomRight,
                    bottomLeft: bottomLeft
                )
            case .leading, .trailing:
                verticalCalloutPath(
                    for: rect,
                    topLeft: topLeft,
                    topRight: topRight,
                    bottomRight: bottomRight,
                    bottomLeft: bottomLeft
                )
            }
        }

        private func horizontalCalloutPath(
            for rect: CGRect,
            topLeft: Corner,
            topRight: Corner,
            bottomRight: Corner,
            bottomLeft: Corner
        ) -> Path {
            Path { path in
                let halfArrowWidth = arrowWidth / 2

                // start in topleft corner
                path.move(
                    to: .init(
                        x: rect.minX + (cornerRadius + insetAmount),
                        y: rect.minY + arrowHeight + insetAmount
                    )
                )

                // edge up
                path.addArc(
                    tangent1End: .init(
                        x: rect.midX - halfArrowWidth,
                        y: rect.minY + (arrowHeight + insetAmount)
                    ),
                    tangent2End: .init(
                        x: rect.midX - (halfArrowWidth / 2),
                        y: rect.minY + ((arrowHeight / 2) + insetAmount)
                    ),
                    radius: cornerRadius / 4
                )

                // over top
                path.addArc(
                    tangent1End: .init(
                        x: rect.midX,
                        y: rect.minY + insetAmount
                    ),
                    tangent2End: .init(
                        x: rect.midX + (halfArrowWidth / 2),
                        y: rect.minY + ((arrowHeight / 2) + insetAmount)
                    ),
                    radius: cornerRadius / 2
                )

                // edge down
                path.addArc(
                    tangent1End: .init(
                        x: rect.midX + halfArrowWidth,
                        y: rect.minY + (arrowHeight + insetAmount)
                    ),
                    tangent2End: .init(
                        x: rect.midX + arrowWidth,
                        y: rect.minY + (arrowHeight + insetAmount)
                    ),
                    radius: cornerRadius / 4
                )


                // top right
                path.addArc(
                    center: topRight.point,
                    radius: cornerRadius,
                    startAngle: topRight.startAngle,
                    endAngle: topRight.endAngle,
                    clockwise: false
                )

                // bottom right
                path.addArc(
                    center: bottomRight.point,
                    radius: cornerRadius,
                    startAngle: bottomRight.startAngle,
                    endAngle: bottomRight.endAngle,
                    clockwise: false
                )

                // bottom left
                path.addArc(
                    center: bottomLeft.point,
                    radius: cornerRadius,
                    startAngle: bottomLeft.startAngle,
                    endAngle: bottomLeft.endAngle,
                    clockwise: false
                )

                // top left
                path.addArc(
                    center: topLeft.point,
                    radius: cornerRadius,
                    startAngle: topLeft.startAngle,
                    endAngle: topLeft.endAngle,
                    clockwise: false
                )
            }
        }

        private func verticalCalloutPath(
            for rect: CGRect,
            topLeft: Corner,
            topRight: Corner,
            bottomRight: Corner,
            bottomLeft: Corner
        ) -> Path {
            Path { path in
                let halfArrowWidth = arrowWidth / 2

                // start in topleft corner
                path.move(
                    to: .init(
                        x: rect.minX + arrowHeight + (cornerRadius + insetAmount),
                        y: rect.minY + insetAmount
                    )
                )

                // top right
                path.addArc(
                    center: topRight.point,
                    radius: cornerRadius,
                    startAngle: topRight.startAngle,
                    endAngle: topRight.endAngle,
                    clockwise: false
                )

                // bottom right
                path.addArc(
                    center: bottomRight.point,
                    radius: cornerRadius,
                    startAngle: bottomRight.startAngle,
                    endAngle: bottomRight.endAngle,
                    clockwise: false
                )

                // bottom left
                path.addArc(
                    center: bottomLeft.point,
                    radius: cornerRadius,
                    startAngle: bottomLeft.startAngle,
                    endAngle: bottomLeft.endAngle,
                    clockwise: false
                )

                // edge left
                path.addArc(
                    tangent1End: .init(
                        x: rect.minX + arrowHeight + insetAmount,
                        y: rect.midY + (halfArrowWidth - 1)
                    ),
                    tangent2End: .init(
                        x: rect.minX + ((arrowHeight / 2) + insetAmount),
                        y: rect.midY + (halfArrowWidth / 2)
                    ),
                    radius: cornerRadius / 4
                )

                // over top
                path.addArc(
                    tangent1End: .init(
                        x: rect.minX + insetAmount,
                        y: rect.midY
                    ),
                    tangent2End: .init(
                        x: rect.minX + ((arrowHeight / 2) + insetAmount),
                        y: rect.midY - (halfArrowWidth / 2)
                    ),
                    radius: cornerRadius / 2
                )

                // edge down
                path.addArc(
                    tangent1End: .init(
                        x: rect.minX + arrowHeight + insetAmount,
                        y: rect.midY - (halfArrowWidth - 1)
                    ),
                    tangent2End: .init(
                        x: rect.minX + arrowHeight + insetAmount,
                        y: rect.midY - arrowWidth
                    ),
                    radius: cornerRadius / 4
                )

                // top left
                path.addArc(
                    center: topLeft.point,
                    radius: cornerRadius,
                    startAngle: topLeft.startAngle,
                    endAngle: topLeft.endAngle,
                    clockwise: false
                )
            }
        }

        private func corners(for rect: CGRect, edge: Edge) -> [Corner.Location: Corner] {
            switch edge {
            case .top, .bottom:
                // arrow height subtracted from yPos
                [
                    .topLeft: .init(
                        point: .init(
                            x: rect.minX + (cornerRadius + insetAmount),
                            y: rect.minY + arrowHeight + (cornerRadius + insetAmount)
                        ),
                        startAngle: .degrees(180),
                        endAngle: .degrees(270)
                    ),
                    .topRight: .init(
                        point: .init(
                            x: rect.maxX - (cornerRadius + insetAmount),
                            y: rect.minY + arrowHeight + (cornerRadius + insetAmount)
                        ),
                        startAngle: .degrees(270),
                        endAngle: .degrees(0)
                    ),
                    .bottomRight: .init(
                        point: .init(
                            x: rect.maxX - (cornerRadius + insetAmount),
                            y: rect.maxY - (cornerRadius + insetAmount)
                        ),
                        startAngle: .degrees(0),
                        endAngle: .degrees(90)
                    ),
                    .bottomLeft: .init(
                        point: .init(
                            x: rect.minX + (cornerRadius + insetAmount),
                            y: rect.maxY - (cornerRadius + insetAmount)
                        ),
                        startAngle: .degrees(90),
                        endAngle: .degrees(180)
                    )
                ]
            case .leading, .trailing:
                [
                    // arrow height subtracted from xPos
                    .topLeft: .init(
                        point: .init(
                            x: rect.minX + cornerRadius + (arrowHeight + insetAmount),
                            y: rect.minY + (cornerRadius + insetAmount)
                        ),
                        startAngle: .degrees(180),
                        endAngle: .degrees(270)
                    ),
                    .topRight: .init(
                        point: .init(
                            x: rect.maxX - (cornerRadius + insetAmount),
                            y: rect.minY + (cornerRadius + insetAmount)
                        ),
                        startAngle: .degrees(270),
                        endAngle: .degrees(0)
                    ),
                    .bottomRight: .init(
                        point: .init(
                            x: rect.maxX - (cornerRadius + insetAmount),
                            y: rect.maxY - (cornerRadius + insetAmount)
                        ),
                        startAngle: .degrees(0),
                        endAngle: .degrees(90)
                    ),
                    .bottomLeft: .init(
                        point: .init(
                            x: rect.minX + cornerRadius + (arrowHeight + insetAmount),
                            y: rect.maxY - (cornerRadius + insetAmount)
                        ),
                        startAngle: .degrees(90),
                        endAngle: .degrees(180)
                    )
                ]
            }
        }
    }
}

@MainActor extension Warp.Callout.CalloutShape: InsettableShape {
    func inset(by amount: CGFloat) -> some InsettableShape {
        var calloutShape = self
        calloutShape.insetAmount += amount
        return calloutShape
    }
}
