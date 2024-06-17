import SwiftUI

struct HorizontalProgressShape: Shape {
    let circleRadius: Double
    let pinHeight: Double
    let hasLine: Bool
    var insetAmount: Double

    init(
        circleRadius: Double = 10,
        pinHeight: Double = 1,
        hasLine: Bool,
        insetAmount: Double = 0.0
    ) {
        self.circleRadius = circleRadius
        self.pinHeight = pinHeight
        self.hasLine = hasLine
        self.insetAmount = insetAmount
    }

    func path(in rect: CGRect) -> Path {
        var path = Path()

        // Circle
        path.addArc(
            center: .init(x: rect.minX + (circleRadius - insetAmount), y: rect.midY),
            radius: circleRadius - insetAmount,
            startAngle: .degrees(0),
            endAngle: .degrees(360),
            clockwise: false
        )

        if hasLine {
            let circleDiameter = circleRadius * 2
            let stickWidth = rect.width - (circleDiameter)
            let stickRect = CGRect(
                x: rect.minX + circleDiameter,
                y: rect.midY,
                width: stickWidth,
                height: pinHeight
            )

            path.addRect(stickRect)
        }

        return path
    }
}

extension HorizontalProgressShape: InsettableShape {
    func inset(by amount: CGFloat) -> some InsettableShape {
        var progressShape = self
        progressShape.insetAmount += amount
        return progressShape
    }
}
