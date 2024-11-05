import SwiftUI

extension Warp {
    /// A model representing an individual tab item with a title and an optional icon.
    public struct TabItem {
        public let title: String
        public let icon: Warp.Icon?
        
        /// Initializes a TabItem.
        /// - Parameters:
        ///   - title: The title of the tab.
        ///   - icon: An optional icon to display alongside the title.
        public init(title: String, icon: Warp.Icon? = nil) {
            self.title = title
            self.icon = icon
        }
    }
    
    /// A view for an individual tab item, including title and optional icon.
    public struct TabItemView: View {
        let title: String
        let icon: Warp.Icon?
        let isSelected: Bool
        private let colorProvider: ColorProvider = Warp.Color

        public var body: some View {
            VStack {
                HStack(alignment: .center, spacing: Warp.Spacing.spacing100) {
                    if let icon = icon {
                        Warp.IconView(icon, size: .small)
                            .foregroundColor(isSelected ? colorProvider.token.textLink : colorProvider.token.textSubtle)
                    }
                    SwiftUI.Text(title)
                        .font(from: .bodyStrong)
                        .foregroundColor(isSelected ? colorProvider.token.textLink : colorProvider.token.textSubtle)
                }
                .padding(0)

                // Indicator line for selected tab
                Rectangle()
                    .fill(isSelected ? colorProvider.token.borderSelected : colorProvider.token.border)
                    .frame(height: isSelected ? 3 : 1)
                    .padding(.top, 4)
            }
        }
    }
}

#Preview {
    Warp.Tabs(tabs: [
        Warp.TabItem(title: "Tab 1", icon: .listSort),
        Warp.TabItem(title: "Tab 2", icon: .listSort),
        Warp.TabItem(title: "Tab 3", icon: .listSort),
        Warp.TabItem(title: "Tab 4", icon: .listSort)
    ])
}
