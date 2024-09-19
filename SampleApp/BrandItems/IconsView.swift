import SwiftUI
import Warp

struct IconsView: View {
    let icons = Warp.Icon.allCases
    
    var body: some View {
        List(icons, id: \.self) { icon in
            HStack {
                icon
                    .frame(width: 24, height: 24) // Set the size of the icon
                    .foregroundColor(Warp.Token.icon)
                Warp.Text(icon.rawValue, style: .body) // Display the name of the icon
                    .padding(.leading, Warp.Spacing.spacing100)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Icons")
    }
}

struct IconListView_Previews: PreviewProvider {
    static var previews: some View {
        IconsView()
    }
}
