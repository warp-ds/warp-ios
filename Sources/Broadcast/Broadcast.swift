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
    public struct Broadcast: View {

        /// Text that will be shown in broadcast
        let title: String

        /// Edge from where the broadcast is presented
        let broadcastEdge: Warp.BroadcastEdge

        /// Binding to a boolean value that allows the broadcast to control dismissal
        @Binding public var isPresented: Bool

        /// Object responsible for providing colors in different environments and variants.
        let colorProvider: ColorProvider

        /**
         - Parameter title: String to display in the `Broadcast`
         - Parameter broadcastEdge: The `BroadcastEdge` on where to present the `Broadcast`
         - Parameter isPresented: Is the `Broadcast` presented or not
         - Parameter colorProvider: ColorProvider used for styling the `Broadcast`, default value is read from `Config`
         */
        public init(
            title: String,
            broadcastEdge: Warp.BroadcastEdge,
            isPresented: Binding<Bool>,
            colorProvider: ColorProvider = Config.colorProvider
        ) {
            self.title = title
            self.broadcastEdge = broadcastEdge
            self._isPresented = isPresented
            self.colorProvider = colorProvider
        }

        public var body: some View {
            contentView
            .overlay(
                RoundedRectangle(cornerRadius: broadcastCornerRadius)
                    .stroke(colorProvider.broadcastBorder, lineWidth: 4)
            )
            .frame(maxWidth: .infinity)
            .background(colorProvider.broadcastBackground)
            .cornerRadius(broadcastCornerRadius)
            .transition(AnyTransition.move(edge: broadcastEdge.asEdge).combined(with: .opacity))
            .onTapGesture {
                withAnimation {
                    isPresented.toggle()
                }
            }
        }

        private var contentView: some View {
            HStack(spacing: 0) {
                Image(systemName: "exclamationmark.triangle.fill")
                    .renderingMode(.template)
                    .foregroundColor(colorProvider.broadcastIcon)

                Text(title, style: .body)
                    .padding(.leading, 8)
                    .foregroundStyle(colorProvider.broadcastText)

                Spacer()

                Image("icon-close", bundle: .module)
            }
            .padding(16)
        }
        
        private var leftLineView: some View {
            return colorProvider.alertWarningIcon
        }
    }
}

#Preview {
    Warp.Broadcast(
        title: "This is a success broadcast",
        broadcastEdge: .top,
        isPresented: .constant(true)
    )
}
