import SwiftUI
import Warp

struct CalloutView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Callout Views")

            Warp.Callout(edge: .top) {
                Text("Edge: .top")
            }
            Text("This one sits over the content")

            Divider()

            Text("This one sits under the content")
            Warp.Callout(edge: .bottom) {
                Text("Edge: .bottom")
            }

            Divider()

            HStack {
                Warp.Callout(edge: .leading) {
                    Text("Edge: .leading")
                }
                Text("This one sits before the content")
            }

            Divider()

            HStack {
                Text("This one sits after the content")

                Warp.Callout(edge: .trailing) {
                    Text("Edge: .trailing")
                }
            }

            Spacer()
        }
    }
}

#Preview {
    CalloutView()
}
