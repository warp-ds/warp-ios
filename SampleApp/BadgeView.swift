import SwiftUI
import Warp

struct BadgeView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            ForEach(Warp.Badge.Style.allCases, id: \.self) { style in
                createView(for: style)
            }
            .padding(.horizontal)
        }
    }

    private func createView(for style: Warp.Badge.Style) -> some View {
        let name = String(describing: style)
        let capitalizedName = name.capitalized
        
        return GroupBox(
            content: {
                VStack(alignment: .trailing, spacing: 8) {
                    ForEach(Warp.Badge.Alignment.allCases, id: \.self) { alignment in
                        createView(for: style, alignment: alignment)
                    }
                }
            }, label: {
                Text(capitalizedName)
            }
        )
    }
    
    private func createView(for style: Warp.Badge.Style, alignment: Warp.Badge.Alignment) -> some View {
        HStack {
            Text(String(describing: alignment))
            Warp.Badge(text: String(describing: style), style: style, alignment: alignment)
        }
    }
}

#Preview {
    BadgeView()
}
