import SwiftUI

extension Warp {
    /// A customizable tab view component with selectable tabs.
    /// This view allows users to navigate between multiple tabs, each represented by a title and an optional icon.
    /// The selected tab is highlighted, with an underline that changes color based on the selection state.
    ///
    /// - Parameters:
    ///   - tabs: An array of `TabItem` objects, each containing a title and an optional icon to display in the tab.
    ///   - selectedIndex: A binding to the index of the currently selected tab.
    public struct Tabs: View {
        public let tabs: [TabItem]
        @Binding private var selectedIndex: Int
        private let colorProvider: ColorProvider = Warp.Color
        
        /// Initializes the Tabs view with an array of tabs and a binding for the selected index.
        ///
        /// - Parameters:
        ///   - tabs: An array of `TabItem` objects to display as selectable tabs.
        ///   - selectedIndex: A binding to the index of the currently selected tab. Updates to this binding will be observed by the view, triggering animations and layout changes.
        public init(tabs: [TabItem], selectedIndex: Binding<Int>) {
            self.tabs = tabs
            self._selectedIndex = selectedIndex
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
                                    .offset(y: index == selectedIndex ? 1 : 0)
                                    
                                    // Draw underline based on selection
                                    Rectangle()
                                        .fill(index == selectedIndex ? colorProvider.token.borderSelected : colorProvider.token.border)
                                        .frame(height: index == selectedIndex ? 3 : 1)
                                        .offset(y: index == selectedIndex ? -1.5 : 0)
                                        .animation(.easeInOut(duration: 0.3), value: selectedIndex)
                                }
                            }
                        }
                        .padding(.horizontal, Warp.Spacing.spacing100)
                    }
                }
                .background(
                    Rectangle()
                        .fill(colorProvider.token.backgroundTransparent0)
                        .frame(height: 34)
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
    ], selectedIndex: .constant(0))
}
