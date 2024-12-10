import SwiftUI
import Warp

struct BrandLogosView: View {
    let logos = Warp.BrandLogo.allCases

    var body: some View {
        List(logos, id: \.self) { logo in
            HStack {
                logo
                Warp.Text(logo.rawValue, style: .body) // Display the name of the logo
                    .padding(.leading, Warp.Spacing.spacing100)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Brand Logos")
    }
}

struct BrandLogosView_Previews: PreviewProvider {
    static var previews: some View {
        BrandLogosView()
    }
}
