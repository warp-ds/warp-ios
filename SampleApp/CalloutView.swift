import SwiftUI
import Warp

struct CalloutView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Callout Views")
                .font(.title)
            VStack(alignment: .leading) {
                Text("Callout over content")
                    .font(.headline)

                Warp.Callout(
                    title: "ArrowEdge: .bottom and then a lot more text so we get this wrapped",
                    arrowEdge: .bottom
                )

                Text("This one sits over the content")

                Divider()
            }

            VStack(alignment: .leading) {
                Text("Callout under content")
                    .font(.headline)


                Text("This one sits under the content")

                Warp.Callout(title: <#T##String#>)

                Warp.Callout(
                    title: "ArrowEdge: .top",
                    arrowEdge: .top
                )

                Divider()
            }

            VStack(alignment: .leading) {
                Text("Callout before content")
                    .font(.headline)

                HStack {
                    Warp.Callout(
                        title: "ArrowEdge: .trailing",
                        arrowEdge: .trailing
                    )

                    Text("This one sits before the content")
                    Spacer()
                }

                Divider()
            }

            VStack(alignment: .leading) {
                Text("Callout after content")
                    .font(.headline)

                HStack {
                    Text("This one sits after the content")

                    Warp.Callout(
                        title: "ArrowEdge: .leading",
                        arrowEdge: .leading
                    )

                    Spacer()
                }
                Divider()
            }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    CalloutView()
}
