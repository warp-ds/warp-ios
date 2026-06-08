import SwiftUI
import Warp

struct ActionSheetView: View {
    @State private var title = "Choose an action"
    @State private var message = ""
    @State private var showActionSheet = false
    @State private var hasDestructiveAction = true
    @State private var lastAction = ""

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: Warp.Spacing.spacing200) {
                if !lastAction.isEmpty {
                    Warp.Alert(
                        style: .info,
                        title: "Last action",
                        subtitle: lastAction
                    )
                }

                Warp.Button(
                    title: "Show Action Sheet",
                    action: { showActionSheet = true },
                    fullWidth: true
                )

                GroupBox {
                    VStack(alignment: .leading) {
                        Warp.Text("Title", style: .bodyStrong)
                        Warp.TextField(text: $title)
                        Divider()

                        Warp.Text("Message (optional)", style: .bodyStrong)
                        Warp.TextField(text: $message)
                        Divider()

                        Toggle(isOn: $hasDestructiveAction) {
                            Warp.Text("Include destructive action", style: .body)
                        }
                    }
                } label: {
                    Warp.Text("Configuration", style: .title5)
                }
            }
            .padding(.horizontal)
        }
        .navigationTitle("ActionSheet")
        .navigationBarTitleDisplayMode(.inline)
        .warpActionSheet(
            title: title,
            message: message.isEmpty ? nil : message,
            actions: buildActions(),
            isPresented: $showActionSheet
        )
    }

    private func buildActions() -> [Warp.ActionSheet.Action] {
        var actions: [Warp.ActionSheet.Action] = [
            .init(title: "Share") { lastAction = "Share" },
            .init(title: "Copy link") { lastAction = "Copy link" },
            .init(title: "Save to favorites") { lastAction = "Save to favorites" }
        ]
        if hasDestructiveAction {
            actions.append(
                .init(title: "Delete", style: .destructive) { lastAction = "Delete" }
            )
        }
        return actions
    }
}
