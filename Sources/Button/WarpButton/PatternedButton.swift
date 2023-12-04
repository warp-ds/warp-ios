import Foundation
import SwiftUI

/// <#Description#>
private let barWidth = 7.0

struct PatternedButton: View {
    /// <#Description#>
    private let title: String
    
    /// <#Description#>
    private let animationSpeed: Double
    
    /// <#Description#>
    private let patternColor: Color
    
    /// <#Description#>
    private let action: () -> Void
    
    /// <#Description#>
    @State private var isAnimating: Bool = false

    init(
        title: String, 
        color: Color = .gray,
        animationSpeed: Double = 1,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.animationSpeed = animationSpeed
        patternColor = color
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
        .onAppear {
            isAnimating = true
        }
    }

    private var patternedOpaqueView: some View {
        PatternedOpaqueView(
            barWidth: barWidth,
            barColor: patternColor, 
            animationSpeed: animationSpeed,
            isAnimating: $isAnimating
        )
    }
}

private struct PatternedOpaqueView: View {
    /// <#Description#>
    private let barWidth: CGFloat
    
    /// <#Description#>
    private let barColor: Color
    
    /// <#Description#>
    private let animationTiming: Double

    /// <#Description#>
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
