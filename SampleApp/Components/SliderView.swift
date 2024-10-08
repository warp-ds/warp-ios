import SwiftUI
import Warp

struct SliderView: View {
    @State var sliderValue = 0.0 // Current slider value
    @State var minValue = "0.0" // Minimum value input by user
    @State var maxValue = "100.0" // Maximum value input by user
    @State var precision = "2" // Precision input by user
    @State var stepValue = "1.0" // Step value input by user
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            GroupBox(
                content: {
                    VStack {
                        // Warp Slider that dynamically updates based on user input
                        Warp.Slider(
                            value: $sliderValue,
                            range: (Double(minValue) ?? 0.0)...(Double(maxValue) ?? 100.0),
                            step: Double(stepValue) ?? 1.0,
                            precision: Int(precision) ?? 2
                        )
                        .padding()

                        HStack {
                            Spacer()
                            Text("Slider value: \(String(format: "%.\(precision)f", sliderValue))")
                            Spacer()
                        }
                    }
                },
                label: {
                    Text("Slider")
                }
            )
            .padding(.bottom)

            GroupBox(
                content: {
                    HStack {
                        VStack(alignment: .leading) {
                            // TextField for Min/Max Value
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
                            
                            // TextField for Precision/Step
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
                },
                label: {
                    Text("Set Values")
                }
            )
            .padding(.bottom)
        }
        .padding(.horizontal)
        .navigationTitle("Slider")
        .navigationBarTitleDisplayMode(.inline)
        .onTapGesture {
            dismissKeyboard() // Dismiss the keyboard when tapping anywhere outside
        }
    }
    
    // Helper function to dismiss the keyboard
     private func dismissKeyboard() {
         UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
     }
}

#Preview {
    SliderView()
}
