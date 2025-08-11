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
        - a boolean that will determine if user can dismiss the `Broadcast` or not
        - a Binding to a boolean value allowing the `Broadcast` to dismiss

        - Warning: This view is deprecated and will be removed in a future release. Use Alert component (warning) instead.
     */
    @available(iOS, deprecated, message: "Use Alert component (warning) instead")
    public struct Broadcast: View {

        /// Text that will be shown in broadcast
        let text: String

        /// Edge from where the broadcast is presented
        let broadcastEdge: Warp.BroadcastEdge

        /// Boolean that will add a close button
        let isDismissable: Bool

        /// Binding to a boolean value that allows the broadcast to control dismissal
        @Binding public var isPresented: Bool

        /// Object responsible for providing colors in different environments and variants.
        let colorProvider: ColorProvider = Warp.Color

        /**
         - Parameter text: String to display in the `Broadcast`
         - Parameter broadcastEdge: The `BroadcastEdge` on where to present the `Broadcast`
         - Parameter isDismissable: Is the `Broadcast` dismissable by the user or not
         - Parameter isPresented: Is the `Broadcast` presented or not
         */
        public init(
            text: String,
            broadcastEdge: Warp.BroadcastEdge,
            isDismissable: Bool = true,
            isPresented: Binding<Bool>
        ) {
            self.text = text
            self.broadcastEdge = broadcastEdge
            self.isDismissable = isDismissable
            self._isPresented = isPresented
        }

        public var body: some View {
            contentView
                .overlay(
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: broadcastCornerRadius)
                            .stroke(colorProvider.token.borderWarningSubtle, lineWidth: 4)
                        colorProvider.token.borderWarning
                            .frame(width: 6)
                    }
                )
                .frame(maxWidth: .infinity)
                .background(colorProvider.token.backgroundWarningSubtle)
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
                if isDismissable {
                    closeView
                }
            }
            .padding(16)
        }
        
        private var warningImageView: some View {
            Warp.IconView(.warning, size: .default)
                .foregroundColor(colorProvider.token.iconWarning)
        }
        
        private var textView: some View {
            Text(text, style: .body)
                .padding(.leading, 8)
                .foregroundStyle(colorProvider.token.text)
        }
        
        private var closeView: some View {
            Warp.IconView(.close, size: .small)
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
