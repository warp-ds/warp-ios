import SwiftUI
import Warp

struct BrandIconsView: View {
    let icons = Warp.BrandIcon.allCases
    
    var body: some View {
        List(icons, id: \.self) { icon in
            HStack {
                icon
                    .frame(width: 42, height: 28) // Set the size of the icon
                Warp.Text(icon.rawValue, style: .body) // Display the name of the icon
                    .padding(.leading, Warp.Spacing.spacing100)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Brand Icons")
    }
}

struct BrandIconListView_Previews: PreviewProvider {
    static var previews: some View {
        BrandIconsView()
    }
}
