import SwiftUI
import Warp

struct RangeSliderView: View {
  @State var range: ClosedRange<Double> = 0.0...100.0
  @State var bounds: ClosedRange<Double> = 0.0...100.0
  @State var sliderValue = 0.0 // Current slider value
  @State var minValue = "0.0" // Minimum value input by user
  @State var maxValue = "100.0" // Maximum value input by user
  @State var stepValue = "1.0" // Step value input by user
  @State var precision = "2" // Precision for displayed slider value

  var body: some View {
    ScrollView(showsIndicators: false) {
      GroupBox(content: {
        VStack {
          // Warp Slider that dynamically updates based on user input
          Warp.RangeSlider(
            range: $range,
            bounds: bounds,
            step: Double(stepValue) ?? 1.0
          )
          .padding()

          HStack {
            Spacer()
            // Display the slider value with the specified precision
            Text(String(format: "Value: %.\(Int(precision) ?? 2)f - %.\(Int(precision) ?? 2)f", range.lowerBound, range.upperBound))
              .font(.headline)
            Spacer()
          }
        }
      }, label: {
        Text("RangeSlider")
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

  // Helper function to dismiss the keyboard
  private func dismissKeyboard() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
  }
}

#Preview {
  RangeSliderView()
}
