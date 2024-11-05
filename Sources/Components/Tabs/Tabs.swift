import SwiftUI

extension Warp {
    public struct Tabs: View {
        public let tabs: [TabItem]
        @State private var selectedIndex: Int = 0
        private let colorProvider: ColorProvider = Warp.Color

        public init(tabs: [TabItem]) {
            self.tabs = tabs
        }

        public var body: some View {
            HStack(alignment: .center, spacing: 0) {
                ForEach(tabs.indices, id: \.self) { index in
                    let tab = tabs[index]
                    TabItemView(
                        title: tab.title,
                        icon: tab.icon,
                        isSelected: index == selectedIndex
                    )
                    .onTapGesture {
                        withAnimation {
                            selectedIndex = index
                        }
                    }
                }
            }
            .padding(.horizontal, Warp.Spacing.spacing100)
            .padding(.vertical, Warp.Spacing.spacing100)
            .background(
                Rectangle()
                    .fill(colorProvider.token.backgroundTransparent0)
                    .frame(height: 34)
            )
        }
    }
}
