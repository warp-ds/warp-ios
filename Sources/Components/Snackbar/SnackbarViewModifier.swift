import SwiftUI

extension Warp {
    /// A view modifier that displays a snackbar overlay at the bottom of the view.
    ///
    /// This modifier allows you to show temporary feedback messages with optional action buttons.
    /// The snackbar appears as an overlay at the bottom of the view and automatically dismisses
    /// after the specified duration.
    struct SnackbarViewModifier: ViewModifier {
        /// The visual style of the snackbar.
        let type: Warp.SnackbarType

        /// The message text to display.
        let title: String

        /// Optional inline action button.
        let action: Warp.Snackbar.Action?

        /// Optional long action button displayed below the message.
        let longAction: Warp.Snackbar.Action?

        /// The duration for which the snackbar will be displayed.
        let duration: Snackbar.Duration

        /// Whether to show a close button.
        let showCloseButton: Bool

        /// Horizontal padding applied to the snackbar.
        private let horizontalPadding: CGFloat = Warp.Spacing.spacing200

        /// A binding that controls whether the snackbar is presented.
        @Binding var isPresented: Bool
        
        @AccessibilityFocusState var isFocused: Bool

        public func body(content: Content) -> some View {
            content
                .overlay(
                    alignment: .bottom,
                    content: warpSnackbarOverlay
                )
                .zIndex(1)
                .animation(.default, value: isPresented)
                .onChange(of: isPresented) { _, newValue in
                    guard newValue else { return }
                    isFocused = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
                        var parts = [title]
                        if let actionTitle = action?.title ?? longAction?.title {
                            parts.append(actionTitle)
                        }
                        UIAccessibility.post(notification: .announcement, argument: parts.joined(separator: ". "))
                    }
                }
        }

        @ViewBuilder
        func warpSnackbarOverlay() -> some View {
            if isPresented {
                if let longAction {
                    Warp.Snackbar(
                          type: type,
                          title: title,
                          longAction: longAction,
                          duration: duration,
                          showCloseButton: showCloseButton,
                          isPresented: $isPresented
                      )
                      .padding(.horizontal, horizontalPadding)
                      .safeAreaPadding(.bottom)
                      .accessibilityFocused($isFocused)
                } else {
                    Warp.Snackbar(
                          type: type,
                          title: title,
                          action: action,
                          duration: duration,
                          showCloseButton: showCloseButton,
                          isPresented: $isPresented
                      )
                      .padding(.horizontal, horizontalPadding)
                      .safeAreaPadding(.bottom)
                      .accessibilityFocused($isFocused)
                }
            }
        }
    }
}

public extension View {
    /// Displays a snackbar overlay at the bottom of the view with an optional inline action button.
    ///
    /// Use this modifier to show temporary feedback messages that appear at the bottom of your view.
    /// The snackbar automatically dismisses after the specified duration and can include an action button.
    /// When an action is provided, a minimum duration of `.long` (10 seconds) is enforced.
    ///
    /// **Usage:**
    ///
    /// ```swift
    /// Text("Content")
    ///     .warpSnackbar(
    ///         type: .positive,
    ///         title: "Item saved successfully",
    ///         action: Warp.Snackbar.Action(title: "Undo") { /* handle undo */ },
    ///         isPresented: $showSnackbar
    ///     )
    /// ```
    ///
    /// - Parameters:
    ///   - type: The visual style of the snackbar.
    ///   - title: The message text to display.
    ///   - action: An optional action button displayed inline with the message. Defaults to `nil`.
    ///   - duration: How long the snackbar remains visible. Defaults to `.short`. When an action is provided, a minimum duration of `.long` (10 seconds) is enforced.
    ///   - showCloseButton: Whether to show a close button. Defaults to `true`.
    ///   - isPresented: A binding controlling the snackbar's visibility.
    /// - Returns: A view with the snackbar overlay applied.
    func warpSnackbar(
        type: Warp.SnackbarType,
        title: String,
        action: Warp.Snackbar.Action? = nil,
        duration: Warp.Snackbar.Duration = .short,
        showCloseButton: Bool = true,
        isPresented: Binding<Bool>
    ) -> some View {
        self.modifier(
            Warp.SnackbarViewModifier(
                type: type,
                title: title,
                action: action,
                longAction: nil,
                duration: duration,
                showCloseButton: showCloseButton,
                isPresented: isPresented
            )
        )
    }

    /// Displays a snackbar overlay at the bottom of the view with a long action button.
    ///
    /// Use this variant when the action button text is longer and needs to be displayed
    /// below the message instead of inline. When an action is provided, a minimum duration of `.long` (10 seconds) is enforced.
    ///
    /// **Usage:**
    ///
    /// ```swift
    /// Text("Content")
    ///     .warpSnackbar(
    ///         type: .warning,
    ///         title: "Connection lost",
    ///         longAction: Warp.Snackbar.Action(title: "Retry Connection") { /* handle retry */ },
    ///         isPresented: $showSnackbar
    ///     )
    /// ```
    ///
    /// - Parameters:
    ///   - type: The visual style of the snackbar.
    ///   - title: The message text to display.
    ///   - longAction: An optional action button displayed below the message for longer action titles.
    ///   - duration: How long the snackbar remains visible. Defaults to `.short`. When an action is provided, a minimum duration of `.long` (10 seconds) is enforced.
    ///   - showCloseButton: Whether to show a close button. Defaults to `true`.
    ///   - isPresented: A binding controlling the snackbar's visibility.
    /// - Returns: A view with the snackbar overlay applied.
    func warpSnackbar(
        type: Warp.SnackbarType,
        title: String,
        longAction: Warp.Snackbar.Action?,
        duration: Warp.Snackbar.Duration = .short,
        showCloseButton: Bool = true,
        isPresented: Binding<Bool>
    ) -> some View {
        self.modifier(
            Warp.SnackbarViewModifier(
                type: type,
                title: title,
                action: nil,
                longAction: longAction,
                duration: duration,
                showCloseButton: showCloseButton,
                isPresented: isPresented
            )
        )
    }
}
