import SwiftUI

extension Warp {

    /// A view modifier that presents a native action sheet (confirmation dialog) with Warp-typed actions.
    struct ActionSheetViewModifier: ViewModifier {
        let title: String
        let message: String?
        let actions: [Warp.ActionSheet.Action]
        @Binding var isPresented: Bool

        @Environment(\.warpTheme) private var theme

        private var colorProvider: ColorProvider {
            theme.colors
        }

        func body(content: Content) -> some View {
            content
                .confirmationDialog(title, isPresented: $isPresented, titleVisibility: .visible) {
                    ForEach(actions) { action in
                        SwiftUI.Button(role: action.style.buttonRole) {
                            action.handler()
                        } label: {
                            SwiftUI.Text(action.title)
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

    /// Presents a Warp-styled action sheet (native confirmation dialog).
    ///
    /// The action sheet appears as a native iOS confirmation dialog at the bottom of the screen.
    /// A cancel button is automatically provided by the system.
    ///
    /// **Usage:**
    ///
    /// ```swift
    /// Text("Content")
    ///     .warpActionSheet(
    ///         title: "Choose an action",
    ///         message: "Select what you'd like to do.",
    ///         actions: [
    ///             Warp.ActionSheet.Action(title: "Share") { /* handle share */ },
    ///             Warp.ActionSheet.Action(title: "Delete", style: .destructive) { /* handle delete */ }
    ///         ],
    ///         isPresented: $showSheet
    ///     )
    /// ```
    ///
    /// - Parameters:
    ///   - title: The title displayed at the top of the action sheet.
    ///   - message: An optional message displayed below the title.
    ///   - actions: An array of actions to display as buttons.
    ///   - isPresented: A binding controlling the action sheet's visibility.
    /// - Returns: A view with the action sheet modifier applied.
    func warpActionSheet(
        title: String,
        message: String? = nil,
        actions: [Warp.ActionSheet.Action],
        isPresented: Binding<Bool>
    ) -> some View {
        self.modifier(
            Warp.ActionSheetViewModifier(
                title: title,
                message: message,
                actions: actions,
                isPresented: isPresented
            )
        )
    }
}
