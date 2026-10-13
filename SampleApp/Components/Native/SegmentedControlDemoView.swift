import SwiftUI
import Warp

struct SegmentedControlDemoView: View {

    struct ItemConfig: Identifiable {
        let id = UUID()
        var identifier: String
        var title: String
        var badge: Int?
    }

    @State private var items: [ItemConfig] = [
        ItemConfig(identifier: "trending", title: "Trending", badge: 3),
        ItemConfig(identifier: "new", title: "New", badge: 0),
        ItemConfig(identifier: "popular", title: "Popular"),
        ItemConfig(identifier: "nearby", title: "Nearby", badge: 42),
        ItemConfig(identifier: "saved", title: "Saved"),
    ]
    @State private var selectedIdentifier: String? = "trending"

    var body: some View {
        Form {
            Section("Translucency") {
                ZStack(alignment: .center) {
                    colorBackground
                    VStack(spacing: Warp.Spacing.spacing200) {
                        VStack(spacing: Warp.Spacing.spacing100) {
                            Text("Warp")
                                .font(.caption.bold())
                                .foregroundStyle(.white)
                            Warp.SegmentedControl(
                                items: items.map { .init(identifier: $0.identifier, title: $0.title, badge: $0.badge) },
                                selectedIdentifier: $selectedIdentifier
                            )
                            .padding(.horizontal, Warp.Spacing.spacing200)
                        }

                        VStack(spacing: Warp.Spacing.spacing100) {
                            Text("Standard")
                                .font(.caption.bold())
                                .foregroundStyle(.white)
                            Picker("", selection: Binding(
                                get: { selectedIdentifier ?? "" },
                                set: { selectedIdentifier = $0 }
                            )) {
                                ForEach(items) { item in
                                    Text(item.title).tag(item.identifier)
                                }
                            }
                            .pickerStyle(.segmented)
                            .padding(.horizontal, Warp.Spacing.spacing200)
                        }
                    }
                    .padding(.vertical, Warp.Spacing.spacing400)
                }
                .listRowInsets(EdgeInsets())
                .listRowBackground(Color.clear)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            }

            Section("Demo") {
                Warp.SegmentedControl(
                    items: items.map { .init(identifier: $0.identifier, title: $0.title, badge: $0.badge) },
                    selectedIdentifier: $selectedIdentifier
                )
                .padding(.horizontal, Warp.Spacing.spacing200)
                .listRowInsets(EdgeInsets(top: 12, leading: 0, bottom: 12, trailing: 0))

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
                        items.append(ItemConfig(identifier: "item\(n)", title: "Item \(n)", badge: nil))
                    }
                }
            }
        }
        .navigationTitle("Segmented Control")
        .navigationBarTitleDisplayMode(.inline)
    }

    private var colorBackground: some View {
        HStack(spacing: 0) {
            Color(red: 0.9, green: 0.2, blue: 0.2)
            Color(red: 1.0, green: 0.6, blue: 0.0)
            Color(red: 0.2, green: 0.7, blue: 0.3)
            Color(red: 0.1, green: 0.4, blue: 0.9)
            Color(red: 0.6, green: 0.1, blue: 0.8)
        }
        .overlay(alignment: .bottom) {
            LinearGradient(
                colors: [.black.opacity(0.3), .clear],
                startPoint: .bottom,
                endPoint: .top
            )
            .frame(height: 60)
        }
    }

    @ViewBuilder
    private func itemEditor(item: Binding<ItemConfig>) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            labeledTextField("Identifier:", text: item.identifier)
            labeledTextField("Title:", text: item.title)
            badgeEditor(badge: item.badge)
        }
        .padding(.vertical, 2)
    }

    private func badgeEditor(badge: Binding<Int?>) -> some View {
        HStack {
            Text("Badge:")
                .foregroundColor(.secondary)
                .frame(width: 80, alignment: .leading)

            Picker("", selection: Binding(
                get: { badge.wrappedValue != nil },
                set: { badge.wrappedValue = $0 ? 0 : nil }
            )) {
                Text("Off").tag(false)
                Text("On").tag(true)
            }
            .pickerStyle(.segmented)
            .frame(width: 100)

            if let current = badge.wrappedValue {
                Stepper(
                    "\(current)",
                    value: Binding(
                        get: { current },
                        set: { badge.wrappedValue = max(0, $0) }
                    ),
                    in: 0...999
                )
            }
        }
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
        SegmentedControlDemoView()
    }
}
