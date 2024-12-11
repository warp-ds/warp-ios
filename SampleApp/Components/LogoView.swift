import SwiftUI
import Warp

struct LogoView: View {
    @State private var selectedLogo: Warp.BrandLogo = .bilbasen(.default) // Default selected logo

    private let logos = Warp.BrandLogo.allCases // Get all logos

    var body: some View {
        VStack(spacing: 20) {
            // Picker to choose an logo
            Picker("Select a logo", selection: $selectedLogo) {
                ForEach(logos, id: \.self) { logo in
                    Text(logo.assetName) // Display logo names in picker
                }
            }
            .pickerStyle(WheelPickerStyle()) // Wheel picker style for better UX
            .padding()

            // Display the selected logo
            Warp.Logo(for: selectedLogo)
            Spacer()
        }
        .navigationTitle("Logo")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LogoViewSample_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
    }
}
