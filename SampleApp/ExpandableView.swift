import SwiftUI
import Warp

struct ExpandableView: View {
    @State var expandableStyle: Warp.ExpandableStyle = .default
    @State var isAnimated = true
    @State var title: String = "Title"
    @State var subTitle: String = "Subtitle"

    var body: some View {
        VStack(alignment: .leading) {
            Warp.Text("Select an expandable style", style: .bodyStrong)
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
                Warp.Text("Animated", style: .bodyStrong)
            })

            VStack {
                Warp.TextField(text: $title)
                Warp.TextField(text: $subTitle)
            }
            .autocorrectionDisabled()
            .frame(height: 100)

            Warp.Expandable(
                title: title,
                subtitle: subTitle,
                style: expandableStyle,
                isAnimated: isAnimated
            )

            Spacer()
        }
        .padding()
        .navigationTitle("Expandable")
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
