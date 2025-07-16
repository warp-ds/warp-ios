import SwiftUI
import Warp

struct TypographyView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack (alignment: .leading, spacing: 8) {
                ForEach(Warp.Typography.allCases, id: \.name) { `case` in
                    createView(for: `case`)
                }
            }
            .padding(.horizontal)
        }
        .navigationTitle("Typography")
        .navigationBarTitleDisplayMode(.inline)
    }

    @ViewBuilder
    private func createView(for typeDescription: Warp.Typography.Description) -> some View {
        Text(typeDescription.name)
            .font(from: typeDescription.typography)
            .underline(typeDescription.underscore)

        Divider()
    }
}

extension Warp.Typography {

    struct Description {
        let typography: Warp.Typography
        let name: String
        let underscore: Bool

        init(_ typography: Warp.Typography, _ name: String, _ underscore: Bool = false) {
            self.typography = typography
            self.name = name
            self.underscore = underscore
        }
    }

    static var allCases: [Description] = [
        Description(.display, "Display"),
        Description(.title1, "Title 1"),
        Description(.title2, "Title 2"),
        Description(.title3, "Title 3"),
        Description(.title4, "Title 4"),
        Description(.title5, "Title 5"),
        Description(.title6, "Title 6"),
        Description(.preamble, "Preamble"),
        Description(.preamble, "Preamble Link", true),
        Description(.body, "Body"),
        Description(.bodyStrong, "Body Strong"),
        Description(.caption, "Caption"),
        Description(.captionStrong, "Caption Strong"),
        Description(.caption, "Caption Link", true),
        Description(.detail, "Detail"),
        Description(.detailStrong, "Detail Strong"),
        Description(.detail, "Detail Link", true)
    ]
}

#Preview {
    TypographyView()
}
