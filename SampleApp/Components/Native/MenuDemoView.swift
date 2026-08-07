import SwiftUI
import Warp

struct MenuDemoView: View {

    struct ButtonConfig: Identifiable {
        let id = UUID()
        var title = "Item"
        var icon: Warp.Icon = .share
        var showIcon = true
        var isDestructive = false
    }

    struct SubMenuConfig: Identifiable {
        let id = UUID()
        var title = "Submenu"
        var icon: Warp.Icon = .dots
        var showIcon = true
        var items: [ButtonConfig] = []
    }

    enum Entry: Identifiable {
        case button(ButtonConfig)
        case submenu(SubMenuConfig)

        var id: UUID {
            switch self {
            case .button(let c): return c.id
            case .submenu(let c): return c.id
            }
        }
    }

    @State private var entries: [Entry] = [
        .button(ButtonConfig(title: "Share", icon: .share, showIcon: true)),
        .submenu(SubMenuConfig(title: "More", icon: .dots, showIcon: true, items: [
            ButtonConfig(title: "Bookmark", icon: .bookmark, showIcon: true),
            ButtonConfig(title: "Archive", icon: .archiveBox, showIcon: true)
        ])),
        .button(ButtonConfig(title: "Delete", icon: .bin, showIcon: true, isDestructive: true))
    ]
    @State private var menuLabel = "Options"

    var body: some View {
        Form {
            Section("Demo") {
                HStack {
                    Text("Menu")
                    Spacer()
                    Warp.Menu(menuLabel) {
                        ForEach(entries) { entry in
                            menuEntryView(entry)
                        }
                    }
                }
                contextMenuCard
            }

            Section("Menu Label") {
                TextFieldWithClear(label: "Label:", text: $menuLabel)
            }

            Section {
                ForEach(Array(entries.enumerated()), id: \.element.id) { i, _ in
                    entryEditor(at: i)
                }
                .onMove { entries.move(fromOffsets: $0, toOffset: $1) }
                .onDelete { entries.remove(atOffsets: $0) }
            } header: {
                HStack {
                    Text("Entries: \(entries.count)")
                    Spacer()
                    EditButton()
                }
            }

            Section {
                Button("Add item") {
                    withAnimation { entries.append(.button(ButtonConfig())) }
                }
                Button("Add submenu") {
                    withAnimation { entries.append(.submenu(SubMenuConfig())) }
                }
            }
        }
        .navigationTitle("Menu / Context Menu")
        .navigationBarTitleDisplayMode(.inline)
    }

    // MARK: - Menu rendering

    @ViewBuilder
    private func menuEntryView(_ entry: Entry) -> some View {
        switch entry {
        case .button(let config):
            Warp.MenuButton(
                config.title,
                icon: config.showIcon ? config.icon : nil,
                style: config.isDestructive ? .destructive : .default
            ) {}
        case .submenu(let config):
            Warp.Menu(config.title, icon: config.showIcon ? config.icon : nil) {
                ForEach(config.items) { item in
                    Warp.MenuButton(
                        item.title,
                        icon: item.showIcon ? item.icon : nil,
                        style: item.isDestructive ? .destructive : .default
                    ) {}
                }
            }
        }
    }

    // MARK: - Context Menu Card

