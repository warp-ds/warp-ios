import SwiftUI
import Warp

private struct ActionConfig: Identifiable {
    let id = UUID()
    var title: String
    var style: Warp.ConfirmationDialog.Style
}

struct ConfirmationDialogView: View {
    @State private var title = "Choose an action"
    @State private var message = ""
    @State private var showDialog = false
    @State private var actions: [ActionConfig] = [
        .init(title: "Share", style: .default),
        .init(title: "Copy link", style: .default),
        .init(title: "Delete", style: .destructive)
    ]
    @State private var lastAction = ""

    var body: some View {
        Form {
            Section("Demo") {
                Warp.Button(
                    title: "Show Confirmation Dialog",
                    action: { showDialog = true },
                    fullWidth: true
                )
               .warpConfirmationDialog(
                  title: title,
                  message: message.isEmpty ? nil : message,
                  actions: buildWarpActions(),
                  isPresented: $showDialog
               )
            }

            if !lastAction.isEmpty {
                Section("Last action") {
                    Warp.Alert(
                        style: .info,
                        title: "Selected",
                        subtitle: lastAction
                    )
                }
            }

            Section("Configuration") {
                HStack {
                    Warp.Text("Title:", style: .body)
                        .foregroundColor(.secondary)
                    Warp.TextField(text: $title)
                }

                HStack {
                    Warp.Text("Message:", style: .body)
                        .foregroundColor(.secondary)
                    Warp.TextField(text: $message)
                }
            }

            Section {
                ForEach($actions) { $action in
                    VStack(alignment: .leading, spacing: Warp.Spacing.spacing100) {
                        HStack {
                            Warp.Text("Title:", style: .body)
                                .foregroundColor(.secondary)
                            Warp.TextField(text: $action.title)
                        }

                        Picker("Style", selection: $action.style) {
                            Warp.Text("Default", style: .body).tag(Warp.ConfirmationDialog.Style.default)
                            Warp.Text("Destructive", style: .body).tag(Warp.ConfirmationDialog.Style.destructive)
                        }
                        .pickerStyle(.segmented)
                    }
                    .padding(.vertical, Warp.Spacing.spacing50)
                }
                .onMove { actions.move(fromOffsets: $0, toOffset: $1) }
                .onDelete { actions.remove(atOffsets: $0) }
            } header: {
                HStack {
                    Warp.Text("Actions: \(actions.count)", style: .body)
                    Spacer()
                    EditButton()
                }
            }

            Section {
                Button("Add action") {
                    withAnimation {
                        actions.append(.init(title: "New action", style: .default))
                    }
                }
            }
        }
        .navigationTitle("Confirmation Dialog")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func buildWarpActions() -> [Warp.ConfirmationDialog.Action] {
        actions.map { config in
            Warp.ConfirmationDialog.Action(
                title: config.title,
                style: config.style
            ) {
                lastAction = config.title
            }
        }
    }
}
