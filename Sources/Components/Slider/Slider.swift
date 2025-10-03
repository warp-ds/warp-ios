import SwiftUI

extension Warp {
    /// A customizable slider component to adjust value within a given range.
    ///
    /// The slider allows for setting the value with a defined step interval or selecting from a list of discrete items.
    ///
    /// **Usage:**
    /// *** Single Value Slider with Step Interval***
    /// ```swift
    /// @State private var sliderValue = 50.0
    /// Warp.Slider(value: $sliderValue, range: 0...100, step: 1.0)
    /// ```
    /// *** Single Value Slider with Discrete Items***
    /// ```swift
    /// @State private var selectedItem = "Medium"
    /// let items = ["Small", "Medium", "Large"]
    /// Warp.Slider(selectedItem: $selectedItem, items: items)
    /// ```
    /// - Note: The slider supports both continuous values with a specified step and discrete selections from an array of items.
    public struct Slider: View {
        // Constants for styling
        private let thumbDiameter: CGFloat = 24 + 16 // 16 for the active border
        private let cornerRadius = Warp.Border.borderRadius50
        private let trackColor = Warp.Token.backgroundDisabledSubtle
        private let filledTrackColor = Warp.Token.backgroundPrimary
        private let thumbColor = Warp.Token.backgroundPrimary
        private let thumbBorderColor = Warp.Token.backgroundDisabled.opacity(0.4)
        private let thumbActiveColor = Warp.Token.backgroundPrimaryActive
        private let textIndicatorColor = Warp.Token.textSubtle
        private let disabledColor = Warp.Token.backgroundDisabled

        @Binding var value: Double // Binding value to update the slider value
        let range: ClosedRange<Double> // Defines the range for the slider
        let step: Double // Step value for the slider
        let showTooltips: Bool  // Whether to show tooltips above thumbs
        let showRange: Bool  // Whether to show min/max range indicators
        let enabled: Bool  // Whether the slider is enabled or disabled
        let valueFormatter: ((Double) -> String) // Describe given value
        let onEditingChanged: ((Double) -> Void)? // Completion handler to return the value when handle is dropped

        @State private var mainBodyWidth: CGFloat = 0
        @State private var isActive: Bool = false
        @State private var tooltipWidth: CGFloat = 0
        @State private var leftIndicatorWidth: CGFloat = 0

        /// A customizable slider component to adjust values within a given range.
        ///
        /// - Parameters:
        ///   - value: A `Binding` value representing the current slider value.
        ///   - range: The minimum and maximum values for the slider, defined as a `ClosedRange<Double>`.
        ///   - step: The increment by which the slider value should change. Defaults to `1.0`.
        ///   - showTooltips: A Boolean value that determines whether to show tooltips above the thumbs. Defaults to `true`.
        ///   - showRange: A Boolean value that determines whether to show min/max range indicators. Defaults to `false`.
        ///   - enabled: A Boolean value that determines whether the slider is enabled or disabled. Defaults to `true`.
        ///   - valueFormatter: A closure that formats the displayed value. Defaults to a simple string conversion.
        ///   - onEditingChanged: A closure that is called when the slider's thumb is released, passing the final value as an argument. Defaults to `nil`.
        ///
        /// - Warning: The initial value must be within the specified range. If it's outside the range, it will be clamped to the nearest boundary.
        public init(
            value: Binding<Double>,
            range: ClosedRange<Double>,
            step: Double = 1.0,
            showTooltips: Bool = true,
            showRange: Bool = false,
            enabled: Bool = true,
            valueFormatter: ((Double) -> String)? = nil,
            onEditingChanged: ((Double) -> Void)? = nil
        ) {
            self._value = value
            self.range = range
            self.step = step
            self.showTooltips = showTooltips
            self.showRange = showRange
            self.enabled = enabled
            self.valueFormatter = valueFormatter ?? { "\($0)" }
            self.onEditingChanged = onEditingChanged
        }

        /// A customizable slider component to select from a list of discrete items.
        ///
        /// - Parameters:
        ///   - selectedItem: A `Binding` to the currently selected item from the list.
        ///   - items: An array of items to choose from. The items must conform to `LosslessStringConvertible` and `Equatable`.
        ///   - showTooltips: A Boolean value that determines whether to show tooltips above the thumbs. Defaults to `true`.
        ///   - showRange: A Boolean value that determines whether to show min/max range indicators. Defaults to `false`.
        ///   - enabled: A Boolean value that determines whether the slider is enabled or disabled. Defaults to `true`.
        ///   - valueFormat: A closure that formats the displayed value. Defaults to a simple string conversion.
        ///
        /// - Note: The `Array.Element` type must conform to `LosslessStringConvertible` and `Equatable` to ensure proper conversion and comparison.
        /// - Warning: The initial selected item must be present in the `items` array. If it's not found, the slider will default to the first item in the list.
        public init<ArrayElement: LosslessStringConvertible & Equatable>(
            selectedItem: Binding<ArrayElement>,
            items: Array<ArrayElement>,
            showTooltips: Bool = true,
            showRange: Bool = false,
            enabled: Bool = true,
            valueFormat: ((ArrayElement) -> String)? = nil
        ) {
            let valueBinding = Binding<Double>(
                get: {
                    // Map the single selected item to a double index
                    guard let selectedItemIndex = items.firstIndex(of: selectedItem.wrappedValue) else {
                        return 0
                    }
                    return Double(selectedItemIndex)
                },
                set: { newIndex in
                    // Update the selected item based on the new index
                    let index = Int(newIndex)
                    selectedItem.wrappedValue = items[index]
                }
            )
            self._value = valueBinding
            self.range = Double(items.indices.startIndex)...Double(items.indices.endIndex - 1)
            self.step = 1.0
            self.showTooltips = showTooltips
            self.showRange = showRange
            self.enabled = enabled
            self.valueFormatter = { index in
                let intIndex = Int(index.rounded())
                let element = items[intIndex]
                if let valueFormat {
                    return valueFormat(element)
                } else {
                    return String(describing: element)
                }
            }
            self.onEditingChanged = nil
        }

