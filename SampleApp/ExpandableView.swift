import SwiftUI
import Warp

struct ExpandableView: View {
    @State var expandableStyle: Warp.ExpandableStyle = .default
    @State var isAnimated = true

    var body: some View {
        VStack {
            Warp.Text("Expandable Stype", style: .title2)
            Picker("Expandable Style", selection: $expandableStyle) {
                ForEach([
                    Warp.ExpandableStyle.default,
                    Warp.ExpandableStyle.box,
                    Warp.ExpandableStyle.boxBleed,
                ], id: \.self) { style in
                    Text(style.description)
                }
            }
            .pickerStyle(.segmented)

            Toggle(isOn: $isAnimated, label: {
                Warp.Text("Animated", style: .body)
            })

            Warp.Expandable(
                title: "Title",
                subtitle: "Subtitle, which is long so we need to span over more than one line",
                style: expandableStyle,
                isAnimated: isAnimated
            )

            Warp.Text("How does it look with text underneath?", style: .body)
            Spacer()
        }
        .padding()
    }
}

fileprivate extension Warp.ExpandableStyle {
    var description: String {
        switch self {
        case .default:
            "Default"
        case .box:
            "Box"
        case .boxBleed:
            "Box Bleed"
        }
    }
}

#Preview {
    ExpandableView()
}
