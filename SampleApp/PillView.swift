import SwiftUI
import Warp

struct PillView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            ForEach(Warp.PillStyle.allCases, id: \.self) { style in
                createView(for: style)
            }
            .padding(.horizontal)
            .navigationTitle("Pill")
        }
    }
    
    func createView(for style: Warp.PillStyle) -> some View {
        let name = String(describing: style)
        let capitalizedName = name.capitalized
        
        return GroupBox(
            content: {
                VStack {
                    HStack {
                        Warp.Pill(text: String(describing: style), style: style)
                        Warp.Pill(text: String(describing: style), onClose: {}, style: style)
                    }
                    HStack {
                        Warp.Pill(text: String(describing: style), icon: Image(systemName: "plus"), style: style)
                        Warp.Pill(text: String(describing: style), icon: Image(systemName: "plus"), onClose: {}, style: style)
                    }
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
