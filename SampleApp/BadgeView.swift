import SwiftUI
import Warp

struct BadgeView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            ForEach(Warp.Badge.Variant.allCases, id: \.self) { variant in
                createView(for: variant)
            }
            .padding(.horizontal)
            .navigationTitle("Badge")
        }
    }

    private func createView(for variant: Warp.Badge.Variant) -> some View {
        let name = String(describing: variant)
        let capitalizedName = name.capitalized
        
        return GroupBox(
            content: {
                VStack(alignment: .trailing, spacing: 8) {
                    ForEach(Warp.Badge.Position.allCases, id: \.self) { position in
                        createView(for: variant, position: position)
                    }
                }
            }, label: {
                Text(capitalizedName)
            }
        )
    }
    
    private func createView(for variant: Warp.Badge.Variant, position: Warp.Badge.Position) -> some View {
        HStack {
            Text(String(describing: position))
            Warp.Badge(text: String(describing: variant), variant: variant, position: position)
        }
    }
}

#Preview {
    BadgeView()
}
