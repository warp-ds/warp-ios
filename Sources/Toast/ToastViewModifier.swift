import SwiftUI

extension Warp {
    public struct ToastViewModifier: ViewModifier {
        let style: Warp.ToastStyle
        let title: String
        let edge: ToastEdge
        private let horizontalPadding: Double = 16
        @Binding var isPresented: Bool

        public func body(content: Content) -> some View {
            content
                .overlay(
                    alignment: edge.asAlignment,
                    content: warpToastOverlay
                )
                .zIndex(1)
                .animation(.default, value: isPresented)
        }

        @ViewBuilder
        func warpToastOverlay() -> some View {
            if isPresented {
                Warp.Toast(
                    style: style,
                    title: title,
                    toastEdge: edge,
                    isPresented: $isPresented
                )
                .padding(.horizontal, horizontalPadding)
            }
        }

    }
}

public extension View {
    func warpToast(
        style: Warp.ToastStyle,
        title: String,
        edge: Warp.ToastEdge,
        isPresented: Binding<Bool>
    ) -> some View {
        self.modifier(
            Warp.ToastViewModifier(
                style: style,
                title: title,
                edge: edge,
                isPresented: isPresented
            )
        )
    }
}
