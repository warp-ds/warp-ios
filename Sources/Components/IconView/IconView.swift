import SwiftUI

extension Warp {
    /// A view that renders an icon with the specified size.
    public struct IconView: View {
        private let icon: Warp.Icon
        private let size: Warp.IconSize
        /// Icon color.
        private let color: Color
        private let colorProvider: ColorProvider = Warp.Color
        
        /// Initializes a new `IconView`.
        ///
        /// - Parameters:
        ///   - icon: The `Warp.Icon` to display.
        ///   - size: The size of the icon (small, default, large).
        public init(_ icon: Warp.Icon,
                    size: Warp.IconSize = .default,
                    color: Color = Warp.Color.token.icon
        ) {
            self.icon = icon
            self.size = size
            self.color = color
        }

        public var body: some View {
            icon
                .frame(width: size.value, height: size.value)
                .foregroundColor(color)
        }
    }
}

extension Warp.IconView {
    public func foregroundColor(_ color: Color) -> Self {
        return Warp.IconView(icon, size: size, color: color)
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