    private var contextMenuCard: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Context menu (long press)")
                .font(Warp.Typography.bodyStrong.font)
            Text("Uses leaf items from the menu above")
                .font(Warp.Typography.detail.font)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color(UIColor.secondarySystemGroupedBackground))
        .cornerRadius(8)
        .contextMenu {
            ForEach(entries) { entry in
                if case .button(let config) = entry {
                    Warp.MenuButton(
                        config.title,
                        icon: config.showIcon ? config.icon : nil,
                        style: config.isDestructive ? .destructive : .default
                    ) {}
                }
            }
        }
    }

    // MARK: - Entry editors

    @ViewBuilder
    private func entryEditor(at i: Int) -> some View {
        switch entries[i] {
        case .button:
            buttonEditor(at: i)
        case .submenu:
            subMenuEditor(at: i)
        }
    }

    @ViewBuilder
    private func buttonEditor(at i: Int) -> some View {
        let config = buttonBinding(at: i)
        VStack(alignment: .leading, spacing: 8) {
            TextFieldWithClear(label: "Title:", text: config.title)
            Toggle("Show Icon", isOn: config.showIcon)
            if config.wrappedValue.showIcon {
                HStack {
                    Text("Icon").foregroundColor(.secondary)
                    Spacer()
                    iconPicker(icon: config.icon)
                }
            }
            Toggle("Destructive", isOn: config.isDestructive)
        }
        .padding(.vertical, 4)
    }

    @ViewBuilder
    private func subMenuEditor(at i: Int) -> some View {
        let config = subMenuBinding(at: i)
        DisclosureGroup {
            VStack(alignment: .leading, spacing: 8) {
                TextFieldWithClear(label: "Title:", text: config.title)
                Toggle("Show Icon", isOn: config.showIcon)
                if config.wrappedValue.showIcon {
                    HStack {
                        Text("Icon").foregroundColor(.secondary)
                        Spacer()
                        iconPicker(icon: config.icon)
                    }
                }
            }
            .padding(.vertical, 4)

            ForEach(config.wrappedValue.items.indices, id: \.self) { j in
                let item = itemBinding(subMenuIndex: i, itemIndex: j)
                VStack(alignment: .leading, spacing: 6) {
                    HStack {
                        Image(systemName: "arrow.turn.down.right")
                            .foregroundColor(.secondary)
                            .font(.caption)
                        Text("Item \(j + 1)")
                            .font(Warp.Typography.detailStrong.font)
                            .foregroundColor(.secondary)
                    }
                    TextFieldWithClear(label: "Title:", text: item.title)
                    Toggle("Show Icon", isOn: item.showIcon)
                    if item.wrappedValue.showIcon {
                        HStack {
                            Text("Icon").foregroundColor(.secondary)
                            Spacer()
                            iconPicker(icon: item.icon)
                        }
                    }
                    Toggle("Destructive", isOn: item.isDestructive)
                    if config.wrappedValue.items.count > 1 {
                        Button("Remove item", role: .destructive) {
                            config.wrappedValue.items.remove(at: j)
                        }
                    }
                }
                .padding(.vertical, 4)
            }

            Button("Add item to submenu") {
                config.wrappedValue.items.append(ButtonConfig())
            }
        } label: {
            Label {
                Text("Submenu: \(config.wrappedValue.title)")
                    .font(Warp.Typography.bodyStrong.font)
                    .foregroundColor(.primary)
            } icon: {
                Image(systemName: "chevron.right.2")
                    .foregroundColor(.secondary)
            }
        }
    }

    // MARK: - Bindings

    private func buttonBinding(at i: Int) -> Binding<ButtonConfig> {
        Binding(
            get: {
                guard case .button(let c) = entries[i] else { return ButtonConfig() }
                return c
            },
            set: { entries[i] = .button($0) }
        )
    }

    private func subMenuBinding(at i: Int) -> Binding<SubMenuConfig> {
        Binding(
            get: {
                guard case .submenu(let c) = entries[i] else { return SubMenuConfig() }
                return c
            },
            set: { entries[i] = .submenu($0) }
        )
    }

    private func itemBinding(subMenuIndex i: Int, itemIndex j: Int) -> Binding<ButtonConfig> {
        Binding(
            get: {
                guard case .submenu(let c) = entries[i] else { return ButtonConfig() }
                return c.items[j]
            },
            set: {
                guard case .submenu(var c) = entries[i] else { return }
                c.items[j] = $0
                entries[i] = .submenu(c)
            }
        )
    }

    // MARK: - Icon Picker

    private func iconPicker(icon: Binding<Warp.Icon>) -> some View {
        Menu {
            ForEach(Warp.Icon.allCases, id: \.self) { option in
                Button {
                    icon.wrappedValue = option
                } label: {
                    HStack {
                        Image(uiImage: option.uiImage)
                            .resizable().scaledToFit().frame(width: 20, height: 20)
                        Text(String(describing: option)).lineLimit(1)
                    }
                }
            }
        } label: {
            HStack {
                Image(uiImage: icon.wrappedValue.uiImage)
                    .resizable().scaledToFit().frame(width: 20, height: 20)
                Text(String(describing: icon.wrappedValue))
                    .lineLimit(1).truncationMode(.middle)
            }
        }
    }
}

private struct TextFieldWithClear: View {
    let label: String
    @Binding var text: String

    var body: some View {
        HStack {
            Text(label).foregroundColor(.secondary)
            TextField("", text: $text)
            if !text.isEmpty {
                Button { text = "" } label: {
                    Image(systemName: "xmark.circle.fill").foregroundColor(.secondary)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        MenuDemoView()
    }
}
