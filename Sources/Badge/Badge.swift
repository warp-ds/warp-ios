import SwiftUI

extension Warp {
    /// Use badges to highlight status of an ad (Active/Inactive/Sold/Removed) or to mark paid placements (Sponsored/Ad/House of the week).
    public struct Badge: View {
        /// Badge text.
        private let text: String
        /// Badge type.
        private let style: Warp.Badge.Style
        /// Badge corner variant.
        private let alignment: Warp.Badge.Alignment
        /// Object that will provide needed colors.
        private let colorProvider: ColorProvider = Warp.Config.colorProvider

        public init(
            text: String,
            style: Warp.Badge.Style,
            alignment: Warp.Badge.Alignment = .default
        ) {
            self.text = text
            self.style = style
            self.alignment = alignment
        }

        public var body: some View {
            Text(text)
                .font(from: Warp.Typography.detail)
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .foregroundColor(foregroundColor)
                .background(backgroundColor)
                .cornerRadius(4, corners: corners)
        }
        
        private var foregroundColor: Color {
            switch style {
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
            switch style {
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
            switch alignment {
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
        ForEach(Warp.Badge.Style.allCases, id: \.self) { style in
            createView(for: style)
        }
        .padding(.horizontal)
    }
    
    func createView(for style: Warp.Badge.Style) -> some View {
        let name = String(describing: style)
        let capitalizedName = name.capitalized
        
        return GroupBox(
            content: {
                VStack(alignment: .trailing, spacing: 8) {
                    ForEach(Warp.Badge.Alignment.allCases, id: \.self) { alignment in
                        createView(for: style, alignment: alignment)
                    }
                }
            }, label: {
                Text(capitalizedName)
            }
        )
    }
    
    func createView(for style: Warp.Badge.Style, alignment: Warp.Badge.Alignment) -> some View {
        HStack {
            Text(String(describing: alignment))
            Warp.Badge(text: String(describing: style), style: style, alignment: alignment)
        }
    }
}
