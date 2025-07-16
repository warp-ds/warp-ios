import SwiftUI

extension Warp {
    struct BroadcastViewModifier: ViewModifier {
        let text: String
        let edge: BroadcastEdge
        private let horizontalPadding: Double = 16
        var isDismissable: Bool
        @Binding var isPresented: Bool

        public func body(content: Content) -> some View {
            content
                .overlay(
                    alignment: edge.asAlignment,
                    content: warpBroadcastOverlay
                )
                .zIndex(1)
                .animation(.default, value: isPresented)
        }

        @ViewBuilder
        private func warpBroadcastOverlay() -> some View {
            if isPresented {
                Warp.Broadcast(
                    text: text,
                    broadcastEdge: edge,
                    isDismissable: isDismissable,
                    isPresented: $isPresented
                )
                .padding(.horizontal, horizontalPadding)
            }
        }

    }
}

public extension View {
    func warpBroadcast(
        text: String,
        edge: Warp.BroadcastEdge,
        isDismissable: Bool = true,
        isPresented: Binding<Bool>
    ) -> some View {
        modifier(
            Warp.BroadcastViewModifier(
                text: text,
                edge: edge,
                isDismissable: isDismissable,
                isPresented: isPresented
            )
        )
    }
}
