import SwiftUI
import Warp

struct IconView: View {
    @State private var selectedIcon: Warp.Icon = .activeAds // Default selected icon
    @State private var selectedSize: Warp.IconSize = .default // Default size
    @State private var customSize: String = "150" // Default custom size as a string
    @State private var selectedColor: Color = Warp.Color.token.icon // Default color
    
    private let icons = Warp.Icon.allCases // Get all icons
    private let sizes = Warp.IconSize.allCases + [.custom(150)] // Add custom size option

    var body: some View {
        VStack(spacing: 20) {
            // Picker to choose an icon
            Picker("Select an icon", selection: $selectedIcon) {
                ForEach(icons, id: \.self) { icon in
                    Text(icon.rawValue) // Display icon names in picker
                }
            }
            .pickerStyle(WheelPickerStyle()) // Wheel picker style for better UX
            .padding()
            
            // Segmented control to select icon size
            Picker("Select size", selection: $selectedSize) {
                ForEach(sizes, id: \.self) { size in
                    Text(size.displayName) // Display name based on size type
                }
            }
            .pickerStyle(SegmentedPickerStyle()) // Segmented control style
            .padding()
            
            // If a custom size is selected, show a text field to input the custom size
            if case .custom = selectedSize {
                HStack {
                    Text("Custom Size:")
                        .padding(.trailing)
                    Warp.TextField(placeholder: "Enter size", text: $customSize)
                        .keyboardType(.numberPad)
                        .frame(height: 48)
                        .onChange(of: customSize) { newValue in
                            if let size = Int(newValue) {
                                selectedSize = .custom(CGFloat(size))
                            }
                        }
                }
                .padding()
            }
            
            // Color picker to choose icon color
            ColorPicker("Select icon color", selection: $selectedColor)
                .padding()
            
            // Display the selected icon with the selected size and color
            Warp.IconView(selectedIcon, size: selectedSize)
                .foregroundColor(selectedColor) // Apply selected color to icon
            Spacer()
        }
        .navigationTitle("Icon View")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct IconViewSample_Previews: PreviewProvider {
    static var previews: some View {
        IconView()
    }
}
