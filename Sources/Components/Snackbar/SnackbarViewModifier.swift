import SwiftUI

extension Warp {
    struct SnackbarViewModifier: ViewModifier {
        let type: Warp.SnackbarType
        let title: String
        let action: Warp.Snackbar.Action?
        let longAction: Warp.Snackbar.Action?
        let duration: Snackbar.Duration
        let showCloseButton: Bool
        private let horizontalPadding: CGFloat = Warp.Spacing.spacing200
        @Binding var isPresented: Bool

        public func body(content: Content) -> some View {
            content
                .overlay(
                    alignment: .bottom,
                    content: warpSnackbarOverlay
                )
                .zIndex(1)
                .animation(.default, value: isPresented)
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
                }
            }
        }
    }
}

public extension View {
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
