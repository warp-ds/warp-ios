import SwiftUI
import Warp

struct RangeSliderView: View {
    @State var range = 20.0...80.0
    @State var minValue = "0.0"
    @State var maxValue = "100.0"
    @State var stepValue = "1.0"
    @State var precision = "2"
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            GroupBox(content: {
                VStack {
                    // Warp RangeSlider
                    Warp.RangeSlider(
                        range: $range,
                        fullRange: (Double(minValue) ?? 0.0)...(Double(maxValue) ?? 100.0),
                        step: Double(stepValue) ?? 1.0
                    )
                    .padding()
                    
                    HStack {
                        Spacer()
                        Text("Range: \(String(format: "%.\(precision)f", range.lowerBound)) - \(String(format: "%.\(precision)f", range.upperBound))")
                        Spacer()
                    }
                }
            }, label: {
                Text("Range Slider")
            })
            .padding(.bottom)
            
            GroupBox(content: {
                VStack(alignment: .leading) {
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
            }, label: {
                Text("Set Values")
            })
            .padding(.bottom)
        }
        .padding(.horizontal)
        .navigationTitle("Range Slider")
        .navigationBarTitleDisplayMode(.inline)
        .onTapGesture {
            dismissKeyboard()
        }
    }
    
    private func dismissKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

#Preview {
    RangeSliderView()
}
