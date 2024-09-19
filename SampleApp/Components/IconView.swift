import SwiftUI
import Warp

struct IconView: View {
    @State private var selectedIcon: Warp.Icon = .activeAds // Default selected icon
    @State private var selectedSize: Warp.IconSize = .default // Default size
    @State private var selectedColor: Color = Warp.Color.token.icon // Default color
    
    private let icons = Warp.Icon.allCases // Get all icons
    private let sizes = Warp.IconSize.allCases // Get all icon sizes

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
                     Text(size.rawValue.capitalized) // Use the display name from IconSize
                 }
             }
            .pickerStyle(SegmentedPickerStyle()) // Segmented control style
            .padding()
            
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
