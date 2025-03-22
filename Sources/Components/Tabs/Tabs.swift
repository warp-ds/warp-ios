import SwiftUI

extension Warp {
    /// A customizable tab view component with selectable tabs.
    /// This view allows users to navigate between multiple tabs, each represented by a title and an optional icon.
    /// The selected tab is highlighted, with an underline that changes color based on the selection state.
    ///
    /// - Parameters:
    ///   - tabs: An array of `TabItem` objects, each containing a title and an optional icon to display in the tab.
    ///   - selectedIndex: A binding to the index of the currently selected tab.
    ///   - scrollable: A boolean value indicating whether the tabs should be scrollable. Non-scrollable tabs will grow in size to fill the width of the parent view.
    public struct Tabs: View {
        public let tabs: [TabItem]
        @Binding private var selectedIndex: Int
        private let isScrollable: Bool
        private let colorProvider: ColorProvider = Warp.Color
        
        /// Initializes the Tabs view with an array of tabs and a binding for the selected index.
        ///
        /// - Parameters:
        ///   - tabs: An array of `TabItem` objects to display as selectable tabs.
        ///   - selectedIndex: A binding to the index of the currently selected tab. Updates to this binding will be observed by the view, triggering animations and layout changes.
        ///   - scrollable: A boolean value indicating whether the tabs should be scrollable. Defaults to `true`.
        public init(
            tabs: [TabItem],
            selectedIndex: Binding<Int>,
            scrollable: Bool = true
        ) {
            self.tabs = tabs
            self._selectedIndex = selectedIndex
            self.isScrollable = scrollable
        }
        
        public var body: some View {
            VStack(spacing: 0) {
                Group {
                    if isScrollable {
                        ScrollViewReader { scrollProxy in
                            ScrollView(.horizontal, showsIndicators: false) {
                                tabsView(scrollProxy: scrollProxy)
                            }
                        }
                    } else {
                        tabsView(scrollProxy: nil)
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

        private func tabsView(scrollProxy: ScrollViewProxy?) -> some View {
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
                                scrollProxy?.scrollTo(index, anchor: .center)
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
}

@available(iOS 17.0, *)
#Preview {
    @Previewable @State var selectedIndex1 = 0
    @Previewable @State var selectedIndex2 = 0

    VStack(spacing: 40) {
        Warp.Tabs(
            tabs: [
                Warp.TabItem(title: "Tab 1", icon: .listSort),
                Warp.TabItem(title: "Longer Tab Title", icon: .listSort),
                Warp.TabItem(title: "Tab 3", icon: .listSort),
                Warp.TabItem(title: "Tab 4", icon: .listSort)
            ],
            selectedIndex: $selectedIndex1,
            scrollable: true
        )

        Warp.Tabs(
            tabs: [
                Warp.TabItem(title: "Tab 1", icon: .listSort),
                Warp.TabItem(title: "Tab 2", icon: .listSort)
            ],
            selectedIndex: $selectedIndex2,
            scrollable: false
        )
    }
}
