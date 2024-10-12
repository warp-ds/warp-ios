import SwiftUI

extension Warp {
    /// A `Badge` is used to highlight the status of an ad (Active/Inactive/Sold/Removed) or mark paid placements
    /// (Sponsored/Ad/House of the week).
    ///
    /// Badges can be displayed in various visual styles, indicated by the `BadgeVariant`, and can be positioned
    /// in different corners, defined by the `BadgePosition`.
    public struct Badge: View, Hashable {
        /// Equatable conformance for comparing two `Badge` instances.
        public static func == (lhs: Warp.Badge, rhs: Warp.Badge) -> Bool {
            lhs.text == rhs.text &&
            lhs.variant == rhs.variant &&
            lhs.position == rhs.position
        }
        
        /// Hashes the essential properties to ensure that `Badge` can be used in hash-based collections.
        public func hash(into hasher: inout Hasher) {
            hasher.combine(text)
            hasher.combine(variant)
            hasher.combine(position)
        }
        
        /// The text displayed inside the badge.
        private let text: String
        
        /// The style of the badge, determining its appearance.
        private let variant: Warp.BadgeVariant
        
        /// The corner positioning of the badge.
        private let position: Warp.BadgePosition
        
        /// The object responsible for providing colors to the badge based on the current environment or theme.
        private let colorProvider: ColorProvider = Warp.Color
        
        /// Initializes a `Badge` with the given text, style, and position.
        ///
        /// - Parameters:
        ///   - text: The text to display inside the badge.
        ///   - variant: The style of the badge, defined by `Warp.BadgeVariant`.
        ///   - position: The corner position for the badge, defined by `Warp.BadgePosition`. Defaults to `.default`.
        public init(
            text: String,
            variant: Warp.BadgeVariant,
            position: Warp.BadgePosition = .default
        ) {
            self.text = text
            self.variant = variant
            self.position = position
        }
        
        /// The body of the `Badge` view, rendering the badge with the given text, style, and position.
        public var body: some View {
            Text(text, style: .detail)
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .foregroundColor(foregroundColor)
                .background(backgroundColor)
                .cornerRadius(4, corners: corners)
        }
        
        /// Determines the foreground (text) color based on the badge variant.
        private var foregroundColor: Color {
            if variant == .price {
                return colorProvider.token.textInvertedStatic
            } else {
                return colorProvider.token.text
            }
        }
        
        /// Determines the background color based on the badge variant.
        private var backgroundColor: Color {
            switch variant {
            case .info:
                return colorProvider.badgeInfoBackground
            case .success:
                return colorProvider.badgePositiveBackground
            case .warning:
                return colorProvider.badgeWarningBackground
            case .negative:
                return colorProvider.badgeNegativeBackground
            case .disabled:
                return colorProvider.token.backgroundDisabled
            case .sponsored:
                return colorProvider.badgeSponsoredBackground
            case .neutral:
                return colorProvider.badgeNeutralBackground
            case .price:
                return colorProvider.badgePriceBackground
            }
        }
        
        /// Determines the corner radii based on the badge position.
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
        ForEach(Warp.BadgeVariant.allCases, id: \.self) { variant in
            createView(for: variant)
        }
        .padding(.horizontal)
    }
    
    func createView(for variant: Warp.BadgeVariant) -> some View {
        let name = String(describing: variant)
        let capitalizedName = name.capitalized
        
        return GroupBox(
            content: {
                VStack(alignment: .trailing, spacing: 8) {
                    ForEach(Warp.BadgePosition.allCases, id: \.self) { position in
                        createView(for: variant, position: position)
                    }
                }
            }, label: {
                Text(capitalizedName)
            }
        )
    }
    
    func createView(for variant: Warp.BadgeVariant, position: Warp.BadgePosition) -> some View {
        HStack {
            Text(String(describing: position))
            Warp.Badge(text: String(describing: variant), variant: variant, position: position)
        }
    }
}
