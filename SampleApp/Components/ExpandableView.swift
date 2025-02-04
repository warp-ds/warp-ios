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
            Picker("Expandable Style", selection: $expandableStyle.animation(.easeIn)) {
                ForEach(Warp.ExpandableStyle.allCases, id: \.self) { style in
                    Text(style.rawValue)
                }
            }
            .pickerStyle(.segmented)

            Toggle(isOn: $isAnimated, label: {
                Warp.Text("Animated", style: .bodyStrong)
            })
            .padding(.top)

            VStack {
                Warp.TextField(text: $title)
                Warp.TextField(text: $subTitle)
            }
            .autocorrectionDisabled()

            Warp.Expandable(
                style: expandableStyle,
                title: title,
                subtitle: subTitle,
                isAnimated: isAnimated
            )

            Spacer()
        }
        .padding()
        .navigationTitle("Expandable")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ExpandableView()
}
