import SwiftUI

extension Warp {
    /// A customizable range slider component with two thumbs to select a range of values.
    ///
    /// The slider allows users to adjust the lower and upper bounds within a defined range.
    ///
    /// - Parameters:
    ///   - range: A `Binding` to a `ClosedRange<Double>` representing the current slider range.
    ///   - fullRange: The minimum and maximum possible values for the slider.
    ///   - step: The increment by which the slider values should change. Defaults to `1.0`.
    ///   - onEditingChanged: A closure that is called when either thumb is released, passing the final range as an argument.
    public struct RangeSlider: View {
        /// Tracks which thumb is currently being dragged (lower or upper).
        ///
        /// This state is used to determine which thumb to highlight with the active color
        /// and to ensure that only the appropriate thumb updates during a drag gesture.
        /// When the gesture ends, this property is set back to `nil`.
        @State private var activeThumb: Thumb? = nil
        /// The selected range
        @Binding private var range: ClosedRange<Double>
        /// The possible range for the slider
        private let fullRange: ClosedRange<Double>
        /// Step value for the slider
        private let step: Double
        /// Callback when editing ends
        private let onEditingChanged: ((ClosedRange<Double>) -> Void)?
        /// Object that will provide needed colors.
        private let colorProvider: ColorProvider = Warp.Color
        
        private enum Thumb {
            case lower
            case upper
        }
        
        /// Initializes a new `RangeSlider`.
        ///
        /// - Parameters:
        ///   - range: A `Binding` to a `ClosedRange<Double>` representing the current slider range.
        ///   - fullRange: The minimum and maximum possible values for the slider.
        ///   - step: The increment by which the slider values should change. Defaults to `1.0`.
        ///   - onEditingChanged: A closure that is called when either thumb is released, passing the final range as an argument.
        public init(range: Binding<ClosedRange<Double>>,
                    fullRange: ClosedRange<Double>,
                    step: Double = 1.0,
                    onEditingChanged: ((ClosedRange<Double>) -> Void)? = nil) {
            self._range = range
            self.fullRange = fullRange
            self.step = step
            self.onEditingChanged = onEditingChanged
        }
        
        public var body: some View {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    trackView
                        .frame(height: 4)
                    
                    filledTrackView(width: geometry.size.width)
                        .frame(height: 6)
                    
                    thumbView(for: .lower, width: geometry.size.width)
                        .offset(x: thumbOffset(for: range.lowerBound, width: geometry.size.width) - 12)
                        .gesture(dragGesture(for: .lower, width: geometry.size.width))
                        .frame(width: 24, height: 24)
                    
                    thumbView(for: .upper, width: geometry.size.width)
                        .offset(x: thumbOffset(for: range.upperBound, width: geometry.size.width) - 12)
                        .gesture(dragGesture(for: .upper, width: geometry.size.width))
                        .frame(width: 24, height: 24)
                }
            }
        }
        
        private var trackView: some View {
            Capsule()
                .fill(colorProvider.token.backgroundDisabledSubtle)
        }
        
        private func filledTrackView(width: CGFloat) -> some View {
            Capsule()
                .fill(colorProvider.token.backgroundPrimary)
                .frame(
                    width: CGFloat(progress(for: range.upperBound) - progress(for: range.lowerBound)) * width,
                    alignment: .leading
                )
                .offset(x: thumbOffset(for: range.lowerBound, width: width))
        }
        
        private func thumbView(for thumb: Thumb, width: CGFloat) -> some View {
            Rectangle()
                .fill(activeThumb == thumb ? colorProvider.token.backgroundPrimaryActive : colorProvider.token.backgroundPrimary)
                .cornerRadius(Warp.Border.borderRadius50)
                .addShadow(.small)
        }
        
        private func progress(for value: Double) -> Double {
            let rangeSpan = fullRange.upperBound - fullRange.lowerBound
            return (value - fullRange.lowerBound) / rangeSpan
        }
        
        private func thumbOffset(for value: Double, width: CGFloat) -> CGFloat {
            CGFloat(progress(for: value)) * width
        }
        
        private func dragGesture(for thumb: Thumb, width: CGFloat) -> some Gesture {
            DragGesture(minimumDistance: 0)
                .onChanged { dragValue in
                    let dragPercentage = min(max(0, dragValue.location.x / width), 1)
                    let rangeSpan = fullRange.upperBound - fullRange.lowerBound
                    let rawValue = fullRange.lowerBound + dragPercentage * rangeSpan
                    let steps = generateSteps()
                    
                    let closestStep = steps.min(by: { abs($0 - rawValue) < abs($1 - rawValue) }) ?? fullRange.lowerBound
                    
                    if thumb == .lower {
                        range = max(fullRange.lowerBound, min(closestStep, range.upperBound - step))...range.upperBound
                    } else {
                        range = range.lowerBound...min(fullRange.upperBound, max(closestStep, range.lowerBound + step))
                    }
                    
                    activeThumb = thumb
                }
                .onEnded { _ in
                    onEditingChanged?(range)
                    activeThumb = nil
                }
        }
        
        private func generateSteps() -> [Double] {
            var steps = [fullRange.lowerBound]
            var currentStep = fullRange.lowerBound + step
            while currentStep < fullRange.upperBound {
                steps.append(currentStep)
                currentStep += step
            }
            if steps.last! != fullRange.upperBound {
                steps.append(fullRange.upperBound)
            }
            return steps
        }
    }
}
