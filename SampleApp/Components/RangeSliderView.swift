import SwiftUI
import Warp

struct RangeSliderView: View {
  @State var range: ClosedRange<Double> = 1.0...20.0
  @State var bounds: ClosedRange<Double> = 1.0...20.0
  @State var items = stride(from: 1910, through: 2020, by: 10).map {
    "\($0)"
  }
  @State var minValue = "1.0" // Minimum value input by user
  @State var maxValue = "20.0" // Maximum value input by user
  @State var stepValue = "1.0" // Step value input by user
  @State var precision = "1" // Precision for displayed slider value

  @State var wideDoubleRange: ClosedRange<Double> = Double.leastNormalMagnitude...Double.greatestFiniteMagnitude
  @State var wideDoubleBounds: ClosedRange<Double> = Double.leastNormalMagnitude...Double.greatestFiniteMagnitude

  var body: some View {
    ScrollView(showsIndicators: false) {

      // Very wide double range slider
      GroupBox(content: {
        VStack {
          Text("From: \(humanReadableNumber(wideDoubleRange.lowerBound)) to \(humanReadableNumber(wideDoubleRange.upperBound))")
          // Warp Slider that dynamically updates based on user input
          Warp.RangeSlider(
                range: $wideDoubleRange,
                bounds: wideDoubleBounds,
                step: Double(stepValue) ?? 1.0,
                enabled: true,
                valueFormat: humanReadableNumber
            )
            .padding()
        }
      }, label: {
        Text("RangeSlider with infinite range")
      })
        .padding(.bottom)

      GroupBox(content: {
        VStack {
          Text(String(format: "From: %.\(Int(precision) ?? 2)f to %.\(Int(precision) ?? 2)f", range.lowerBound, range.upperBound))
          // Warp Slider that dynamically updates based on user input
          Warp.RangeSlider(
                range: $range,
                bounds: bounds,
                step: Double(stepValue) ?? 1.0,
                enabled: true
            )
            .padding()
        }
      }, label: {
        Text("RangeSlider with integers")
      })
        .padding(.bottom)

      GroupBox(content: {
        VStack {
          Text("From: \(items.first!) to \(items.last!)")
          // Warp Slider that dynamically updates based on user input
          Warp.RangeSlider(selectedItems: $items,
                items: stride(from: 1910, through: 2020, by: 10).map {
                  "\($0)"
                }
            )
            .padding()
        }
      }, label: {
        Text("RangeSlider with strings")
      })
        .padding(.bottom)

      // Range slider with indicators
      GroupBox(content: {
        VStack {
          Text("From: \(items.first!) to \(items.last!)")
          // Warp Slider that dynamically updates based on user input
          Warp.RangeSlider(selectedItems: $items,
                items: stride(from: 1910, through: 2020, by: 10).map { "\($0)" },
                showRange: true
            )
            .padding()
        }
      }, label: {
        Text("RangeSlider with indicators")
      })
        .padding(.bottom)

      // Disabled Range slider
      GroupBox(content: {
        VStack {
          Text("From: \(items.first!) to \(items.last!)")
          // Warp Slider that dynamically updates based on user input
          Warp.RangeSlider(selectedItems: $items,
                items: stride(from: 1910, through: 2020, by: 10).map { "\($0)" },
                enabled: false
            )
            .padding()
        }
      }, label: {
        Text("Disabled RangeSlider")
      })
        .padding(.bottom)

      GroupBox(content: {
        HStack {
          VStack(alignment: .leading) {
            // Input fields for Min/Max values
            HStack {
              Text("Min Value")
              Warp.TextField(text: $minValue)
                .keyboardType(.decimalPad)
                .frame(width: 70)
              Spacer()
              Text("Max Value")
              Warp.TextField(text: $maxValue)
                .keyboardType(.decimalPad)
                .frame(width: 70)
            }
              .padding(.bottom, 8)

            // Input fields for Precision and Step values
            HStack {
              Text("Precision")
              Warp.TextField(text: $precision)
                .keyboardType(.numberPad)
                .frame(width: 70)
              Spacer()
              Text("Step Value")
              Warp.TextField(text: $stepValue)
                .keyboardType(.decimalPad)
                .frame(width: 70)
            }
              .padding(.bottom, 8)
          }
        }
      }, label: {
        Text("Set Values")
      })
        .padding(.bottom)
    }
      .padding(.horizontal)
      .navigationTitle("RangeSlider")
      .navigationBarTitleDisplayMode(.inline)
      .onTapGesture {
        dismissKeyboard() // Dismiss keyboard when tapping outside
      }
      .onChange(of: minValue) { _ in
        updateBounds() // Update bounds when minValue changes
      }
      .onChange(of: maxValue) { _ in
        updateBounds() // Update bounds when maxValue changes
      }
  }

  // Update function to adjust bounds when min/max values change
  private func updateBounds() {
    if let min = Double(minValue), let max = Double(maxValue), min < max {
      bounds = min...max
      // Ensure the current range is within the new bounds
      if range.lowerBound < min || range.upperBound > max {
        range = min...max
      }
    }
  }

  private func humanReadableNumber(_ value: Double) -> String {
      guard !(value ~= Double.leastNonzeroMagnitude || value ~= Double.greatestFiniteMagnitude) else {
          return "∞"
      }
      return formatter.string(from: NSNumber(value: value)) ?? "0.00e0"
  }

  // Helper function to dismiss the keyboard
  private func dismissKeyboard() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
  }
}

let formatter: NumberFormatter = {
  let formatter = NumberFormatter()
  formatter.numberStyle = .scientific
  formatter.maximumFractionDigits = 2
  formatter.exponentSymbol = "e"
  return formatter
}()

#Preview {
  RangeSliderView()
}
