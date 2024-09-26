import SwiftUI
import Warp

struct BroadcastView: View {
    @State var broadcastIsPresented: Bool = true
    @State var broadcastEdge: Warp.BroadcastEdge = .top

    var body: some View {
        ScrollView(showsIndicators: false) {

            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Text("Broadcast View Demo")
                        .font(.title)

                    Spacer()
                }

                Text("Playground")
                    .font(.title2)
                Text("Experiment with Broadcast Edge to see the variants")

                VStack(alignment: .leading) {
                    HStack {
                        Text("Right now the broadcast is ") +
                        Text(broadcastStatus)
                            .bold()

                        Spacer()
                    }

                    if(broadcastIsPresented) {
                        Text("You can tap the broadcast to dismiss it")
                    } else {
                        Button(action: {
                            broadcastIsPresented = true
                        }, label: {
                            Text("Tap me to show the broadcast again")
                                .frame(maxWidth: .infinity)
                        })
                        .buttonStyle(.borderedProminent)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.secondary)
                .cornerRadius(8)

                Divider()

                Text("Broadcast Edge")
                    .font(.headline)

                Picker("Broadcast Edge:", selection: $broadcastEdge) {
                    ForEach(Warp.BroadcastEdge.allCases, id: \.self) { currentEdge in
                        Text(currentEdge.description)
                    }
                }
                .pickerStyle(.segmented)

                Divider()

                Spacer()
            }
        }
        .padding()
        .navigationTitle("Broadcast")
        .navigationBarTitleDisplayMode(.inline)
        .warpBroadcast(
            text: "Here's a broadcast located at the \(broadcastEdge.description) edge",
            edge: broadcastEdge,
            isPresented: $broadcastIsPresented
        )
    }

    private var broadcastStatus: String {
        broadcastIsPresented ? "visible" : "not visible"
    }
}

fileprivate @MainActor extension Warp.BroadcastEdge {
    var description: String {
        switch self {
        case .top:
            "top"
        case .bottom:
            "bottom"
        }
    }
}

#Preview {
    BroadcastView()
}
