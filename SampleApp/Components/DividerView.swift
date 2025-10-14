import Warp
import SwiftUI

struct DividerView: View {

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                // Vertical solid divider
                GroupBox(content: {
                    HStack(spacing: 30) {
                        Text("Solid divider")
                        Warp.Divider(orientation: .vertical, style: .solid)
                        Warp.Divider(orientation: .vertical, style: .dashed)
                        Text("Dashed divider")
                    }
                    .frame(minHeight: 200)
                    .padding()
                }, label: {
                    Text("Vertical Divider")
                })
                
                // Horizontal solid divider
                GroupBox(content: {
                    VStack(spacing: 30) {
                        Text("Solid divider")
                        Warp.Divider(orientation: .horizontal, style: .solid)
                        Warp.Divider(orientation: .horizontal, style: .dashed)
                        Text("Dashed divider")
                    }
                    .padding()
                }, label: {
                    Text("Horizontal Divider")
                })

            }
            .padding()
        }
    }
}
