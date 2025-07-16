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
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    func createView(for style: Warp.PillStyle) -> some View {
        let name = String(describing: style)
        let capitalizedName = name.capitalized
        
        return GroupBox(
            content: {
                VStack {
                    HStack {
                        Warp.Pill(text: String(describing: style), onTap: { print("onTap") }, style: style)
                        Warp.Pill(text: String(describing: style), onTap: { print("onTap") }, onClose: { print("onClose") }, style: style)
                    }
                    HStack {
                        Warp.Pill(text: String(describing: style), icon: .plus, onTap: { print("onTap") }, style: style)
                        Warp.Pill(text: String(describing: style), icon: .plus, onTap: { print("onTap") }, onClose: { print("onClose") }, style: style)
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
