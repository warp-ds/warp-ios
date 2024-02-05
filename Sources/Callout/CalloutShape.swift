import SwiftUI

extension Warp.Callout {

    /*
     https://stackoverflow.com/questions/66838135/what-are-the-tangent-parameters-found-in-the-addarc-method-for-swiftui
     */
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
            arrowHeight: Double = 16,
            arrowWidth: Double = 20,
            cornerRadius: Double = 8,
            edge: Edge
        ) {
            self.arrowHeight = arrowHeight
            self.arrowWidth = arrowWidth
            self.cornerRadius = cornerRadius
            self.edge = edge
        }

        func path(in rect: CGRect) -> Path {
            let corners = corners(for: rect, edge: edge)
            guard
                let topLeft = corners[.topLeft],
                let topRight = corners[.topRight],
                let bottomRight = corners[.bottomRight],
                let bottomLeft = corners[.bottomLeft]
            else { return Path() }

            return switch edge {
            case .top, .bottom:
                verticalCalloutPath(
                    for: rect,
                    topLeft: topLeft,
                    topRight: topRight,
                    bottomRight: bottomRight,
                    bottomLeft: bottomLeft
                )
            case .leading, .trailing:
                horizontalCalloutPath(
                    for: rect,
                    topLeft: topLeft,
                    topRight: topRight,
                    bottomRight: bottomRight,
                    bottomLeft: bottomLeft
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
                        x: rect.minX + (cornerRadius + insetAmount),
                        y: rect.minY + arrowHeight + insetAmount
                    )
                )

                // move to before middle
                path.addLine(
                    to: CGPoint(
                        x: rect.midX - (arrowWidth + insetAmount),
                        y: rect.minY + (arrowHeight + insetAmount)
                    )
                )

                // edge up
                path.addArc(
                    tangent1End: .init(
                        x: rect.midX - (halfArrowWidth + insetAmount),
                        y: rect.minY + (arrowHeight + insetAmount)
                    ),
                    tangent2End: .init(
                        x: rect.midX - ((halfArrowWidth / 2) + insetAmount),
                        y: rect.minY + ((arrowHeight / 2) + insetAmount)
                    ),
                    radius: cornerRadius
                )

                // over top
                path.addArc(
                    tangent1End: .init(
                        x: rect.midX,
                        y: rect.minY + insetAmount
                    ),
                    tangent2End: .init(
                        x: rect.midX + ((halfArrowWidth / 2) + insetAmount),
                        y: rect.minY + ((arrowHeight / 2) + insetAmount)
                    ),
                    radius: 4
                )

                // edge down
                path.addArc(
                    tangent1End: .init(
                        x: rect.midX + (halfArrowWidth + insetAmount),
                        y: rect.minY + (arrowHeight + insetAmount)
                    ),
                    tangent2End: .init(
                        x: rect.midX + (arrowWidth + insetAmount),
                        y: rect.minY + (arrowHeight + insetAmount)
                    ),
                    radius: cornerRadius
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

                // move to before almost middle
                path.addLine(
                    to: CGPoint(
                        x: rect.minX + arrowHeight + insetAmount,
                        y: rect.midY + arrowWidth
                    )
                )

                // edge left
                path.addArc(
                    tangent1End: .init(
                        x: rect.minX + arrowHeight + insetAmount,
                        y: rect.midY + (halfArrowWidth + insetAmount)
                    ),
                    tangent2End: .init(
                        x: rect.minX + ((arrowHeight / 2) + insetAmount),
                        y: rect.midY + ((arrowWidth / 4) + insetAmount)
                    ),
                    radius: cornerRadius
                )

                // over top
                path.addArc(
                    tangent1End: .init(
                        x: rect.minX + insetAmount,
                        y: rect.midY
                    ),
                    tangent2End: .init(
                        x: rect.minX + ((arrowHeight / 2) + insetAmount),
                        y: rect.midY - ((arrowWidth / 4) + insetAmount)
                    ),
                    radius: 4
                )

                // edge down
                path.addArc(
                    tangent1End: .init(
                        x: rect.minX + arrowHeight + insetAmount,
                        y: rect.midY - (halfArrowWidth + insetAmount)
                    ),
                    tangent2End: .init(
                        x: rect.minX + arrowHeight + insetAmount,
                        y: rect.midY - arrowWidth
                    ),
                    radius: cornerRadius
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
                            x: rect.minX + arrowHeight + (cornerRadius + insetAmount),
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

extension Warp.Callout.CalloutShape: InsettableShape {
    func inset(by amount: CGFloat) -> some InsettableShape {
        var calloutShape = self
        calloutShape.insetAmount += amount
        return calloutShape
    }
}
