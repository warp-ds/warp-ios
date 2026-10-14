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
    @State private var isPinnedToNavbar = false

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
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    withAnimation { isPinnedToNavbar.toggle() }
                } label: {
                    Image(systemName: isPinnedToNavbar ? "pin.fill" : "pin")
                }
            }
        }
        .safeAreaInset(edge: .top) {
            if isPinnedToNavbar {
                Warp.SegmentedControl(
                    items: items.map { .init(identifier: $0.identifier, title: $0.title, badge: $0.badge) },
                    selectedIdentifier: $selectedIdentifier
                )
                .padding(.horizontal, Warp.Spacing.spacing200)
                .padding(.vertical, Warp.Spacing.spacing100)
                .background(.bar)
            }
        }
    }

    private var colorBackground: some View {
        ZStack {
            Color(red: 0.04, green: 0.0, blue: 0.08)

            Ellipse()
                .fill(Color(red: 1.0, green: 0.08, blue: 0.18))
                .frame(width: 190, height: 110)
                .offset(x: -100, y: -10)
            Ellipse()
                .fill(Color(red: 1.0, green: 0.52, blue: 0.0))
                .frame(width: 170, height: 100)
                .offset(x: -30, y: 15)
            Ellipse()
                .fill(Color(red: 0.9, green: 0.92, blue: 0.0))
                .frame(width: 150, height: 90)
                .offset(x: 20, y: -15)
            Ellipse()
                .fill(Color(red: 0.08, green: 0.88, blue: 0.32))
                .frame(width: 170, height: 100)
                .offset(x: 70, y: 10)
            Ellipse()
                .fill(Color(red: 0.04, green: 0.42, blue: 1.0))
                .frame(width: 170, height: 100)
                .offset(x: 130, y: -10)
            Ellipse()
                .fill(Color(red: 0.52, green: 0.04, blue: 0.96))
                .frame(width: 190, height: 110)
                .offset(x: 180, y: 10)
        }
        .blur(radius: 24)
        .overlay(alignment: .bottom) {
            LinearGradient(
                colors: [.black.opacity(0.35), .clear],
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
