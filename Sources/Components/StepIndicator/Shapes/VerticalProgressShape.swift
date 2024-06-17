import Foundation
import SwiftUI

struct VerticalProgressShape: Shape {
    let circleRadius: Double
    let pinWidth: Double
    let hasLine: Bool
    var insetAmount: Double

    init(
        circleRadius: Double = 10,
        pinWidth: Double = 2,
        hasLine: Bool,
        insetAmount: Double = 0.0
    ) {
        self.circleRadius = circleRadius
        self.pinWidth = pinWidth
        self.hasLine = hasLine
        self.insetAmount = insetAmount
    }

    func path(in rect: CGRect) -> Path {
        var path = Path()

        // Circle
        path.addArc(
            center: .init(x: rect.midX, y: rect.minY + (circleRadius - insetAmount)),
            radius: circleRadius - insetAmount,
            startAngle: .degrees(0),
            endAngle: .degrees(360),
            clockwise: false
        )

        if hasLine {
            let circleDiameter = circleRadius * 2
            let stickHeight = rect.height - (circleDiameter)
            let stickRect = CGRect(
                x: rect.midX - (pinWidth / 2),
                y: circleDiameter - 1,
                width: pinWidth,
                height: stickHeight
            )

            path.addRect(stickRect)
        }

        return path
    }
}

extension VerticalProgressShape: InsettableShape {
    func inset(by amount: CGFloat) -> some InsettableShape {
        var progressShape = self
        progressShape.insetAmount += amount
        return progressShape
    }
}
