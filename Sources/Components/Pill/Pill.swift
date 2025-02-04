import SwiftUI

extension Warp {
    /// Used to visually label objects on a page for quick recognition. They allow users to filter a list or label information.
    public struct Pill: View, Hashable {
        public static func == (lhs: Warp.Pill, rhs: Warp.Pill) -> Bool {
            lhs.text == rhs.text &&
            lhs.style == rhs.style
        }
        
        public func hash(into hasher: inout Hasher) {
            hasher.combine(text)
            hasher.combine(style)
        }
        
        /// Pill text.
        private let text: String
        /// Pill icon. If you provide onClose then the Pill will have a close button instead of this icon.
        private let icon: Warp.Icon?
        /// Triggered when Pill is tapped.
        private let onTap: () -> Void
        /// Triggered when Pill is closed. If provided a close button will replace any provided icon.
        private let onClose: (() -> Void)?
        /// The content description of the icon. Used for accessibility purposes.
        private let iconContentDescription: String?
        /// Pill style.
        private let style: Warp.PillStyle
        /// Object that will provide needed colors.
        private let colorProvider: ColorProvider = Warp.Color

        public init(
            text: String,
            icon: Warp.Icon? = nil,
            onTap: @escaping () -> Void = {},
            onClose: (() -> Void)? = nil,
            iconContentDescription: String? = nil,
            style: Warp.PillStyle = .filter
        ) {
            self.text = text
            self.icon = icon
            self.onTap = onTap
            self.onClose = onClose
            self.iconContentDescription = iconContentDescription
            self.style = style
        }

        public var body: some View {
            SwiftUI.Button {
                onTap()
            } label: {
                HStack(spacing: 4) {
                    Text(text,
                         style: .captionStrong,
                         color: textColor
                    )
                    if let onClose {
                        SwiftUI.Button {
                            onClose()
                        } label: {
                            Warp.IconView(.close, size: .small, color: textColor)
                        }
                        .accessibilityLabel(iconContentDescription ?? "Close")
                    } else if let icon {
                        Warp.IconView(icon, size: .small, color: textColor)
                            .accessibilityLabel(iconContentDescription ?? icon.localization)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
            }
            .buttonStyle(
                .warpPill(
                    style: style,
                    colorProvider: colorProvider
                )
            )
        }
        
        private var textColor: Color {
            switch style {
            case .filter:
                return colorProvider.token.textInverted
            case .suggestion:
                return colorProvider.token.text
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
                VStack {
                    HStack {
                        Warp.Pill(text: String(describing: style), style: style)
                        Warp.Pill(text: String(describing: style), onClose: {}, style: style)
                    }
                    HStack {
                        Warp.Pill(text: String(describing: style), icon: .plus, style: style)
                        Warp.Pill(text: String(describing: style), icon: .plus, onClose: {}, style: style)
                    }
                }
            }, label: {
                Text(capitalizedName)
            }
        )
    }
}
