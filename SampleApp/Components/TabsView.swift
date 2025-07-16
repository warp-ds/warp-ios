import SwiftUI
import Warp

struct TabsView: View {
    @State private var hasIcons = true
    @State private var isScrollable = true
    @State private var selectedIndex: Int = 0
    private let tabItems: [Warp.TabItem] = [
        Warp.TabItem(title: "Tab 1", icon: .listSort),
        Warp.TabItem(title: "Longer Tab Title", icon: .listSort),
        Warp.TabItem(title: "Tab 3", icon: .listSort),
        Warp.TabItem(title: "Tab 4", icon: .listSort)
    ]
    
    var body: some View {
        VStack {
            Warp.Tabs(
                tabs: tabItems.map { hasIcons ? $0 : .init(title: $0.title) },
                selectedIndex: $selectedIndex,
                scrollable: isScrollable
            )

            // Controls to toggle tab appearance and behaviour
            GroupBox {
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        Text("Show Icon")
                        Spacer()
                        Warp.Switch(isOn: $hasIcons)
                    }

                    HStack {
                        Text("Scrollable")
                        Spacer()
                        Warp.Switch(isOn: $isScrollable)
                    }
                }
                .padding(.vertical, 16)
            } label: {
                Text("Modify Tabs")
            }
        }
        .onChange(of: selectedIndex) { _ in
            print("Selected Index: \(selectedIndex)")
        }
        .padding(.horizontal)
        .navigationTitle("Tabs")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    TabsView()
}
