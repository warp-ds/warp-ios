import SwiftUI

extension Warp {
    /// Slider component to adjust values within a given range.
#if swift(<6.0)
    @preconcurrency @MainActor
#endif
    public struct Slider: View {
        /// Constants to create the view
        private let cornerRadius: CGFloat = 4
        private let trackColor = Warp.Color.sliderTrackBackground// Custom color for the track
        private let filledTrackColor = Warp.Color.sliderTrackBackgroundActive // Custom color for the filled track
        private let thumbColor = Warp.Color.sliderHandleBackground // Custom color for the thumb
        
        @Binding var value: Double // Binding value to update the slider value
        let range: ClosedRange<Double> // Defines the range for the slider
  
        let onEditingChanged: ((Double) -> Void)? // Completion handler to return the value when handle is dropped
        
        public init(value: Binding<Double>, range: ClosedRange<Double> = 0...1, trackColor: Color = .gray, filledTrackColor: Color = .blue, thumbColor: Color = .blue, onEditingChanged: ((Double) -> Void)? = nil) {
            self._value = value
            self.range = range
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
            value = newValue
        }
    }
}
