import SwiftUI
import Warp

struct MenuDemoView: View {
    @State private var lastAction: String = "None"
    @State private var selectedStyle: Warp.MenuButtonStyle = .default
    @State private var selectedIcon: Warp.Icon = .share
    @State private var showIconPicker = false

    var body: some View {
        Form {
            Section("Last Action") {
                Warp.Text(lastAction, style: .body)
                    .foregroundColor(Warp.Token.textSubtle)
            }

            Section("Menu Button Styles") {
                HStack(spacing: 12) {
                    Warp.Text("Default:", style: .bodyStrong)
                    Spacer()
                    Menu("Options") {
                        menuItems
                    }
                    .warpMenuButton(style: .default)
                }

                HStack(spacing: 12) {
                    Warp.Text("Primary:", style: .bodyStrong)
                    Spacer()
                    Menu("Actions") {
                        menuItems
                    }
                    .warpMenuButton(style: .primary)
                }

                HStack(spacing: 12) {
                    Warp.Text("Destructive:", style: .bodyStrong)
                    Spacer()
                    Menu("Danger zone") {
                        menuItems
                    }
                    .warpMenuButton(style: .destructive)
                }
            }

            Section("Menu with Warp Icons") {
                HStack(spacing: 12) {
                    Warp.Text("Icon label:", style: .bodyStrong)
                    Spacer()
                    Menu {
                        menuItemsWithIcons
                    } label: {
                        Label("More", systemImage: "ellipsis.circle")
                    }
                    .warpMenuButton()
                }
            }

            Section("Context Menu (long press card)") {
                contextMenuCard
            }

            Section("Icon Picker Menu") {
                HStack {
                    Warp.Text("Selected icon:", style: .bodyStrong)
                    Spacer()
                    Menu {
                        ForEach(iconPickerOptions, id: \.self) { icon in
                            Warp.MenuItem(String(describing: icon), icon: icon) {
                                selectedIcon = icon
                                record("Selected icon: \(icon)")
                            }
                        }
                    } label: {
                        HStack(spacing: 6) {
                            Warp.IconView(selectedIcon, size: .default)
                            Warp.Text(String(describing: selectedIcon), style: .body)
                        }
                    }
                    .warpMenuButton()
                }
            }
        }
        .navigationTitle("Menu / Context Menu")
        .navigationBarTitleDisplayMode(.inline)
    }

    // MARK: - Menu Content

    @ViewBuilder
    private var menuItems: some View {
        Warp.MenuItem("Edit") { record("Edit tapped") }
        Warp.MenuItem("Bookmark") { record("Bookmark tapped") }
        Warp.MenuItem("Delete", role: .destructive) { record("Delete tapped") }
    }

    @ViewBuilder
    private var menuItemsWithIcons: some View {
        Warp.MenuItem("Share", icon: .share) { record("Share tapped") }
        Warp.MenuItem("Bookmark", icon: .bookmark) { record("Bookmark tapped") }
        Warp.MenuItem("Edit", icon: .edit) { record("Edit tapped") }
        Warp.MenuItem("Copy", icon: .copy) { record("Copy tapped") }
        Divider()
        Warp.MenuItem("Archive", icon: .archiveBox) { record("Archive tapped") }
        Warp.MenuItem("Delete", icon: .heartRate, role: .destructive) { record("Delete tapped") }
    }

    // MARK: - Context Menu Card

    private var contextMenuCard: some View {
        VStack(alignment: .leading, spacing: 8) {
            Warp.Text("Long-press to open context menu", style: .bodyStrong)
            Warp.Text("This card supports context menu with Warp icons", style: .detail)
                .foregroundColor(Warp.Token.textSubtle)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Warp.Token.surfaceElevated100)
        .cornerRadius(8)
        .contextMenu {
            Warp.MenuItem("Share", icon: .share) { record("Context: Share") }
            Warp.MenuItem("Bookmark", icon: .bookmark) { record("Context: Bookmark") }
            Warp.MenuItem("Add to favourites", icon: .heartFilled) { record("Context: Favourite") }
            Divider()
            Warp.MenuItem("Report", icon: .warningFilled) { record("Context: Report") }
            Warp.MenuItem("Delete", icon: .heartRate, role: .destructive) { record("Context: Delete") }
        }
    }

    // MARK: - Helpers

    private let iconPickerOptions: [Warp.Icon] = [
        .share, .bookmark, .edit, .copy, .heart, .heartFilled, .archiveBox, .shareIOS, .starFull, .starEmpty
    ]

    private func record(_ action: String) {
        lastAction = action
    }
}

#Preview {
    NavigationStack {
        MenuDemoView()
    }
}