        public var body: some View {
            mainBody
              .measureWidth($mainBodyWidth)
              .allowsHitTesting(enabled)
        }

        private var mainBody: some View {
            ZStack(alignment: .leading) {
                trackView // Gray background track
                    .frame(height: 4)
                    .padding([.leading, .trailing], showRange ? -8 : 0)

                filledTrackView(width: mainBodyWidth) // Filled track
                    .frame(height: 6)
                    .padding([.leading, .trailing], showRange ? -8 : 0)

                if showRange {
                    // Left indicator
                    textIndicator(text: valueFormatter(range.lowerBound))
                      .measureWidth($leftIndicatorWidth)
                      .offset(x: -(leftIndicatorWidth / 2), y: 18)

                    // Right indicator
                    textIndicator(text: valueFormatter(range.upperBound))
                      .frame(maxWidth: .infinity, alignment: .trailing)
                      .offset(x: (thumbDiameter / 2) - 2, y: 18)
                }

                thumbView(value: value) // Draggable thumb

                if showTooltips {
                    // Tooltip above the active thumb
                    tooltipView(totalWidth: mainBodyWidth)
                }
            }
        }

        /// Background track (gray line for incomplete part)
        private var trackView: some View {
            Capsule()
                .fill(trackColor)
        }

        /// Filled track (colorful line for filled part)
        private func filledTrackView(width: CGFloat) -> some View {
            let progress = progress()
            return Capsule()
                .fill(enabled ? filledTrackColor : disabledColor)
                .frame(width: CGFloat(progress) * width)
        }

        /// Square thumb (slider handle)
        private func thumbView(value: Double) -> some View {
            ZStack {
                Circle()
                  .fill(isActive ? thumbBorderColor : .clear)
                  .frame(width: thumbDiameter, height: thumbDiameter)
                Circle()
                  .fill(
                      {
                          guard enabled else { return disabledColor }
                          return isActive ? thumbActiveColor : thumbColor
                      }()
                  )
                  .frame(
                      width: thumbDiameter - 16,
                      height: thumbDiameter - 16
                  )
            }
              .offset(
                  x: thumbOffset(
                      width: mainBodyWidth,
                  ) - (thumbDiameter / 2)
              )
              .gesture(
                  DragGesture(minimumDistance: 0)
                    .onChanged { dragValue in
                        updateValue(
                            dragValue: dragValue,
                            width: mainBodyWidth
                        )
                        if !isActive {
                            isActive = true
                        }
                    }
                    .onEnded { _ in
                        onEditingChanged?(value)
                        isActive = false
                    }
              )
        }

        /// Text indicator view for lower and upper bounds
        private func textIndicator(text: String) -> some View {
            VStack(spacing: 0) {
                Capsule()
                  .fill(SwiftUI.Color.clear)
                  .padding(.top, 8)
                  .frame(width: 4, height: 16)

                Text(text, style: .caption, color: enabled ? textIndicatorColor : disabledColor)
            }
        }

        /// Warp Tooltip view above the thumb
        private func tooltipView(totalWidth: CGFloat) -> some View {
            Warp.Tooltip(
                  title: valueFormatter(value),
                  arrowEdge: .bottom
              )
              .frame(height: 24)
              .measureWidth($tooltipWidth)
              .offset(
                  x: thumbOffset(
                      width: totalWidth,
                  ) - tooltipWidth / 2,
                  y: -thumbDiameter
              )
              .opacity(isActive ? 1 : 0)
        }

        // Calculates thumb offset based on current value
        private func thumbOffset(width: CGFloat) -> CGFloat {
            let progress = progress()
            return CGFloat(progress) * width
        }

        /// Calculates the progress of the slider within the range [0, 1]
        private func progress() -> Double {
            let rangeSpan = range.upperBound - range.lowerBound
            if rangeSpan == 0 {
                return 0
            } else {
                let progress = (value - range.lowerBound) / rangeSpan
                return min(max(progress, 0), 1)
            }
        }

        /// Updates the slider value based on thumb drag
        private func updateValue(dragValue: DragGesture.Value, width: CGFloat) {
            let dragPercentage = min(max(0, dragValue.location.x / width), 1) // Clamp between 0 and 1

            let rangeSpan = range.upperBound - range.lowerBound
            let rawValue = range.lowerBound + dragPercentage * rangeSpan

            // Snap rawValue to the nearest step
            // Snap rawValue to the nearest step
            let closestStepValue = (rawValue / step).rounded() * step
            let clampedStepValue = min(max(closestStepValue, range.lowerBound), range.upperBound)
            value = clampedStepValue
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
