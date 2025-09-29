import SwiftUI

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

  public struct RangeSlider<Element: BinaryFloatingPoint>: View {
    // Constants for styling
    private let cornerRadius = Warp.Border.borderRadius50
    private let trackColor = Warp.Token.backgroundDisabledSubtle
    private let filledTrackColor = Warp.Token.backgroundPrimary
    private let thumbColor = Warp.Token.backgroundPrimary
    private let thumbActiveColor = Warp.Token.backgroundPrimaryActive

    @State private var isActive: Bool = false
    @Binding var range: ClosedRange<Element> // Binding range to update the slider range
    let bounds: ClosedRange<Element> // Defines the bounds for the slider
    let step: Element // Step value for the slider
    let onEditingChanged: ((ClosedRange<Element>) -> Void)? // Completion handler to return the range when thumbs are dropped

    public init(
      range: Binding<ClosedRange<Element>>,
      bounds: ClosedRange<Element>,
      step: Element = 1.0,
      onEditingChanged: ((ClosedRange<Element>) -> Void)? = nil
    ) {
      self._range = range
      self.bounds = bounds
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

          // Lower thumb
          thumbView(width: geometry.size.width)
            .frame(width: 24, height: 24)
            .offset(x: thumbOffset(width: geometry.size.width, value: range.lowerBound) - 12)
            .gesture(
              DragGesture(minimumDistance: 0)
                .onChanged { dragValue in
                  updateValue(dragValue: dragValue, width: geometry.size.width, isLowerThumb: true)
                  if !isActive {
                    isActive = true
                  }
                }
                .onEnded { _ in
                  onEditingChanged?(range)
                  isActive = false
                }
            )

          // Upper thumb
          thumbView(width: geometry.size.width)
            .frame(width: 24, height: 24)
            .offset(x: thumbOffset(width: geometry.size.width, value: range.upperBound) - 12)
            .gesture(
              DragGesture(minimumDistance: 0)
                .onChanged { dragValue in
                  updateValue(dragValue: dragValue, width: geometry.size.width, isLowerThumb: false)
                  if !isActive {
                    isActive = true
                  }
                }
                .onEnded { _ in
                  onEditingChanged?(range)
                  isActive = false
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
      let lowerProgress = progress(for: range.lowerBound)
      let upperProgress = progress(for: range.upperBound)
      return Capsule()
        .fill(filledTrackColor)
        .frame(width: CGFloat(upperProgress - lowerProgress) * width)
        .offset(x: CGFloat(lowerProgress) * width)
    }

    // Square thumb (slider handle)
    private func thumbView(width: CGFloat) -> some View {
      Rectangle()
        .fill(isActive ? thumbActiveColor : thumbColor)
        .cornerRadius(cornerRadius)
        .addShadow(.small)
    }

    // Calculates thumb offset based on current value
    private func thumbOffset(width: CGFloat, value: Element) -> CGFloat {
      let progress = progress(for: value)
      return CGFloat(progress) * width
    }

    // Generates steps including min and max values
    private func generateSteps() -> [Element] {
      var steps = [bounds.lowerBound]
      var currentStep = bounds.lowerBound + step
      while currentStep < bounds.upperBound {
        steps.append(currentStep)
        currentStep += step
      }
      if steps.last! != bounds.upperBound {
        steps.append(bounds.upperBound)
      }
      return steps
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
    private func updateValue(dragValue: DragGesture.Value, width: CGFloat, isLowerThumb: Bool) {
      let dragPercentage = min(max(0, dragValue.location.x / width), 1) // Clamp between 0 and 1

      let rangeSpan = bounds.upperBound - bounds.lowerBound
      let rawValue = bounds.lowerBound + Element(dragPercentage) * rangeSpan

      // Snap rawValue to the nearest step
      let steps = generateSteps()
      let closestStepValue = steps.min(by: { abs($0 - rawValue) < abs($1 - rawValue) }) ?? bounds.lowerBound

      if isLowerThumb {
        range = ClosedRange(uncheckedBounds: (lower: min(closestStepValue, range.upperBound), upper: range.upperBound))
      } else {
        range = ClosedRange(uncheckedBounds: (lower: range.lowerBound, upper: max(closestStepValue, range.lowerBound)))
      }
    }
  }
}

/// A wrapper view for preview that manages the @State property and prints the range when the thumbs are dropped
//private struct RangeSliderPreviewWrapper: View {
//  @State private var sliderRange: ClosedRange<Double> = 20...80
//
//  var body: some View {
//    Warp.RangeSlider(range: $sliderRange, bounds: 0...100, step: 1.0, onEditingChanged: { newRange in
//        print("Range updated to: \(newRange)")
//      })
//      .padding()
//  }
//}
//
//#Preview {
//  RangeSliderPreviewWrapper()
//}
