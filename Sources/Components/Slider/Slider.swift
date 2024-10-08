import SwiftUI

extension Warp {
    /// A customizable slider component to adjust values within a given range.
    ///
    /// The slider allows for setting the value with a defined step interval.
    ///
    /// - Parameters:
    ///   - value: A `Binding` value representing the current slider value.
    ///   - range: The minimum and maximum values for the slider, defined as a `ClosedRange<Double>`.
    ///   - step: The increment by which the slider value should change. Defaults to `1.0`.
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
        let onEditingChanged: ((Double) -> Void)? // Completion handler to return the value when handle is dropped

        public init(value: Binding<Double>, range: ClosedRange<Double>, step: Double = 1.0, onEditingChanged: ((Double) -> Void)? = nil) {
            self._value = value
            self.range = range
            self.step = step
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
            let progress = progress()
            return Capsule()
                .fill(filledTrackColor)
                .frame(width: CGFloat(progress) * width)
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
            let progress = progress()
            return CGFloat(progress) * width
        }

        // Generates steps including min and max values
        private func generateSteps() -> [Double] {
            var steps = [range.lowerBound]
            var currentStep = range.lowerBound + step
            while currentStep < range.upperBound {
                steps.append(currentStep)
                currentStep += step
            }
            if steps.last! != range.upperBound {
                steps.append(range.upperBound)
            }
            return steps
        }

        // Calculates the progress of the slider within the range [0, 1]
        private func progress() -> Double {
            let steps = generateSteps()
            if let index = steps.firstIndex(where: { $0 >= value }) {
                return Double(index) / Double(steps.count - 1)
            }
            return 0
        }

        // Updates slider value based on thumb drag
        private func updateValue(dragValue: DragGesture.Value, width: CGFloat) {
            let dragPercentage = min(max(0, dragValue.location.x / width), 1) // Clamp between 0 and 1

            let steps = generateSteps()
            let totalSteps = steps.count - 1
            let position = dragPercentage * Double(totalSteps)
            let stepIndex = min(max(0, Int(position)), totalSteps)
            let newValue = steps[stepIndex]
            value = newValue
        }
    }
}

/// A wrapper view for preview that manages the @State property and prints the value when the seeker is dropped
private struct SliderPreviewWrapper: View {
    @State private var sliderValue = 15.0

    var body: some View {
        Warp.Slider(value: $sliderValue, range: 0...100, step: 0.5, onEditingChanged: { newValue in
            print("Slider dropped at value: \(newValue)")
        })
        .padding()
    }
}

#Preview {
    SliderPreviewWrapper()
}
