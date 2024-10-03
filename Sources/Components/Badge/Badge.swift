import SwiftUI

extension Warp {
    /// Use badges to highlight status of an ad (Active/Inactive/Sold/Removed) or to mark paid placements (Sponsored/Ad/House of the week).
    public struct Badge: View, Hashable {
        public static func == (lhs: Warp.Badge, rhs: Warp.Badge) -> Bool {
            lhs.text == rhs.text &&
            lhs.variant == rhs.variant &&
            lhs.position == rhs.position
        }
        
        public func hash(into hasher: inout Hasher) {
            hasher.combine(text)
            hasher.combine(variant)
            hasher.combine(position)
        }
        
        /// Badge text.
        private let text: String
        /// Badge type.
        private let variant: Warp.Badge.Variant
        /// Badge corner variant.
        private let position: Warp.Badge.Position
        /// Object that will provide needed colors.
        private let colorProvider: ColorProvider = Warp.Color

        public init(
            text: String,
            variant: Warp.Badge.Variant,
            position: Warp.Badge.Position = .default
        ) {
            self.text = text
            self.variant = variant
            self.position = position
        }

        public var body: some View {
            Text(text, style: .detail)
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .foregroundColor(foregroundColor)
                .background(backgroundColor)
                .cornerRadius(4, corners: corners)
        }
        
        private var foregroundColor: Color {
            switch variant {
            case .info:
                return colorProvider.badgeInfoText
            case .success:
                return colorProvider.badgePositiveText
            case .warning:
                return colorProvider.badgeWarningText
            case .error:
                return colorProvider.badgeNegativeText
            case .disabled:
                return colorProvider.badgeDisabledText
            case .sponsored:
                return colorProvider.badgeNeutralText
            case .neutral:
                return colorProvider.badgeNeutralText
            }
        }
        
        private var backgroundColor: Color {
            switch variant {
            case .info:
                return colorProvider.badgeInfoBackground
            case .success:
                return colorProvider.badgePositiveBackground
            case .warning:
                return colorProvider.badgeWarningBackground
            case .error:
                return colorProvider.badgeNegativeBackground
            case .disabled:
                return colorProvider.badgeDisabledBackground
            case .sponsored:
                return colorProvider.badgeSponsoredBackground
            case .neutral:
                return colorProvider.badgeNeutralBackground
            }
        }
        
        private var corners: UIRectCorner {
            switch position {
            case .default:
                return .allCorners
            case .topLeft, .bottomRight:
                return [.topLeft, .bottomRight]
            case .topRight, .bottomLeft:
                return [.topRight, .bottomLeft]
            }
        }
    }
}

#Preview {
    return ScrollView(showsIndicators: false) {
        ForEach(Warp.Badge.Variant.allCases, id: \.self) { variant in
            createView(for: variant)
        }
        .padding(.horizontal)
    }
    
    func createView(for variant: Warp.Badge.Variant) -> some View {
        let name = String(describing: variant)
        let capitalizedName = name.capitalized
        
        return GroupBox(
            content: {
                VStack(alignment: .trailing, spacing: 8) {
                    ForEach(Warp.Badge.Position.allCases, id: \.self) { position in
                        createView(for: variant, position: position)
                    }
                }
            }, label: {
                Text(capitalizedName)
            }
        )
    }
    
    func createView(for variant: Warp.Badge.Variant, position: Warp.Badge.Position) -> some View {
        HStack {
            Text(String(describing: position))
            Warp.Badge(text: String(describing: variant), variant: variant, position: position)
        }
    }
}
