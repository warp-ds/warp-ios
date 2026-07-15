import SwiftUI
import Warp

struct SheetDemoView: View {

    @State private var title: String = "Sheet Title"
    @State private var subtitle: String = ""
    @State private var sheetStyle: Warp.SheetStyle = .medium
    @State private var useLargeTitle: Bool = false
    @State private var showBackButton: Bool = true
    @State private var showActionButton: Bool = true
    @State private var actionIcon: Warp.Icon = .edit
    @State private var showSheet: Bool = false

    var body: some View {
        Form {
            Section("Demo") {
                Button("Present Sheet") {
                    showSheet = true
                }
            }

            Section("Sheet Style") {
                Picker("Style", selection: $sheetStyle) {
                    Text("Medium").tag(Warp.SheetStyle.medium)
                    Text("Full Screen").tag(Warp.SheetStyle.fullScreen)
                }
                .pickerStyle(.segmented)
            }

            Section("Navigation Bar") {
                TextFieldWithClear(label: "Title:", text: $title)
                TextFieldWithClear(label: "Subtitle:", text: $subtitle)
                Toggle("Large Title", isOn: $useLargeTitle)
                Toggle("Back Button", isOn: $showBackButton)
                Toggle("Action Button", isOn: $showActionButton)
                if showActionButton {
                    HStack {
                        Text("Action Icon")
                        Spacer()
                        iconMenuButton(icon: $actionIcon)
                    }
                }
            }
        }
        .navigationTitle("Sheet")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showSheet) {
            SheetContentView(
                title: title,
                subtitle: subtitle,
                sheetStyle: sheetStyle,
                useLargeTitle: useLargeTitle,
                showBackButton: showBackButton,
                showActionButton: showActionButton,
                actionIcon: actionIcon,
                isPresented: $showSheet
            )
            .warpSheetStyle(sheetStyle)
        }
    }

    private func iconMenuButton(icon: Binding<Warp.Icon>) -> some View {
        Menu {
            ForEach(Warp.Icon.allCases, id: \.self) { iconOption in
                Button {
                    icon.wrappedValue = iconOption
                } label: {
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

private struct SheetContentView: View {

    let title: String
    let subtitle: String
    let sheetStyle: Warp.SheetStyle
    let useLargeTitle: Bool
    let showBackButton: Bool
    let showActionButton: Bool
    let actionIcon: Warp.Icon
    @Binding var isPresented: Bool

    @State private var showNestedSheet: Bool = false
    @State private var nestedDepth: Int = 1

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: Warp.Spacing.spacing200) {
                    ForEach(1...25, id: \.self) { index in
                        Button {
                            nestedDepth = index
                            showNestedSheet = true
                        } label: {
                            Warp.Text("Content row \(index) — tap for nested sheet", style: .body)
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color(UIColor.systemGray6))
                                .cornerRadius(Warp.Spacing.spacing100)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(useLargeTitle ? .large : .inline)
            .apply { view in
                if #available(iOS 26.0, *), !subtitle.isEmpty {
                    view.navigationSubtitle(subtitle)
                } else {
                    view
                }
            }
            .toolbar {
                if showBackButton {
                    ToolbarItem(placement: .topBarLeading) {
                        Button {
                            isPresented = false
                        } label: {
                            Warp.IconView(.chevronLeft, size: .default)
                        }
                    }
                }
                if showActionButton {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                        } label: {
                            Warp.IconView(actionIcon, size: .default)
                        }
                    }
                }
            }
            .sheet(isPresented: $showNestedSheet) {
                NestedSheetView(depth: nestedDepth, actionIcon: actionIcon)
                    .warpSheetStyle(.medium)
            }
        }
    }
}

private struct NestedSheetView: View {

    let depth: Int
    let actionIcon: Warp.Icon

    @Environment(\.dismiss) private var dismiss
    @State private var showNextSheet: Bool = false

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: Warp.Spacing.spacing200) {
                    ForEach(1...10, id: \.self) { index in
                        Button {
                            showNextSheet = true
                        } label: {
                            Warp.Text("Nested row \(index) — tap for another sheet", style: .body)
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color(UIColor.systemGray6))
                                .cornerRadius(Warp.Spacing.spacing100)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Sheet (level \(depth + 1))")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Warp.IconView(.chevronLeft, size: .default)
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {} label: {
                        Warp.IconView(actionIcon, size: .default)
                    }
                }
            }
            .sheet(isPresented: $showNextSheet) {
                NestedSheetView(depth: depth + 1, actionIcon: actionIcon)
                    .warpSheetStyle(.medium)
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

private extension View {
    @ViewBuilder
    func apply<T: View>(@ViewBuilder transform: (Self) -> T) -> some View {
        transform(self)
    }
}
