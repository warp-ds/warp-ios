import SwiftUI
import Warp

struct TabsView: View {
    @State private var hasIcons = true
    private let tabItems: [Warp.TabItem] = [
        Warp.TabItem(title: "Tab 1", icon: .listSort),
        Warp.TabItem(title: "Tab 2", icon: .listSort),
        Warp.TabItem(title: "Tab 3", icon: .listSort),
        Warp.TabItem(title: "Tab 4", icon: .listSort)
    ]
    
    var body: some View {
        VStack {
            Warp.Tabs(tabs: tabItems.map { hasIcons ? $0 : .init(title: $0.title) })
            .padding()
            
            // Controls to modify Switch's state
            GroupBox(content: {
                VStack(alignment: .leading) {
                    // Toggle Tabs Icon
                    HStack {
                        Text("Show Icon")
                        Spacer()
                        Warp.Switch(isOn: $hasIcons)
                    }
                    .padding(.top, 20)
                }
            }, label: {
                Text("Modify Tabs Icon")
            })
        }
        .padding(.horizontal)
        .navigationTitle("Tabs")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    SwitchView()
}
