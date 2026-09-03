import SwiftUI
import Warp

struct GlassCapsuleSegmentedControlDemoView: View {

    struct ItemConfig: Identifiable {
        let id = UUID()
        var identifier: String
        var title: String
    }

    @State private var items: [ItemConfig] = [
        ItemConfig(identifier: "trending", title: "Trending"),
        ItemConfig(identifier: "new", title: "New"),
        ItemConfig(identifier: "popular", title: "Popular"),
        ItemConfig(identifier: "nearby", title: "Nearby"),
        ItemConfig(identifier: "saved", title: "Saved"),
    ]
    @State private var selectedIdentifier: String? = "trending"

    var body: some View {
        Form {
            Section("Demo") {
                ZStack {
                    LinearGradient(
                        colors: [.blue.opacity(0.25), .purple.opacity(0.35)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    .ignoresSafeArea()

                    Warp.GlassCapsuleSegmentedControl(
                        items: items.map { .init(id: $0.identifier, title: $0.title) },
                        selectedID: $selectedIdentifier
                    )
                    .padding(.horizontal, Warp.Spacing.spacing200)
                    .padding(.vertical, Warp.Spacing.spacing200)
                }
                .listRowInsets(EdgeInsets())

                if let selected = selectedIdentifier {
                    LabeledContent("Selected", value: selected)
                } else {
                    LabeledContent("Selected", value: "none")
                }
            }

            Section {
                Picker("Selected", selection: $selectedIdentifier) {
                    Text("none").tag(String?.none)
                    ForEach(items) { item in
                        Text(item.title).tag(String?.some(item.identifier))
                    }
                }
            } header: {
                Text("Selection")
            }

            Section {
                ForEach($items) { $item in
                    itemEditor(item: $item)
                }
                .onMove { items.move(fromOffsets: $0, toOffset: $1) }
                .onDelete { items.remove(atOffsets: $0) }
            } header: {
                HStack {
                    Text("Items: \(items.count)")
                    Spacer()
                    EditButton()
                }
            }

            Section {
                Button("Add item") {
                    let n = items.count + 1
                    withAnimation {
                        items.append(ItemConfig(identifier: "item\(n)", title: "Item \(n)"))
                    }
                }
            }
        }
        .navigationTitle("Glass Capsule Segmented Control")
        .navigationBarTitleDisplayMode(.inline)
    }

    @ViewBuilder
    private func itemEditor(item: Binding<ItemConfig>) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            labeledTextField("Identifier:", text: item.identifier)
            labeledTextField("Title:", text: item.title)
        }
        .padding(.vertical, 2)
    }

    private func labeledTextField(_ label: String, text: Binding<String>) -> some View {
        HStack {
            Text(label)
                .foregroundColor(.secondary)
                .frame(width: 80, alignment: .leading)
            TextField("", text: text)
        }
    }
}

#Preview {
    NavigationStack {
        GlassCapsuleSegmentedControlDemoView()
    }
}
