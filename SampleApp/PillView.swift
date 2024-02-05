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
                VStack(alignment: .trailing, spacing: 8) {
                    ForEach(Warp.PillState.allCases, id: \.self) { state in
                        createView(for: style, state: state)
                    }
                }
            }, label: {
                Text(capitalizedName)
            }
        )
    }
    
    func createView(for style: Warp.PillStyle, state: Warp.PillState) -> some View {
        HStack {
            Text(String(describing: state))
            Warp.Pill(text: String(describing: style), style: style, state: state)
            Warp.Pill(text: String(describing: style), isClosable: true, style: style, state: state)
        }
    }
}

#Preview {
    PillView()
}
