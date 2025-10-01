import SwiftUI

extension Warp {
    /// A customizable range slider component to adjust a range of values within a given range.
    ///
    /// The range slider allows for setting the minimum and maximum values with a defined step interval.
    ///
    /// - Parameters:
    ///   - range: A `Binding` to the current range of values (min and max).
    ///   - bounds: The minimum and maximum bounds for the slider, defined as a `ClosedRange<Double>`.
    ///   - step: The increment by which the slider values should change. Defaults to `1.0`.
    ///   - onEditingChanged: A closure that is called when either thumb is released, passing the final range as an argument.
    public struct RangeSlider: View {
        
        public typealias Element = Double // Could be generic, just in case...
        
        // Constants for styling
        private let thumbDiameter: CGFloat = 24 + 16
        private let trackColor = Warp.Token.backgroundDisabledSubtle
        private let filledTrackColor = Warp.Token.backgroundPrimary
        private let thumbColor = Warp.Token.backgroundPrimary
        private let thumbBorderColor = Warp.Token.backgroundDisabled.opacity(0.4)
        private let thumbActiveColor = Warp.Token.backgroundPrimaryActive
        private let textIndicatorColor = Warp.Token.textSubtle
        private let disabledColor = Warp.Token.backgroundDisabled

        @Binding var range: ClosedRange<Element>  // Binding range to update the slider range
        let bounds: ClosedRange<Element>  // Defines the bounds for the slider
        let step: Element  // Step value for the slider
        let showTooltips: Bool  // Whether to show tooltips above thumbs
        let showRange: Bool  // Whether to show min/max range indicators
        let enabled: Bool  // Whether the slider is enabled or disabled
        let valueFormat: ((Element) -> String) // Describe given value

        @State private var mainBodyWidth: CGFloat = 0
        private enum ActiveThumb {
            case lower, upper, none
        }
        @State private var activeThumb: ActiveThumb = .none
        @State private var tooltipWidth: CGFloat = 0
        @State private var leftIndicatorWidth: CGFloat = 0

        public init(
            range: Binding<ClosedRange<Element>>,
            bounds: ClosedRange<Element>,
            step: Element = 1.0,
            showTooltips: Bool = true,
            showRange: Bool = false,
            enabled: Bool = true,
            valueFormat: ((Element) -> String)? = nil
        ) {
            self._range = range
            self.bounds = bounds
            self.step = step
            self.showTooltips = showTooltips
            self.showRange = showRange
            self.enabled = enabled
            self.valueFormat = valueFormat ?? { "\($0)" }
        }
        
        public init<ArrayElement: LosslessStringConvertible & Equatable>(
            selectedItems: Binding<Array<ArrayElement>>,
            items: Array<ArrayElement>,
            showTooltips: Bool = true,
            showRange: Bool = false,
            enabled: Bool = true,
            valueFormat: ((ArrayElement) -> String)? = nil
        ) {
            let closedRangeBinding = Binding<ClosedRange<Double>>(
              get: {
                  let values = selectedItems.wrappedValue
                  // For instance, map first two elements to a ClosedRange safely
                  guard let first = values.first else { return 0...0 }
                  guard let last = values.last else {
                      let index = items.firstIndex(of: first) ?? 0
                      return Double(index)...Double(index)
                  }
                  // Return the range based on the indices of the selected items in the original array
                  let lowerIndex = items.firstIndex(of: first) ?? 0
                  let upperIndex = items.firstIndex(of: last) ?? 0
                  return Double(lowerIndex)...Double(upperIndex)
              },
              set: { newRange in
                  // Update the array elements based on the new range
                  let slice = items[Int(newRange.lowerBound)...Int(newRange.upperBound)]
                  selectedItems.wrappedValue = Array(slice)
              }
            )
            self._range = closedRangeBinding
            self.bounds = Double(items.indices.startIndex)...Double(items.indices.endIndex - 1)
            self.step = 1.0
            self.showTooltips = showTooltips
            self.showRange = showRange
            self.enabled = enabled
            self.valueFormat = { index in
                let intIndex = Int(index.rounded())
                let element = items[intIndex]
                if let valueFormat {
                    return valueFormat(element)
                } else {
                    return String(describing: element)
                }
            }
        }

        public var body: some View {
            mainBody
              .measureWidth($mainBodyWidth)
              .allowsHitTesting(enabled)
        }

