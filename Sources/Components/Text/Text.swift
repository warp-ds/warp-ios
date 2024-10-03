import SwiftUI

extension Warp {
    /// Use badges to highlight status of an ad (Active/Inactive/Sold/Removed) or to mark paid placements (Sponsored/Ad/House of the week).
    public struct Text: View, Hashable {
        public nonisolated static func == (lhs: Warp.Text, rhs: Warp.Text) -> Bool {
            lhs.text == rhs.text &&
            lhs.style == rhs.style
        }
        
        public nonisolated func hash(into hasher: inout Hasher) {
            hasher.combine(text)
            hasher.combine(style)
        }
        
        /// Text text.
        private let text: String
        /// Text style.
        private let style: Warp.TextStyle
        /// Text color.
        private let color: Color
        private let colorProvider: ColorProvider = Warp.Color

        public init(
            _ text: String,
            style: Warp.TextStyle,
            color: Color = Warp.Color.token.text
        ) {
            self.text = text
            self.style = style
            self.color = color
        }

        public var body: some View {
            SwiftUI.Text(text)
                .font(from: style.asTypography)
                .foregroundColor(color)
        }
    }
}

extension Warp.Text {
    public func foregroundColor(_ color: Color) -> Self {
        return Warp.Text(text, style: style, color: color)
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
