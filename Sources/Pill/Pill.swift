import SwiftUI

extension Warp {
    /// Use badges to highlight status of an ad (Active/Inactive/Sold/Removed) or to mark paid placements (Sponsored/Ad/House of the week).
    public struct Pill: View, Hashable {
        public static func == (lhs: Warp.Pill, rhs: Warp.Pill) -> Bool {
            lhs.text == rhs.text &&
            lhs.isClosable == rhs.isClosable &&
            lhs.style == rhs.style &&
            lhs.state == rhs.state
        }
        
        public func hash(into hasher: inout Hasher) {
            hasher.combine(text)
            hasher.combine(isClosable)
            hasher.combine(style)
            hasher.combine(state)
        }
        
        /// Pill text.
        private let text: String
        /// Toggle the show or hide the close icon.
        private let isClosable: Bool
        /// Triggered when Pill is tapped.
        private let onTap: () -> Void
        /// Triggered when Pill is closed.
        private let onClose: () -> Void
        /// The content description of the close icon. Used for accessibility purposes.
        private let iconContentDescription: String?
        /// Pill style.
        private let style: Warp.PillStyle
        /// Pill state.
        private let state: Warp.PillState
        /// Object that will provide needed colors.
        private let colorProvider: ColorProvider = Warp.Config.colorProvider

        public init(
            text: String,
            isClosable: Bool = false,
            onTap: @escaping () -> Void = {},
            onClose: @escaping () -> Void = {},
            iconContentDescription: String? = nil,
            style: Warp.PillStyle = .filter,
            state: Warp.PillState = .default
        ) {
            self.text = text
            self.isClosable = isClosable
            self.onTap = onTap
            self.onClose = onClose
            self.iconContentDescription = iconContentDescription
            self.style = style
            self.state = state
        }

        public var body: some View {
            HStack(spacing: 8) {
                Text(text)
                if isClosable {
                    SwiftUI.Button {
                        onClose()
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundStyle(foregroundColor)
                    }
                    .accessibilityLabel(iconContentDescription ?? "Close")
                }
            }
            .onTapGesture {
                onTap()
            }
            .font(from: typography)
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .foregroundColor(foregroundColor)
            .background(backgroundColor)
            .cornerRadius(100)
        }
        
        private var typography: Warp.Typography {
            switch style {
            case .filter:
                return Warp.Typography.caption
            case .suggestion:
                return Warp.Typography.captionStrong
            }
        }
        
        private var foregroundColor: Color {
            switch style {
            case .filter:
                return colorProvider.pillFilterText
            case .suggestion:
                return colorProvider.pillSuggestionText
            }
        }
        
        private var backgroundColor: Color {
            switch (style, state) {
            case (.filter, .default):
                return colorProvider.pillFilterBackground
            case (.suggestion, .default):
                return colorProvider.pillSuggestionBackground
            case (.filter, .hover):
                return colorProvider.pillFilterBackgroundHover
            case (.suggestion, .hover):
                return colorProvider.pillSuggestionBackgroundHover
            case (.filter, .active):
                return colorProvider.pillFilterBackgroundActive
            case (.suggestion, .active):
                return colorProvider.pillSuggestionBackgroundActive
            }
        }
    }
}

#Preview {
    return ScrollView(showsIndicators: false) {
        ForEach(Warp.PillStyle.allCases, id: \.self) { style in
            createView(for: style)
        }
        .padding(.horizontal)
    }
    
    func createView(for style: Warp.PillStyle) -> some View {
        let name = String(describing: style)
        let capitalizedName = name.capitalized
        
        return GroupBox(
            content: {
                VStack(alignment: .trailing, spacing: 8) {
                    ForEach(Warp.PillState.allCases, id: \.self) { state in
                        createView(for: style, state: state)
                    }
                }
            }, label: {
                Text(capitalizedName)
            }
        )
    }
    
    func createView(for style: Warp.PillStyle, state: Warp.PillState) -> some View {
        HStack {
            Text(String(describing: state))
            Warp.Pill(text: String(describing: style), style: style, state: state)
            Warp.Pill(text: String(describing: style), isClosable: true, style: style, state: state)
        }
    }
}
