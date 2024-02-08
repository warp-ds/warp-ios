import SwiftUI
import Warp

struct TypographyView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack (alignment: .leading, spacing: 8) {
                ForEach(Warp.Typography.allCases, id: \.name) { `case` in
                    createView(for: `case`.typography, text: `case`.name)
                }
            }
            .padding(.horizontal)
        }
    }

    @ViewBuilder
    private func createView(for typography: Warp.Typography, text: String) -> some View {
        Text(text)
            .font(from: typography)

        Divider()
    }
}

extension Warp.Typography {
    fileprivate static var allCases: [(typography: Warp.Typography, name: String)] = [
        (.display, "Display"),
        (.title1, "Title 1"),
        (.title2, "Title 2"),
        (.title3, "Title 3"),
        (.title4, "Title 4"),
        (.title5, "Title 5"),
        (.title6, "Title 6"),
        (.preamble, "Preamble"),
        (.body, "Body"),
        (.bodyStrong, "Body Strong"),
        (.caption, "Caption"),
        (.captionStrong, "Caption Strong"),
        (.detail, "Detail"),
        (.detailStrong, "Detail Strong"),
    ]
}

#Preview {
    TypographyView()
}
