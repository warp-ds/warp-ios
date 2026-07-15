import SwiftUI
import Warp

struct MenuDemoView: View {

    struct ItemConfig: Identifiable {
        let id = UUID()
        var title: String = "Item"
        var icon: Warp.Icon = .share
        var showIcon: Bool = true
        var isDestructive: Bool = false
    }

    @State private var items: [ItemConfig] = []
    @State private var menuStyle: Warp.MenuButtonStyle = .default
    @State private var menuLabel: String = "Options"

    var body: some View {
        Form {
            Section("Demo") {
                HStack {
                    Text("Menu")
                    Spacer()
                    Menu(menuLabel) {
                        ForEach(items) { item in
                            Warp.MenuItem(
                                item.title,
                                icon: item.showIcon ? item.icon : nil,
                                role: item.isDestructive ? .destructive : nil
                            ) {}
                        }
                    }
                    .warpMenuButton(style: menuStyle)
                }

                contextMenuCard
            }

            Section("Menu Label") {
                TextFieldWithClear(label: "Label:", text: $menuLabel)

                Picker("Style", selection: $menuStyle) {
                    Text("Default").tag(Warp.MenuButtonStyle.default)
                    Text("Primary").tag(Warp.MenuButtonStyle.primary)
                    Text("Destructive").tag(Warp.MenuButtonStyle.destructive)
                }
                .pickerStyle(.segmented)
            }

            Section {
                ForEach($items) { $item in
                    VStack(alignment: .leading, spacing: 8) {
                        TextFieldWithClear(label: "Title:", text: $item.title)

                        Toggle("Show Icon", isOn: $item.showIcon)

                        if item.showIcon {
                            HStack {
                                Text("Icon")
                                    .foregroundColor(.secondary)
                                Spacer()
                                iconMenuButton(icon: $item.icon)
                            }
                            .transition(.opacity.combined(with: .move(edge: .top)))
                        }

                        Toggle("Destructive", isOn: $item.isDestructive)
                    }
                    .animation(.easeInOut(duration: 0.2), value: item.showIcon)
                    .padding(.vertical, 4)
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
                Button("Add menu item") {
                    withAnimation {
                        items.append(ItemConfig())
                    }
                }
            }
        }
        .navigationTitle("Menu / Context Menu")
        .navigationBarTitleDisplayMode(.inline)
    }

    // MARK: - Context Menu Card

    private var contextMenuCard: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Context menu (long press)")
                .font(Warp.Typography.bodyStrong.font)
            Text("Uses same items as menu above")
                .font(Warp.Typography.detail.font)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color(UIColor.secondarySystemGroupedBackground))
        .cornerRadius(8)
        .contextMenu {
            ForEach(items) { item in
                Warp.MenuItem(
                    item.title,
                    icon: item.showIcon ? item.icon : nil,
                    role: item.isDestructive ? .destructive : nil
                ) {}
            }
        }
    }

    // MARK: - Icon Picker

    private func iconMenuButton(icon: Binding<Warp.Icon>) -> some View {
        Menu {
            ForEach(Warp.Icon.allCases, id: \.self) { iconOption in
                Button(action: {
                    icon.wrappedValue = iconOption
                }) {
                    HStack {
                        Image(uiImage: iconOption.uiImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                        Text(String(describing: iconOption))
                            .lineLimit(1)
                    }
                }
            }
        } label: {
            HStack {
                Image(uiImage: icon.wrappedValue.uiImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                Text(String(describing: icon.wrappedValue))
                    .lineLimit(1)
                    .truncationMode(.middle)
            }
        }
    }
}

private struct TextFieldWithClear: View {
    let label: String
    @Binding var text: String

    var body: some View {
        HStack {
            Text(label)
                .foregroundColor(.secondary)
            TextField("", text: $text)
            if !text.isEmpty {
                Button(action: { text = "" }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.secondary)
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
