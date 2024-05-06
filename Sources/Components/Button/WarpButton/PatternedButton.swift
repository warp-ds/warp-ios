import Foundation
import SwiftUI

/// Individual animated bar width.
private let barWidth = 7.0

struct PatternedButton: View {
    /// Button title.
    private let title: String
    
    /// Animation speed during play time.
    private let animationSpeed: Double
    
    /// Color that will be consumed to created animated bars colors.
    private let patternColor: Color
    
    /// Button action.
    private let action: () -> Void
    
    /// State of animation.
    private var isAnimating: Binding<Bool>

    init(
        title: String, 
        color: Color = .gray,
        animationSpeed: Double = 1,
        isAnimating: Binding<Bool> = .constant(true),
        action: @escaping () -> Void
    ) {
        self.title = title
        patternColor = color
        self.animationSpeed = animationSpeed
        self.isAnimating = isAnimating
        self.action = action
    }

    var body: some View {
        Button(
            action: action,
            label: {
                ZStack {
                    patternedOpaqueView

                    Text(title)
                        .foregroundStyle(Color.black)
                }
            }
        )
        .clipped()
    }

    private var patternedOpaqueView: some View {
        PatternedOpaqueView(
            barWidth: barWidth,
            barColor: patternColor, 
            animationSpeed: animationSpeed,
            isAnimating: isAnimating
        )
    }
}

private struct PatternedOpaqueView: View {
    /// Animated bars individual width.
    private let barWidth: CGFloat
    
    /// Bar background color.
    private let barColor: Color
    
    /// Timing for animation.
    private let animationTiming: Double

    /// State of animation.
    private var isAnimating: Binding<Bool>

    init(barWidth: CGFloat, barColor: Color, animationSpeed: Double, isAnimating: Binding<Bool>) {
        self.barWidth = barWidth
        self.barColor = barColor
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
            return .clear
        }

        return barColor
    }
}

#Preview {
    PatternedButton(
        title: "Hi",
        color: Warp.Config.tokenProvider.backgroundActive,
        action: {}
    )
    .frame(width: 250, height: 50)
    .background(Color.gray)
    .clipShape(RoundedRectangle(cornerRadius: 8))
}
