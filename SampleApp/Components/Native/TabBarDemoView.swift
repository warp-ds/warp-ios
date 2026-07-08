import SwiftUI
import Warp

struct TabBarDemoView: View {
    // Same tabs as the ios-app main tab bar.
    private static let tabNames = ["Frontpage", "Notifications", "New ad", "Messages", "My page"]

    // Seeded to mirror the real app: Notifications shows a dot, Messages a count.
    @State private var badges: [Int: DemoTabBadge] = [1: .dot, 3: .count(3)]
    @State private var selectedTab = 0
    @State private var count = 1

    var body: some View {
        VStack(spacing: 16) {
            Picker("Tab", selection: $selectedTab) {
                ForEach(Array(Self.tabNames.enumerated()), id: \.offset) { index, name in
                    Text(name).tag(index)
                }
            }
            .pickerStyle(.segmented)

            Stepper("Count: \(count)", value: $count, in: 1...150)

            HStack(spacing: 8) {
                Warp.Button(title: "Add count", action: { badges[selectedTab] = .count(count) }, fullWidth: true)
                Warp.Button(title: "Add dot", action: { badges[selectedTab] = .dot }, fullWidth: true)
            }
            Warp.Button(title: "Remove badge", action: { badges[selectedTab] = nil }, type: .critical, fullWidth: true)

            WarpTabBarControllerWrapper(badges: badges)
                .ignoresSafeArea(edges: .bottom)
        }
        .padding()
        .navigationTitle("Bottom nav / Tab Bar")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        TabBarDemoView()
    }
}
