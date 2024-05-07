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
    private var isAnimating: Binding<Bool>

    init(
        barWidth: CGFloat = 7.0,
        barColors: (Color, Color),
        animationSpeed: Double = 1,
        isAnimating: Binding<Bool>
    ) {
        self.barWidth = barWidth
        self.barColors = barColors
        animationTiming = animationSpeed * 4
        self.isAnimating = isAnimating
    }

    var body: some View {
        GeometryReader { geometry in
            let count = Int(geometry.size.width / 3)

            HStack(spacing: 0) {
                ForEach(0..<count, id: \.self) { index in
                    createBar(
                        index: UInt(index),
                        with: geometry.size.width + geometry.size.height
                    )
                }
            }
            .offset(
                x: -(geometry.size.width),
                y: geometry.size.height/3
            )
            .offset(
                x: isAnimating.wrappedValue ? geometry.size.width/2 : 0
                //                            y: isAnimating ? geometry.size.height/2 : 0
            )
            .rotationEffect(Angle(degrees: 45))
            .animation(
                Animation.easeInOut(duration: animationTiming).repeatForever(),
                value: isAnimating.wrappedValue
            )
        }
        .onAppear {
            isAnimating.wrappedValue = true
        }
    }

    private func createBar(index: UInt, with height: CGFloat) -> some View {
        Rectangle()
            .fill(createBackground(for: index))
            .frame(
                width: barWidth,
                height: height,
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
