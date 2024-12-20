import SwiftUI
import Warp

struct TextView: View {
    @State private var useGradient = false
    @State private var firstColor = Warp.Color.token.text
    @State private var secondColor = Warp.Color.token.textNegative

    var body: some View {
        GroupBox {
            // Switch to change to Gradient
            HStack {
                Text("Use Gradient")
                Spacer()
                Warp.Switch(isOn: $useGradient)
            }
            .padding(.horizontal)
            // Color picker to choose text color
            if useGradient {
                ColorPicker("Select first color", selection: $firstColor)
                    .padding(.horizontal)
                ColorPicker("Select second color", selection: $secondColor)
                    .padding(.horizontal)
            } else {
                ColorPicker("Select text color", selection: $firstColor)
                    .padding(.horizontal)
            }
        } label: {
            Text("Modify Text")
        }
        .padding(.horizontal)

        ScrollView(showsIndicators: false) {
            ForEach(Warp.TextStyle.allCases, id: \.self) { variant in
                VStack(alignment: .leading, spacing: 10) {
                    createView(for: variant)
                    Divider()
                }
                .padding(.vertical, 4)
            }
            .padding(.horizontal)
            .id(useGradient ? "\(useGradient)-\(firstColor)-\(secondColor)" : "\(firstColor)")
        }
        .navigationTitle("Text")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func createView(for style: Warp.TextStyle) -> some View {
        if useGradient {
            Warp.Text(String(describing: style).capitalized, style: style)
                .foregroundStyle(AnyShapeStyle(
                    LinearGradient(
                        colors: [firstColor, secondColor],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                ))
        } else {
            Warp.Text(String(describing: style).capitalized, style: style)
                .foregroundColor(firstColor)
        }
    }
}

#Preview {
    TextView()
}
