import SwiftUI

extension Warp {
    /// Used to visually label objects on a page for quick recognition. They allow users to filter a list or label information. 
    public struct Pill: View, Hashable {
        public static func == (lhs: Warp.Pill, rhs: Warp.Pill) -> Bool {
            lhs.text == rhs.text &&
            lhs.isClosable == rhs.isClosable &&
            lhs.style == rhs.style
        }
        
        public func hash(into hasher: inout Hasher) {
            hasher.combine(text)
            hasher.combine(isClosable)
            hasher.combine(style)
        }
        
        /// Pill text.
        private let text: String
        /// Triggered when Pill is tapped.
        private let onTap: () -> Void
        /// Triggered when Pill is closed.
        private let onClose: (() -> Void)?
        /// The content description of the close icon. Used for accessibility purposes.
        private let iconContentDescription: String?
        /// Pill style.
        private let style: Warp.PillStyle
        /// Object that will provide needed colors.
        private let colorProvider: ColorProvider = Warp.Config.colorProvider

        public init(
            text: String,
            onTap: @escaping () -> Void = {},
            onClose: (() -> Void)? = nil,
            iconContentDescription: String? = nil,
            style: Warp.PillStyle = .filter
        ) {
            self.text = text
            self.onTap = onTap
            self.onClose = onClose
            self.iconContentDescription = iconContentDescription
            self.style = style
        }

        public var body: some View {
            SwiftUI.Button {
                onTap()
            } label: {
                HStack(spacing: 8) {
                    Text(text)
                    if isClosable {
                        SwiftUI.Button {
                            onClose?()
                        } label: {
                            Image(systemName: "xmark")
                        }
                        .accessibilityLabel(iconContentDescription ?? "Close")
                    }
                }
                .font(from: typography)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
            }
            .buttonStyle(
                .warp(
                    style: style,
                    colorProvider: colorProvider
                )
            )
        }
        
        private var isClosable: Bool {
            onClose != nil
        }
        
        private var typography: Warp.Typography {
            switch style {
            case .filter:
                return Warp.Typography.caption
            case .suggestion:
                return Warp.Typography.captionStrong
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
                HStack {
                    Warp.Pill(text: String(describing: style), style: style)
                    Warp.Pill(text: String(describing: style), onClose: {}, style: style)
                }
            }, label: {
                Text(capitalizedName)
            }
        )
    }
}
