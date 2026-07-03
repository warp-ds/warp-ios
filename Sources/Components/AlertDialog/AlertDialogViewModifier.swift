import SwiftUI

extension Warp {

    /// A view modifier that presents a native alert dialog with Warp-typed actions.
    struct AlertDialogViewModifier: ViewModifier {
        let title: String
        let message: String?
        let actions: [Warp.AlertDialog.Action]
        @Binding var isPresented: Bool

        func body(content: Content) -> some View {
            content
                .alert(
                    SwiftUI.Text(title),
                    isPresented: $isPresented
                ) {
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

    /// Presents a Warp-styled native alert dialog.
    ///
    /// The alert appears as a native iOS modal alert in the center of the screen.
    /// The system automatically styles cancel buttons prominently.
    ///
    /// **Usage:**
    ///
    /// ```swift
    /// Text("Content")
    ///     .warpAlert(
    ///         title: "Delete item?",
    ///         message: "This action cannot be undone.",
    ///         actions: [
    ///             Warp.AlertDialog.Action(title: "Delete", style: .destructive) { /* handle delete */ },
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
                isPresented: isPresented
            )
        )
    }
}
