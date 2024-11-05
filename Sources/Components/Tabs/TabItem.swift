import SwiftUI

extension Warp {
    // Define a TabItem model to represent each tab with a title and an optional icon
    public struct TabItem {
        public let title: String
        public let icon: Warp.Icon?
        
        public init(title: String,
                    icon: Warp.Icon? = nil) {
            self.title = title
            self.icon = icon
        }
    }
    
    // Define the TabViewItem to represent each tab's UI
    public struct TabItemView: View {
        let title: String
        let icon: Warp.Icon?
        let isSelected: Bool
        let colorProvider: ColorProvider = Warp.Color

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

                // Indicator line
                Rectangle()
                    .fill(isSelected ? colorProvider.token.borderSelected : colorProvider.token.border)
                    .frame(height: isSelected ? 3 : 1)
                    .padding(.top, 4)
            }
        }
    }
}
