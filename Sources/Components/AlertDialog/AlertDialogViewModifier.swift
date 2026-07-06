import SwiftUI

extension Warp {

    /// A view modifier that presents a native alert dialog with Warp-typed actions.
    struct AlertDialogViewModifier<ExtraContent: View>: ViewModifier {
        let title: String
        let message: String?
        let actions: [Warp.AlertDialog.Action]
        @Binding var isPresented: Bool
        let extraContent: ExtraContent

        func body(content: Content) -> some View {
            content
                .alert(
                    SwiftUI.Text(title),
                    isPresented: $isPresented
                ) {
                    extraContent
                    ForEach(actions) { action in
                        SwiftUI.Button(role: action.style.buttonRole) {
                            action.handler()
                        } label: {
                            SwiftUI.Text(action.title)
                                .font(Warp.Typography.title4.font)
                                .foregroundStyle(action.style == .destructive
                                    ? Warp.Token.textNegative
                                    : Warp.Token.text)
                        }
                    }
                } message: {
                    if let message {
                        SwiftUI.Text(message)
                    }
                }
        }
    }
}

public extension View {

    /// Presents a Warp-styled native alert dialog with optional custom content above buttons.
    ///
    /// Use `content` to insert views such as `TextField` or `SecureField` above the action buttons.
    ///
    /// **Usage:**
    ///
    /// ```swift
    /// Text("Content")
    ///     .warpAlert(
    ///         title: "Rename item",
    ///         actions: [
    ///             Warp.AlertDialog.Action(title: "Save") { save() },
    ///             Warp.AlertDialog.Action(title: "Cancel", style: .cancel) { }
    ///         ],
    ///         isPresented: $showAlert
    ///     ) {
    ///         TextField("Name", text: $name)
    ///     }
    /// ```
    ///
    /// - Parameters:
    ///   - title: The title displayed at the top of the alert dialog.
    ///   - message: An optional message displayed below the title.
    ///   - actions: An array of actions to display as buttons.
    ///   - isPresented: A binding controlling the alert dialog's visibility.
    ///   - content: Additional views (e.g. `TextField`) rendered above the action buttons.
    /// - Returns: A view with the alert dialog modifier applied.
    func warpAlert<ExtraContent: View>(
        title: String,
        message: String? = nil,
        actions: [Warp.AlertDialog.Action],
        isPresented: Binding<Bool>,
        @ViewBuilder content: () -> ExtraContent
    ) -> some View {
        self.modifier(
            Warp.AlertDialogViewModifier(
                title: title,
                message: message,
                actions: actions,
                isPresented: isPresented,
                extraContent: content()
            )
        )
    }

    /// Presents a Warp-styled native alert dialog.
    ///
    /// **Usage:**
    ///
    /// ```swift
    /// Text("Content")
    ///     .warpAlert(
    ///         title: "Delete item?",
    ///         message: "This action cannot be undone.",
    ///         actions: [
    ///             Warp.AlertDialog.Action(title: "Delete", style: .destructive) { handleDelete() },
    ///             Warp.AlertDialog.Action(title: "Cancel", style: .cancel) { }
    ///         ],
    ///         isPresented: $showAlert
    ///     )
    /// ```
    ///
    /// - Parameters:
    ///   - title: The title displayed at the top of the alert dialog.
    ///   - message: An optional message displayed below the title.
    ///   - actions: An array of actions to display as buttons.
    ///   - isPresented: A binding controlling the alert dialog's visibility.
    /// - Returns: A view with the alert dialog modifier applied.
    func warpAlert(
        title: String,
        message: String? = nil,
        actions: [Warp.AlertDialog.Action],
        isPresented: Binding<Bool>
    ) -> some View {
        self.modifier(
            Warp.AlertDialogViewModifier(
                title: title,
                message: message,
                actions: actions,
                isPresented: isPresented,
                extraContent: EmptyView()
            )
        )
    }
}
