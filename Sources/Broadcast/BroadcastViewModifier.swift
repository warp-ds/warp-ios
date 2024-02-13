import SwiftUI

extension Warp {
    public struct BroadcastViewModifier: ViewModifier {
        let text: String
        let edge: BroadcastEdge
        private let horizontalPadding: Double = 16
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
        func warpBroadcastOverlay() -> some View {
            if isPresented {
                Warp.Broadcast(
                    text: text,
                    broadcastEdge: edge,
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
        isPresented: Binding<Bool>
    ) -> some View {
        self.modifier(
            Warp.BroadcastViewModifier(
                text: text,
                edge: edge,
                isPresented: isPresented
            )
        )
    }
}
