import SwiftUI
import Warp

struct SheetDemoView: View {

    @State private var title: String = "Sheet Title"
    @State private var subtitle: String = ""
    @State private var sheetStyle: Warp.SheetStyle = .medium
    @State private var dragIndicator: Visibility = .visible
    @State private var backgroundOption: BackgroundOption = .automatic
    @State private var useLargeTitle: Bool = false
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

                Picker("Grabber", selection: $dragIndicator) {
                    Text("Visible").tag(Visibility.visible)
                    Text("Hidden").tag(Visibility.hidden)
                    Text("Automatic").tag(Visibility.automatic)
                }
                .pickerStyle(.segmented)

                Picker("Background", selection: $backgroundOption) {
                    ForEach(BackgroundOption.allCases, id: \.self) { option in
                        Text(option.label).tag(option)
                    }
                }
                .pickerStyle(.segmented)
            }

            Section("Navigation Bar") {
                TextFieldWithClear(label: "Title:", text: $title)
                TextFieldWithClear(label: "Subtitle:", text: $subtitle)
                Toggle("Large Title", isOn: $useLargeTitle)
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
                useLargeTitle: useLargeTitle,
                showActionButton: showActionButton,
                actionIcon: actionIcon,
                isPresented: $showSheet
            )
            .warpSheetStyle(
                sheetStyle,
                dragIndicator: dragIndicator,
                background: backgroundOption.background
            )
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

private enum BackgroundOption: CaseIterable {
    case automatic
    case solid
    case color
    case none

    var label: String {
        switch self {
        case .automatic: "Auto"
        case .solid: "Solid"
        case .color: "Color"
        case .none: "None"
        }
    }

    var background: Warp.SheetBackground {
        switch self {
        case .automatic: .automatic
        case .solid: .solid
        case .color: .color(Warp.Token.backgroundInfoSubtle)
        case .none: .none
        }
    }
}

private struct SheetContentView: View {

    let title: String
    let subtitle: String
    let useLargeTitle: Bool
    let showActionButton: Bool
    let actionIcon: Warp.Icon
    @Binding var isPresented: Bool

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: Warp.Spacing.spacing200) {
                    ForEach(1...25, id: \.self) { index in
                        Warp.Text("Content row \(index)", style: .body)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(Warp.Spacing.spacing100)
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
            // Close is trailing, and the leading slot is left free for a back button, per the
            // Warp modal spec: https://warp-ds.github.io/docs/components/modal/usage
            .toolbar {
                if showActionButton {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                        } label: {
                            Warp.IconView(actionIcon, size: .default)
                        }
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isPresented = false
                    } label: {
                        Warp.IconView(.close, size: .default)
                    }
                    .accessibilityLabel("Close")
                }
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
