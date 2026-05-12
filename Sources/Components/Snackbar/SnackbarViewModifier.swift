import SwiftUI

extension Warp {
    struct SnackbarViewModifier: ViewModifier {
        let type: Warp.Snackbar.`Type`
        let title: String
        let duration: Snackbar.Duration
        let showCloseButton: Bool
        private let horizontalPadding: Double = 16
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
                Warp.Snackbar(
                    type: type,
                    title: title,
                    duration: duration,
                    showCloseButton: showCloseButton,
                    isPresented: $isPresented
                )
                .padding(.horizontal, horizontalPadding)
            }
        }

    }
}

public extension View {
    func warpSnackbar(
        type: Warp.Snackbar.`Type`,
        title: String,
        duration: Warp.Snackbar.Duration = .short,
        showCloseButton: Bool = true,
        isPresented: Binding<Bool>
    ) -> some View {
        self.modifier(
            Warp.SnackbarViewModifier(
                type: type,
                title: title,
                duration: duration,
                showCloseButton: showCloseButton,
                isPresented: isPresented
            )
        )
    }
}
