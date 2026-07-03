import SwiftUI
import Warp

private struct ActionConfig: Identifiable {
    let id = UUID()
    var title: String
    var style: Warp.AlertDialog.Style
}

struct AlertDialogView: View {
    @State private var title = "Are you sure?"
    @State private var message = ""
    @State private var showAlert = false
    @State private var actions: [ActionConfig] = [
        .init(title: "Delete", style: .destructive),
        .init(title: "Cancel", style: .cancel)
    ]
    var body: some View {
        Form {
            Section("Demo") {
                Warp.Button(
                    title: "Show Alert",
                    action: { showAlert = true },
                    fullWidth: true
                )
                .warpAlert(
                    title: title,
                    message: message.isEmpty ? nil : message,
                    actions: buildWarpActions(),
                    isPresented: $showAlert
                )
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
                            Warp.Text("Default", style: .body).tag(Warp.AlertDialog.Style.default)
                            Warp.Text("Destructive", style: .body).tag(Warp.AlertDialog.Style.destructive)
                            Warp.Text("Cancel", style: .body).tag(Warp.AlertDialog.Style.cancel)
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
        .navigationTitle("Alert (Native)")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func buildWarpActions() -> [Warp.AlertDialog.Action] {
        actions.map { config in
            Warp.AlertDialog.Action(
                title: config.title,
                style: config.style,
                handler: {}
            )
        }
    }
}
