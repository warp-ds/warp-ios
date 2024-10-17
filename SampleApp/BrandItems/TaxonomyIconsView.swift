import SwiftUI
import Warp

struct TaxonomyIconsView: View {
    let icons = Warp.TaxonomyIcon.allCases
    
    var body: some View {
        List(icons, id: \.self) { icon in
            HStack {
                icon
                    .frame(width: 42, height: 28) // Set the size of the icon
                    .foregroundColor(Warp.Token.icon) // Apply default color to the icon
                Warp.Text(icon.rawValue, style: .body) // Display the name of the icon
                    .padding(.leading, Warp.Spacing.spacing100)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Taxonomy Icons")
    }
}

struct TaxonomyIconListView_Previews: PreviewProvider {
    static var previews: some View {
        TaxonomyIconsView()
    }
}
