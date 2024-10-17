import SwiftUI
import Warp

struct BadgeView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            ForEach(Warp.BadgeVariant.allCases, id: \.self) { variant in
                createView(for: variant)
            }
            .padding(.horizontal)
            .navigationTitle("Badge")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    private func createView(for variant: Warp.BadgeVariant) -> some View {
        let name = String(describing: variant)
        let capitalizedName = name.capitalized
        
        return GroupBox(
            content: {
                VStack(alignment: .trailing, spacing: 8) {
                    ForEach(Warp.BadgePosition.allCases, id: \.self) { position in
                        createView(for: variant, position: position)
                    }
                }
            }, label: {
                Text(capitalizedName)
            }
        )
    }
    
    private func createView(for variant: Warp.BadgeVariant, position: Warp.BadgePosition) -> some View {
        HStack {
            Text(String(describing: position))
            Warp.Badge(text: String(describing: variant), variant: variant, position: position)
        }
    }
}

#Preview {
    BadgeView()
}
