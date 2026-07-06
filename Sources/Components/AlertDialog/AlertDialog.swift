import SwiftUI

extension Warp {

    /// A Warp wrapper around the native iOS alert dialog.
    ///
    /// `AlertDialog` provides data models for configuring a native alert dialog
    /// with Warp-typed actions. Use the `.warpAlert()` view modifier to present it.
    ///
    /// **Usage:**
    ///
    /// ```swift
    /// .warpAlert(
    ///     title: "Delete item?",
    ///     message: "This action cannot be undone.",
    ///     actions: [
    ///         Warp.AlertDialog.Action(title: "Delete", style: .destructive) { /* handle */ },
    ///         Warp.AlertDialog.Action(title: "Cancel", style: .cancel) { }
    ///     ],
    ///     isPresented: $showAlert
    /// )
    /// ```
    public struct AlertDialog {

        /// An individual action button in the alert dialog.
        public struct Action: Identifiable {
            public let id = UUID()

            /// The text displayed on the action button.
            public let title: String

            /// The visual style of the action button.
            public let style: Style

            /// The closure executed when the action button is tapped.
            public let handler: () -> Void

            /// Initializes an alert dialog action.
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

        /// The visual style for an alert dialog button.
        public enum Style {
            /// A standard action button.
            case `default`

            /// A destructive action button, displayed in red by the system.
            case destructive

            /// A cancel button, displayed prominently by the system.
            case cancel

            var buttonRole: ButtonRole? {
                switch self {
                case .default: return nil
                case .destructive: return .destructive
                case .cancel: return .cancel
                }
            }
        }
    }
}
