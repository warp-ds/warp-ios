import SwiftUI

struct HeartShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        // Calculate dimensions and proportions
        let width = rect.width
        let height = rect.height
        let topCurveHeight = height * 0.5 // Adjust curve height
        let bottomPoint = CGPoint(x: width / 2, y: height)

        // Start at the top middle
        path.move(to: CGPoint(x: width / 2, y: topCurveHeight))

        // Left side curve
        path.addCurve(
            to: bottomPoint,
            control1: CGPoint(x: 0, y: 0.2 * height),
            control2: CGPoint(x: 0, y: height * 0.8)
        )

        // Right side curve
        path.addCurve(
            to: CGPoint(x: width / 2, y: topCurveHeight),
            control1: CGPoint(x: width, y: height * 0.8),
            control2: CGPoint(x: width, y: 0.2 * height)
        )

        return path
    }
}

struct CustomHeartIcon: View {
    let fillColor: Color
    let borderColor: Color
    let lineWidth: CGFloat

    var body: some View {
        HeartShape()
            .fill(fillColor) // Fill the inside of the heart
            .overlay(
                HeartShape()
                    .stroke(borderColor, lineWidth: lineWidth) // Add border
            )
            .offset(y: -4)
            .aspectRatio(1, contentMode: .fit)
            .frame(width: 28, height: 25) // Adjust size as needed
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            CustomHeartIcon(fillColor: .red, borderColor: .black, lineWidth: 2)
                .padding()
        }
    }
}

#Preview {
    ContentView()
}
