import SwiftUI
import Warp

struct TooltipView: View {
    private let colorProvider: ColorProvider = Warp.Color
    @State private var edge = Edge.top

    var body: some View {
        ZStack {
            VStack {
                Warp.Tooltip(title: "Tooltip", arrowEdge: edge)
                Spacer()
                Picker("Pick your edge", selection: $edge.animation(.interpolatingSpring)) {
                    ForEach(Edge.allCases, id: \.self) { edge in
                        Text(edge.name)
                    }
                }
                .pickerStyle(.segmented)
                .padding()
            }
        }
        .navigationTitle("Tooltip")
        .navigationBarTitleDisplayMode(.inline)
    }
}

extension Edge {
    fileprivate var name: String {
        switch self {
        case .top:
            return "Top"
        case .leading:
            return "Leading"
        case .bottom:
            return "Bottom"
        case .trailing:
            return "Trailing"
        }
    }
}

#Preview {
    TooltipView()
}
