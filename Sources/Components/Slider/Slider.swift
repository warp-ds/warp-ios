import SwiftUI

extension Warp {
    /// A customizable slider component to adjust values within a given range.
    ///
    /// The slider allows for setting the value with a defined step interval and rounds the displayed value to a specified precision.
    ///
    /// - Parameters:
    ///   - value: A `Binding` value representing the current slider value.
    ///   - range: The minimum and maximum values for the slider, defined as a `ClosedRange<Double>`.
    ///   - step: The increment by which the slider value should change. Defaults to `1.0`.
    ///   - precision: The number of decimal places to round the slider value to. Defaults to `2`.
    ///   - onEditingChanged: A closure that is called when the slider's thumb is released, passing the final value as an argument.

#if swift(<6.0)
    @preconcurrency @MainActor
#endif
    public struct Slider: View {
        // Constants for styling
        private let cornerRadius: CGFloat = 4
        private let trackColor = Warp.Color.sliderTrackBackground
        private let filledTrackColor = Warp.Color.sliderTrackBackgroundActive
        private let thumbColor = Warp.Color.sliderHandleBackground
        
        @Binding var value: Double // Binding value to update the slider value
        let range: ClosedRange<Double> // Defines the range for the slider
        let step: Double // Step value for the slider
        let precision: Int // Number of decimal places for rounding the value
        let onEditingChanged: ((Double) -> Void)? // Completion handler to return the value when handle is dropped
        
        public init(value: Binding<Double>, range: ClosedRange<Double>, step: Double = 1.0, precision: Int = 2, onEditingChanged: ((Double) -> Void)? = nil) {
            
            // Critical checks to ensure valid input parameters
            precondition(step > 0, "Step must be greater than zero.")
            precondition(range.lowerBound <= range.upperBound, "Invalid range: lowerBound must be less than or equal to upperBound.")
            precondition(step <= (range.upperBound - range.lowerBound), "Step must be less than or equal to the range span.")
            precondition(value.wrappedValue >= range.lowerBound && value.wrappedValue <= range.upperBound, "Initial value must be within the specified range.")
            
            self._value = value
            self.range = range
            self.step = step
            self.precision = precision
            self.onEditingChanged = onEditingChanged
        }
        
        public var body: some View {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    trackView // Gray background track
                        .frame(height: 4)
                    
                    filledTrackView(width: geometry.size.width) // Filled track
                        .frame(height: 6)
                    
                    thumbView(width: geometry.size.width) // Thumb (slider handle)
                        .frame(width: 24, height: 24)
                        .offset(x: thumbOffset(width: geometry.size.width) - 10) // Center thumb
                        .gesture(
                            DragGesture()
                                .onChanged { dragValue in
                                    updateValue(dragValue: dragValue, width: geometry.size.width) // Update value while dragging
                                }
                                .onEnded { _ in
                                    onEditingChanged?(value) // Notify when dragging ends
                                }
                        )
                }
            }
        }
        
        // Background track (gray line for incomplete part)
        private var trackView: some View {
            Capsule()
                .fill(trackColor)
        }
        
        // Filled track (colorful line for filled part)
        private func filledTrackView(width: CGFloat) -> some View {
            Capsule()
                .fill(filledTrackColor)
                .frame(width: CGFloat((value - range.lowerBound) / (range.upperBound - range.lowerBound)) * width)
        }
        
        // Square thumb (slider handle)
        private func thumbView(width: CGFloat) -> some View {
            Rectangle()
                .fill(thumbColor)
                .cornerRadius(cornerRadius)
                .addShadow(.small)
        }
        
        // Calculates thumb offset based on current value
        private func thumbOffset(width: CGFloat) -> CGFloat {
            return CGFloat((value - range.lowerBound) / (range.upperBound - range.lowerBound)) * width
        }
        
        // Updates slider value based on thumb drag
        private func updateValue(dragValue: DragGesture.Value, width: CGFloat) {
            let dragPercentage = min(max(0, dragValue.location.x / width), 1) // Clamp between 0 and 1
            let newValue = range.lowerBound + dragPercentage * (range.upperBound - range.lowerBound)
            let steppedValue = (newValue / step).rounded() * step
            value = roundToPrecision(steppedValue)
        }
        
        // Rounds value to specified decimal precision
        private func roundToPrecision(_ value: Double) -> Double {
            let factor = pow(10.0, Double(precision))
            return (value * factor).rounded() / factor
        }
    }
}

/// A wrapper view for preview that manages the @State property and prints the value when the seeker is dropped
private struct SliderPreviewWrapper: View {
    @State private var sliderValue = 15.0

    var body: some View {
        Warp.Slider(value: $sliderValue, range: 0...100, step: 0.5, precision: 2, onEditingChanged: { newValue in
            print("Slider dropped at value: \(newValue)")
        })
        .padding()
    }
}

#Preview {
    SliderPreviewWrapper()
}
