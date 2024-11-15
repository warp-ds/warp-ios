import SwiftUI

extension Warp {
    /// A customizable tab view component with selectable tabs.
    /// - Parameters:
    ///   - tabs: An array of `TabItem` objects, each containing a title and an optional icon.
    ///   - selectedIndex: The index of the currently selected tab.
    public struct Tabs: View {
        public let tabs: [TabItem]
        @State private var selectedIndex: Int = 0
        private let colorProvider: ColorProvider = Warp.Color
        
        /// Initializes the Tabs view.
        /// - Parameter tabs: An array of `TabItem` objects to display as tabs.
        public init(tabs: [TabItem]) {
            self.tabs = tabs
        }
        
        public var body: some View {
            VStack(spacing: 0) {
                ScrollViewReader { scrollProxy in
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(alignment: .center, spacing: 0) {
                            ForEach(tabs.indices, id: \.self) { index in
                                let tab = tabs[index]
                                VStack(spacing: 8) {
                                    // Display tab content
                                    TabItemView(
                                        title: tab.title,
                                        icon: tab.icon,
                                        isSelected: index == selectedIndex
                                    )
                                    .onTapGesture {
                                        withAnimation(.easeInOut(duration: 0.3)) {
                                            selectedIndex = index
                                            scrollProxy.scrollTo(index, anchor: .center)
                                        }
                                    }
                                    .offset(y: index == selectedIndex ? 1.5 : 0)
                                    
                                    // Draw underline based on selection
                                    Rectangle()
                                        .fill(index == selectedIndex ? colorProvider.token.borderSelected : colorProvider.token.border)
                                        .frame(height: index == selectedIndex ? 3 : 0)
                                        .offset(y: index == selectedIndex ? -1.5 : 0)
                                        .animation(.easeInOut(duration: 0.3), value: selectedIndex)
                                }
                            }
                        }
                    }
                }
                .background(
                    VStack(spacing: 0) {
                        Rectangle()
                            .fill(colorProvider.token.backgroundTransparent0)
                            .frame(height: 34)
                        // Draw underline
                        Rectangle()
                            .fill(colorProvider.token.border)
                            .frame(height: 1)
                            .offset(y: -3.5)
                    }
                )
            }
        }
    }
}

#Preview {
    Warp.Tabs(tabs: [
        Warp.TabItem(title: "Tab 1", icon: .listSort),
        Warp.TabItem(title: "Longer Tab Title", icon: .listSort),
        Warp.TabItem(title: "Tab 3", icon: .listSort),
        Warp.TabItem(title: "Tab 4", icon: .listSort)
    ])
}
