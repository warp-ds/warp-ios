import SwiftUI

extension Warp {
    public struct BroadcastViewModifier: ViewModifier {
        let title: String
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
                    title: title,
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
        title: String,
        edge: Warp.BroadcastEdge,
        isPresented: Binding<Bool>
    ) -> some View {
        self.modifier(
            Warp.BroadcastViewModifier(
                title: title,
                edge: edge,
                isPresented: isPresented
            )
        )
    }
}
