import SwiftUI

extension Warp {
    /// A spinner is an animated spinning icon that informs users about the loading of content.
    public struct Spinner: View, Hashable {
        public static func == (lhs: Warp.Spinner, rhs: Warp.Spinner) -> Bool {
            lhs.size.value == rhs.size.value
        }
        
        public func hash(into hasher: inout Hasher) {
            hasher.combine(size.value)
        }
        
        @State private var isCircleRotating = true
        @State private var animateStart = false
        @State private var animateEnd = true
        
        /// Size of the spinner
        private let size: SpinnerSize
        /// Duration of animation
        private let duration: CGFloat
        /// Line width of the spinner
        private let lineWidth: CGFloat
        /// Object that will provide needed colors.
        private let colorProvider: ColorProvider = Warp.Config.colorProvider
        
        public init(size: SpinnerSize = .default,
                    duration: CGFloat = 1,
                    lineWidth: CGFloat = 3) {
            self.size = size
            self.duration = duration
            self.lineWidth = lineWidth
        }
        
        public var body: some View {
            ZStack {
                Circle()
                    .stroke(lineWidth: lineWidth)
                    .fill(colorProvider.spinnerBorder)
                    .frame(width: size.value, height: size.value)
                
                Circle()
                    .trim(from: animateStart ? 1/3 : 1/9, to: animateEnd ? 2/5 : 1)
                    .stroke(lineWidth: lineWidth)
                    .rotationEffect(.degrees(isCircleRotating ? 0 : 360))
                    .frame(width: size.value, height: size.value)
                    .foregroundColor(colorProvider.spinnerBorderTop)
                    .onAppear() {
                        DispatchQueue.main.async {
                            withAnimation(Animation
                                .linear(duration: duration)
                                .repeatForever(autoreverses: false)) {
                                    self.isCircleRotating.toggle()
                                }
                            withAnimation(Animation
                                .linear(duration: duration)
                                .delay(0.5)
                                .repeatForever(autoreverses: true)) {
                                    self.animateStart.toggle()
                                }
                            withAnimation(Animation
                                .linear(duration: duration)
                                .delay(1)
                                .repeatForever(autoreverses: true)) {
                                    self.animateEnd.toggle()
                                }
                        }
                    }
            }
        }
    }
}

#Preview {
    VStack {
        Warp.Spinner(size: .small)
        Warp.Spinner()
        Warp.Spinner(size: .larger)
        Warp.Spinner(size: .custom(50))
    }
}
