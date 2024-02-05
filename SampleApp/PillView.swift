import SwiftUI
import Warp

struct PillView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            ForEach(Warp.PillStyle.allCases, id: \.self) { style in
                createView(for: style)
            }
            .padding(.horizontal)
        }
    }
    
    func createView(for style: Warp.PillStyle) -> some View {
        let name = String(describing: style)
        let capitalizedName = name.capitalized
        
        return GroupBox(
            content: {
                HStack {
                    Warp.Pill(text: String(describing: style), style: style)
                    Warp.Pill(text: String(describing: style), isClosable: true, style: style)
                }
            }, label: {
                Text(capitalizedName)
            }
        )
    }
}

#Preview {
    PillView()
}
