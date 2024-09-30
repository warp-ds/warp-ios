import Foundation
import SwiftUI

extension Warp {
    private static let broadcastCornerRadius: Double = 8

    /**
        Longer broadcast message that spans over several lines. Displayed at the top of the page or contextually within a task flow.

        **When to use**

        Use to make an announcement or provide information outside of the normal user flow.

         To use the iOS `Broadcast` View you need to provide it with
        - a `title`
        - a `BroadcastEdge` (can be `.bottom` or `.top`)
        - a Binding to a boolean value allowing the `Broadcast` to dismiss
     */
#if swift(<6.0)
    @preconcurrency @MainActor
#endif
    public struct Broadcast: View {
        
        /// Text that will be shown in broadcast
        let text: String
        
        /// Edge from where the broadcast is presented
        let broadcastEdge: Warp.BroadcastEdge

        /// Binding to a boolean value that allows the broadcast to control dismissal
        @Binding public var isPresented: Bool

        /// Object responsible for providing colors in different environments and variants.
        let colorProvider: ColorProvider

        /**
         - Parameter text: String to display in the `Broadcast`
         - Parameter broadcastEdge: The `BroadcastEdge` on where to present the `Broadcast`
         - Parameter isPresented: Is the `Broadcast` presented or not
         - Parameter colorProvider: ColorProvider used for styling the `Broadcast`, default value is read from `Config`
         */
        public init(
            text: String,
            broadcastEdge: Warp.BroadcastEdge,
            isPresented: Binding<Bool>,
            colorProvider: ColorProvider = Warp.Color
        ) {
            self.text = text
            self.broadcastEdge = broadcastEdge
            self._isPresented = isPresented
            self.colorProvider = colorProvider
        }

        public var body: some View {
            contentView
                .overlay(
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: broadcastCornerRadius)
                            .stroke(colorProvider.broadcastBorderSubtle, lineWidth: 4)
                        colorProvider.broadcastBorder
                            .frame(width: 6)
                    }
                )
                .frame(maxWidth: .infinity)
                .background(colorProvider.broadcastBackground)
                .cornerRadius(broadcastCornerRadius)
                .transition(.move(edge: broadcastEdge.asEdge).combined(with: .opacity))
                .onTapGesture {
                    withAnimation {
                        isPresented = false
                    }
                }
        }

        private var contentView: some View {
            HStack(alignment: .top, spacing: 0) {
                warningImageView
                
                textView
                
                Spacer()
                
                closeView
            }
            .padding(16)
        }
        
        private var warningImageView: some View {
            Image(systemName: "exclamationmark.triangle.fill")
                .renderingMode(.template)
                .foregroundColor(colorProvider.broadcastIcon)
        }
        
        private var textView: some View {
            Text(text, style: .body)
                .padding(.leading, 8)
                .foregroundStyle(colorProvider.broadcastText)
        }
        
        private var closeView: some View {
            Image("icon-close", bundle: .module)
        }
        
        private var leftLineView: some View {
            return colorProvider.broadcastBorder
        }
    }
}

#Preview {
    Warp.Broadcast(
        text: "This is a success broadcast",
        broadcastEdge: .top,
        isPresented: .constant(true)
    )
}
