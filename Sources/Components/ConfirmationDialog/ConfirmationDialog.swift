import SwiftUI

extension Warp {

    /// A Warp wrapper around the native iOS confirmation dialog.
    ///
    /// `ConfirmationDialog` provides data models for configuring a native confirmation dialog
    /// with Warp-typed actions. Use the `.warpConfirmationDialog()` view modifier to present it.
    ///
    /// **Usage:**
    ///
    /// ```swift
    /// .warpConfirmationDialog(
    ///     title: "Delete item?",
    ///     message: "This action cannot be undone.",
    ///     actions: [
    ///         Warp.ConfirmationDialog.Action(title: "Delete", style: .destructive) { /* handle */ },
    ///         Warp.ConfirmationDialog.Action(title: "Archive") { /* handle */ }
    ///     ],
    ///     isPresented: $showDialog
    /// )
    /// ```
    public struct ConfirmationDialog {

        /// An individual action button in the confirmation dialog.
        public struct Action: Identifiable {
            public let id = UUID()

            /// The text displayed on the action button.
            public let title: String

            /// The visual style of the action button.
            public let style: Style

            /// The closure executed when the action button is tapped.
            public let handler: () -> Void

            /// Initializes a confirmation dialog action.
            /// - Parameters:
            ///   - title: The text displayed on the action button.
            ///   - style: The visual style. Defaults to `.default`.
            ///   - handler: The closure to execute when the button is tapped.
            public init(title: String, style: Style = .default, handler: @escaping () -> Void) {
                self.title = title
                self.style = style
                self.handler = handler
            }
        }

        /// The visual style for a confirmation dialog button.
        public enum Style {
            /// A standard action button.
            case `default`

            /// A destructive action button, displayed in red by the system.
            case destructive

            var buttonRole: ButtonRole? {
                switch self {
                case .default: return nil
                case .destructive: return .destructive
                }
            }
        }
    }
}
