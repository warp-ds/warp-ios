import SwiftUI

extension Warp {
    /// Slider component to adjust values within a given range.
#if swift(<6.0)
    @preconcurrency @MainActor
#endif
    public struct Slider: View {
        /// Constants to create the view
        private let cornerRadius: CGFloat = 4
        private let trackColor = Warp.Color.sliderTrackBackground // Custom color for the track
        private let filledTrackColor = Warp.Color.sliderTrackBackgroundActive // Custom color for the filled track
        private let thumbColor = Warp.Color.sliderHandleBackground // Custom color for the thumb
        
        @Binding var value: Double // Binding value to update the slider value
        let range: ClosedRange<Double> // Defines the range for the slider
        let step: Double // Step value for the slider
        let precision: Int // Number of decimal places for rounding the value
        let onEditingChanged: ((Double) -> Void)? // Completion handler to return the value when handle is dropped
        
        public init(value: Binding<Double>, range: ClosedRange<Double> = 0...1, step: Double = 1.0, precision: Int = 2, trackColor: Color = .gray, filledTrackColor: Color = .blue, thumbColor: Color = .blue, onEditingChanged: ((Double) -> Void)? = nil) {
            self._value = value
            self.range = range
            self.step = step
            self.precision = precision
            self.onEditingChanged = onEditingChanged
        }
        
        public var body: some View {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    // Track view (gray line for the unfilled part)
                    trackView
                        .frame(height: 4)
                    
                    // Filled track view (colorful line for the filled part)
                    filledTrackView(width: geometry.size.width)
                        .frame(height: 6)
                    
                    // Square Thumb (slider handle)
                    thumbView(width: geometry.size.width)
                        .frame(width: 24, height: 24) // Square thumb
                        .offset(x: thumbOffset(width: geometry.size.width) - 10) // Offset to center the square thumb
                        .gesture(
                            DragGesture()
                                .onChanged { dragValue in
                                    updateValue(dragValue: dragValue, width: geometry.size.width)
                                }
                                .onEnded { _ in
                                    onEditingChanged?(value) // Call the completion with the final value
                                }
                        )
                }
            }
        }
        
        // Track view (background - colourless line for incomplete path)
        private var trackView: some View {
            Capsule()
                .fill(trackColor) // color for the unfilled track
        }
        
        // Filled track view (colorful line for filled part)
        private func filledTrackView(width: CGFloat) -> some View {
            Capsule()
                .fill(filledTrackColor)
                .frame(width: CGFloat((value - range.lowerBound) / (range.upperBound - range.lowerBound)) * width)
        }
        
        // Square Thumb view (slider handle)
        private func thumbView(width: CGFloat) -> some View {
            Rectangle()
                .fill(thumbColor)
                .cornerRadius(cornerRadius)
                .addShadow(.small)
        }
        
        // Offset calculation for thumb based on current value
        private func thumbOffset(width: CGFloat) -> CGFloat {
            return CGFloat((value - range.lowerBound) / (range.upperBound - range.lowerBound)) * width
        }
        
        // Updates value as thumb is dragged
        private func updateValue(dragValue: DragGesture.Value, width: CGFloat) {
            let dragPercentage = min(max(0, dragValue.location.x / width), 1)
            let newValue = range.lowerBound + dragPercentage * (range.upperBound - range.lowerBound)
            let steppedValue = (newValue / step).rounded() * step
            value = roundToPrecision(steppedValue)
        }
        
        // Rounds the value to the specified number of decimal places
        private func roundToPrecision(_ value: Double) -> Double {
            let factor = pow(10.0, Double(precision))
            return (value * factor).rounded() / factor
        }
    }
}

/// A wrapper view for preview that manages the @State property and prints the value when the seeker is dropped
private struct SliderPreviewWrapper: View {
    @State private var sliderValue = 15.0 // State management for the slider

    var body: some View {
        Warp.Slider(value: $sliderValue, range: 0...100, step: 0.5, precision: 2, onEditingChanged: { newValue in
            print("Slider dropped at value: \(newValue)") // Example of handling the final value
        })
        .padding()
    }
}

#Preview {
    SliderPreviewWrapper() // Using the wrapper view in preview
}
