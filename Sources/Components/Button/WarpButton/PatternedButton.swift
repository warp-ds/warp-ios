import Foundation
import SwiftUI

/// Individual animated bar width.
private let barWidth = 7.0

struct PatternedOpaqueView: View {
    /// Animated bars individual width.
    private let barWidth: CGFloat

    /// Bar background color.
    private let barColors: (Color, Color)

    /// Timing for animation.
    private let animationTiming: Double

    /// State of animation.
    @State private var isAnimating: Bool = false

    init(
        barWidth: CGFloat = 7.0,
        barColors: (Color, Color),
        animationSpeed: Double = 1
    ) {
        self.barWidth = barWidth
        self.barColors = barColors
        animationTiming = animationSpeed * 4
    }

    var body: some View {
        GeometryReader { geometry in
            let count = Int(geometry.size.width)

            HStack(spacing: 0) {
                ForEach(0..<count, id: \.self) { index in
                    createBar(
                        index: UInt(index),
                        with: geometry.size.width + geometry.size.height
                    )
                }
            }
            .offset(
                x: -(geometry.size.width)*2,
                y: geometry.size.height/3
            )
            .offset(
                x: isAnimating ? geometry.size.width / 2 : 0
            )
            .rotationEffect(Angle(degrees: 45))
            .animation(
                Animation.easeInOut(duration: animationTiming).repeatForever(),
                value: isAnimating
            )
        }
        .onAppear {
            isAnimating = true
        }
    }

    private func createBar(index: UInt, with height: CGFloat) -> some View {
        Rectangle()
            .fill(createBackground(for: index))
            .frame(
                width: barWidth,
                height: height*3,
                alignment: .center
            )
    }

    private func createBackground(for index: UInt) -> Color {
        if index.isMultiple(of: 2) {
            return barColors.0
        }

        return barColors.1
    }
}
