import SwiftUI

extension Warp {
    /// Use badges to highlight status of an ad (Active/Inactive/Sold/Removed) or to mark paid placements (Sponsored/Ad/House of the week).
    public struct Text: View, Hashable {
        public static func == (lhs: Warp.Text, rhs: Warp.Text) -> Bool {
            lhs.text == rhs.text &&
            lhs.style == rhs.style
        }
        
        public func hash(into hasher: inout Hasher) {
            hasher.combine(text)
            hasher.combine(style)
        }
        
        /// Text text.
        private let text: String
        /// Text style.
        private let style: Warp.TextStyle
        private let colorProvider: ColorProvider = Warp.Config.colorProvider

        public init(
            _ text: String,
            style: Warp.TextStyle
        ) {
            self.text = text
            self.style = style
        }

        public var body: some View {
            SwiftUI.Text(text)
                .font(from: style.asTypography)
        }
    }
}

#Preview {
    return ScrollView(showsIndicators: false) {
        ForEach(Warp.TextStyle.allCases, id: \.self) { variant in
            VStack(alignment: .leading, spacing: 10) {
                createView(for: variant)
                Divider()
            }
            .padding(.vertical, 4)
        }
        .padding()
    }
        
    func createView(for style: Warp.TextStyle) -> some View {
        Warp.Text(String(describing: style).capitalized, style: style)
    }
}