        private var mainBody : some View {
            ZStack(alignment: .leading) {
                trackView  // Gray background track
                    .frame(height: 4)
                    .padding([.leading, .trailing], showRange ? -8 : 0)

                filledTrackView(width: mainBodyWidth)  // Filled track
                    .frame(height: 6)

                if showRange {
                    // Left indicator
                    textIndicator(text: valueFormat(bounds.lowerBound))
                    .measureWidth($leftIndicatorWidth)
                    .offset(x: -(leftIndicatorWidth / 2), y: 18)

                    // Right indicator
                    textIndicator(text: valueFormat(bounds.upperBound))
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .offset(x: (thumbDiameter / 2) - 2, y: 18)
                }

                // Lower thumb
                thumbView(active: .lower, value: range.lowerBound)

                // Upper thumb
                thumbView(active: .upper, value: range.upperBound)

                if showTooltips {
                    // Tooltip above the active thumb
                    tooltipView(totalWidth: mainBodyWidth)
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
            let lowerProgress = progress(for: range.lowerBound)
            let upperProgress = progress(for: range.upperBound)
            return Capsule()
                .fill(enabled ? filledTrackColor : disabledColor)
                .frame(width: CGFloat(upperProgress - lowerProgress) * width)
                .offset(x: CGFloat(lowerProgress) * width)
        }

        // Square thumb (slider handle)
        private func thumbView(active: ActiveThumb, value: Element) -> some View {
            ZStack {
                Circle()
                    .fill(activeThumb == active ? thumbBorderColor : .clear)
                    .frame(width: thumbDiameter, height: thumbDiameter)
                Circle()
                    .fill(
                        {
                            guard enabled else { return disabledColor }
                            return activeThumb == active ? thumbActiveColor : thumbColor
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
                      value: value
                  ) - (thumbDiameter / 2)
              )
              .gesture(
                  DragGesture(minimumDistance: 0)
                    .onChanged { dragValue in
                        updateValue(
                            dragValue: dragValue,
                            width: mainBodyWidth,
                            isLowerThumb: active != .upper
                        )
                        activeThumb = active
                    }
                    .onEnded { _ in
                        activeThumb = .none
                    }
              )
        }

        /// Warp Tooltip view above the thumb
        private func tooltipView(totalWidth: CGFloat) -> some View {
            Warp.Tooltip(
                title: valueFormat(
                    {
                        switch activeThumb {
                        case .lower, .none:
                            return range.lowerBound
                        case .upper:
                            return range.upperBound
                        }
                    }()
                ),
                arrowEdge: .bottom
            )
            .frame(height: 24)
            .measureWidth($tooltipWidth)
            .offset(
                x: thumbOffset(
                    width: totalWidth,
                    value: {
                        switch activeThumb {
                        case .lower, .none:
                            return range.lowerBound
                        case .upper:
                            return range.upperBound
                        }
                    }()
                ) - tooltipWidth / 2,
                y: -thumbDiameter
            )
            .opacity(activeThumb == .none ? 0 : 1)
        }

        /// Text indicator view for lower and upper bounds
        private func textIndicator(text: String) -> some View {
            VStack(spacing: 0) {
                Capsule()
                    .fill(trackColor)
                    .padding(.top, 8)
                    .frame(width: 4, height: 16)

                Text(text, style: .caption, color: enabled ? textIndicatorColor : disabledColor)
            }
        }

        /// Calculates thumb offset based on current value
        private func thumbOffset(width: CGFloat, value: Element) -> CGFloat {
            let progress = progress(for: value)
            return CGFloat(progress) * width
        }

        /// Calculates the progress of a value within the bounds [0, 1]
        private func progress(for value: Element) -> Double {
            let rangeSpan = bounds.upperBound - bounds.lowerBound
            if rangeSpan == 0 {
                return 0
            } else {
                let progress = (value - bounds.lowerBound) / rangeSpan
                return Double(min(max(progress, 0), 1))
            }
        }

        /// Updates the slider range based on thumb drag
        private func updateValue(
            dragValue: DragGesture.Value,
            width: CGFloat,
            isLowerThumb: Bool
        ) {
            let dragPercentage = min(max(0, dragValue.location.x / width), 1)  // Clamp between 0 and 1

            let rangeSpan = bounds.upperBound - bounds.lowerBound
            let rawValue =
                bounds.lowerBound + Element(dragPercentage) * rangeSpan

            // Snap rawValue to the nearest step
            let closestStepValue = (rawValue / step).rounded() * step
            let clampedStepValue = min(max(closestStepValue, bounds.lowerBound), bounds.upperBound)

            if isLowerThumb {
                range = ClosedRange(
                    uncheckedBounds: (
                        lower: min(clampedStepValue, range.upperBound),
                        upper: range.upperBound
                    )
                )
            } else {
                range = ClosedRange(
                    uncheckedBounds: (
                        lower: range.lowerBound,
                        upper: max(clampedStepValue, range.lowerBound)
                    )
                )
            }
        }
    }
}

extension View {
    // Helper method to dynamically save actual component width
    fileprivate func measureWidth(_ width: Binding<CGFloat>) -> some View {
        background(
            GeometryReader { geometry in
                Color.clear
                    .onAppear {
                        width.wrappedValue = geometry.size.width
                    }
                    .onChange(of: geometry.size.width) { newWidth in
                        width.wrappedValue = newWidth
                    }
            }
        )
    }
}

/// A wrapper view for preview that manages the @State property and prints the value when the seeker is dropped
private struct RangeSliderPreviewWrapper: View {
    @State private var sliderRange = 30.0...100.0

    var body: some View {
        Warp.RangeSlider(
            range: $sliderRange,
            bounds: -0...100,
            showRange: true
        )
        .padding()
    }
}

#Preview {
    RangeSliderPreviewWrapper()
}
