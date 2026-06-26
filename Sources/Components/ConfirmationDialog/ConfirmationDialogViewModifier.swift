import SwiftUI

extension Warp {

    /// A view modifier that presents a native confirmation dialog with Warp-typed actions.
    struct ConfirmationDialogViewModifier: ViewModifier {
        let title: String
        let message: String?
        let actions: [Warp.ConfirmationDialog.Action]
        @Binding var isPresented: Bool

        @Environment(\.warpTheme) private var theme

        private var colorProvider: ColorProvider {
            theme.colors
        }

        func body(content: Content) -> some View {
            content
                .confirmationDialog(
                    SwiftUI.Text(title),
                    isPresented: $isPresented,
                    titleVisibility: .visible
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

    /// Presents a Warp-styled confirmation dialog.
    ///
    /// The confirmation dialog appears as a native iOS confirmation dialog at the bottom of the screen.
    /// A cancel button is automatically provided by the system.
    ///
    /// **Usage:**
    ///
    /// ```swift
    /// Text("Content")
    ///     .warpConfirmationDialog(
    ///         title: "Choose an action",
    ///         message: "Select what you'd like to do.",
    ///         actions: [
    ///             Warp.ConfirmationDialog.Action(title: "Share") { /* handle share */ },
    ///             Warp.ConfirmationDialog.Action(title: "Delete", style: .destructive) { /* handle delete */ }
    ///         ],
    ///         isPresented: $showDialog
    ///     )
    /// ```
    ///
    /// - Parameters:
    ///   - title: The title displayed at the top of the confirmation dialog.
    ///   - message: An optional message displayed below the title.
    ///   - actions: An array of actions to display as buttons.
    ///   - isPresented: A binding controlling the confirmation dialog's visibility.
    /// - Returns: A view with the confirmation dialog modifier applied.
    func warpConfirmationDialog(
        title: String,
        message: String? = nil,
        actions: [Warp.ConfirmationDialog.Action],
        isPresented: Binding<Bool>
    ) -> some View {
        self.modifier(
            Warp.ConfirmationDialogViewModifier(
                title: title,
                message: message,
                actions: actions,
                isPresented: isPresented
            )
        )
    }
}
