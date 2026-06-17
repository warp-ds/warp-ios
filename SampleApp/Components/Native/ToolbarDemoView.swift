import SwiftUI
import Warp

struct ToolbarDemoView: View {

    struct ToolbarItemConfig: Identifiable {
        let id = UUID()
        var style: Warp.ToolbarItemStyle
        var display: ItemDisplay
        var icon: Warp.Icon
        var text: String
        var group: Int = 0
        var isEnabled: Bool = true
    }

    enum ItemDisplay: String, CaseIterable {
        case icon = "Icon"
        case text = "Text"
    }

    @State private var navigationTitle: String = "Custom View"
    @State private var navigationSubtitle: String = ""
    @State private var showLargeTitle: Bool = true
    @State private var toolbarItems: [ToolbarItemConfig] = []
    @State private var showDemo: Bool = false

    private var uniqueGroups: Int {
        Set(toolbarItems.map { $0.group }).count
    }

    var body: some View {
        Form {
            Section("Demo") {
                Button("Go to Custom Navigation View") {
                    showDemo = true
                }
                .fullScreenCover(isPresented: $showDemo) {
                    NavigationStack {
                        ToolbarCustomView(
                            title: navigationTitle,
                            subtitle: navigationSubtitle,
                            showLargeTitle: showLargeTitle,
                            toolbarItems: toolbarItems
                        )
                    }
                }
            }

            Section("Navigation Title & Subtitle") {
                TextFieldWithClear(label: "Title:", text: $navigationTitle)
                TextFieldWithClear(label: "Subtitle:", text: $navigationSubtitle)
                Toggle("Show Large Title", isOn: $showLargeTitle)
            }

            Section {
                ForEach($toolbarItems) { $item in
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Toggle("Enabled", isOn: $item.isEnabled)
                            Spacer()
                        }

                        HStack {
                            Text("Group:")
                                .foregroundColor(.secondary)
                            Picker("Group", selection: $item.group) {
                                ForEach(0..<5) { groupNumber in
                                    Text("\(groupNumber)").tag(groupNumber)
                                }
                            }
                            .pickerStyle(.segmented)
                            .labelsHidden()
                        }

                        Picker("Style", selection: $item.style) {
                            Text("Default").tag(Warp.ToolbarItemStyle.default)
                            Text("Primary").tag(Warp.ToolbarItemStyle.primary)
                        }
                        .pickerStyle(.segmented)

                        Picker("Display", selection: $item.display) {
                            ForEach(ItemDisplay.allCases, id: \.self) { option in
                                Text(option.rawValue).tag(option)
                            }
                        }
                        .pickerStyle(.segmented)

                        if item.display == .icon {
                            HStack {
                                Text("Icon")
                                Spacer()
                                iconMenuButton(icon: $item.icon)
                            }
                            .transition(.opacity.combined(with: .move(edge: .top)))
                        } else {
                            HStack {
                                TextFieldWithClear(label: "Text:", text: $item.text)
                            }
                            .transition(.opacity.combined(with: .move(edge: .top)))
                        }
                    }
                    .animation(.easeInOut(duration: 0.2), value: item.display)
                    .padding(.vertical, 4)
                    .opacity(item.isEnabled ? 1.0 : 0.5)
                }
                .onMove { toolbarItems.move(fromOffsets: $0, toOffset: $1) }
                .onDelete { toolbarItems.remove(atOffsets: $0) }
            } header: {
                HStack {
                    Text("Buttons: \(toolbarItems.count) | Groups: \(uniqueGroups)")
                    Spacer()
                    EditButton()
                }
            }

            Section {
                Button("Add navbar button") {
                    withAnimation {
                        toolbarItems.append(ToolbarItemConfig(
                            style: .default,
                            display: .icon,
                            icon: .check,
                            text: "Button",
                            group: 0
                        ))
                    }
                }
            }
        }
        .navigationTitle("Navigation setup")
    }

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

private struct ToolbarCustomView: View {
    let title: String
    let subtitle: String
    let showLargeTitle: Bool
    let toolbarItems: [ToolbarDemoView.ToolbarItemConfig]

    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(1...25, id: \.self) { index in
                    Warp.Text("Lorem ipsum row \(index)", style: .body)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(8)
                }
            }
            .padding()
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(showLargeTitle ? .large : .inline)
        .apply { view in
            if #available(iOS 26.0, *), !subtitle.isEmpty {
                view.navigationSubtitle(subtitle)
            } else {
                view
            }
        }
        .toolbar {
            // Render enabled items explicitly (ToolbarContentBuilder doesn't support ForEach)
            toolbarContent
        }
    }

    @ToolbarContentBuilder
    private var toolbarContent: some ToolbarContent {
        // Hardcoded dismiss button on the left
        Warp.ToolbarItem(
            title: nil,
            icon: .close,
            placement: .topBarLeading,
            style: .default
        ) {
            dismiss()
        }

        // Get enabled items only (all go on the right)
        let enabledItems = toolbarItems.filter { $0.isEnabled }

        // Explicitly render each enabled item with group spacing (max 6 shown on trailing side)
        if enabledItems.indices.contains(0) {
            makeToolbarItem(enabledItems[0])
        }

        if enabledItems.indices.contains(1) {
            if enabledItems[0].group != enabledItems[1].group, #available(iOS 26.0, *) {
                ToolbarSpacer(.fixed, placement: .topBarTrailing)
            }
            makeToolbarItem(enabledItems[1])
        }

        if enabledItems.indices.contains(2) {
            if enabledItems[1].group != enabledItems[2].group, #available(iOS 26.0, *) {
                ToolbarSpacer(.fixed, placement: .topBarTrailing)
            }
            makeToolbarItem(enabledItems[2])
        }

        if enabledItems.indices.contains(3) {
            if enabledItems[2].group != enabledItems[3].group, #available(iOS 26.0, *) {
                ToolbarSpacer(.fixed, placement: .topBarTrailing)
            }
            makeToolbarItem(enabledItems[3])
        }

        if enabledItems.indices.contains(4) {
            if enabledItems[3].group != enabledItems[4].group, #available(iOS 26.0, *) {
                ToolbarSpacer(.fixed, placement: .topBarTrailing)
            }
            makeToolbarItem(enabledItems[4])
        }

        if enabledItems.indices.contains(5) {
            if enabledItems[4].group != enabledItems[5].group, #available(iOS 26.0, *) {
                ToolbarSpacer(.fixed, placement: .topBarTrailing)
            }
            makeToolbarItem(enabledItems[5])
        }
    }

    @ToolbarContentBuilder
    private func makeToolbarItem(_ item: ToolbarDemoView.ToolbarItemConfig) -> some ToolbarContent {
        let titleToShow: String? = item.display == .text ? item.text : nil
        let iconToShow: Warp.Icon? = item.display == .icon ? item.icon : nil

        Warp.ToolbarItem(
            title: titleToShow,
            icon: iconToShow,
            placement: .topBarTrailing,
            style: item.style
        ) {
            // Action placeholder - all trailing items perform no action in demo
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

private extension View {
    @ViewBuilder
    func apply<T: View>(@ViewBuilder transform: (Self) -> T) -> some View {
        transform(self)
    }
}
