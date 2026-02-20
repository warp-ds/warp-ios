import Foundation
import SwiftUI

extension Warp {
    private static let toastCornerRadius: Double = 8

    /**
        A toast is a message, which provides quick, at-a-glance feedback on the outcome of an action.

        **When to use**

        The Toast is best used for short success, warning, and error messages to confirm an action.

         To use the iOS `Toast` View you need to provide it with
        - a `ToastStyle` (can be `.error`, `.success` or `.warning`)
        - a `title`
        - a `ToastEdge` (can be `.bottom` or `.top`)
        - a Binding to a boolean value allowing the `Toast` to dismiss
     */
    public struct Toast: View {

        /// Preferred style of toast
        let style: ToastStyle

        /// Text that will be shown in toast
        let title: String

        /// Edge from where the toast is presented
        let toastEdge: Warp.ToastEdge

        /// Duration for which the toast will be displayed
        let duration: Duration

        /// Binding to a boolean value that allows the toast to control dismissal
        @Binding public var isPresented: Bool

        /// Object responsible for providing colors in different environments and variants.
        let colorProvider: ColorProvider = Warp.Color

        private let showCloseButton: Bool

        /**
         - Parameter style: The `ToastStyle` of the `Toast`
         - Parameter title: String to display in the `Toast`
         - Parameter toastEdge: The `ToastEdge` on where to present the `Toast`
         - Parameter duration: Duration for which the `Toast` will be displayed, default is `.short`
         - Parameter showCloseButton: Whether to show close button on the `Toast`, default is `true`
         - Parameter isPresented: Is the `Toast` presented or not
         */
        public init(
            style: Warp.ToastStyle,
            title: String,
            toastEdge: Warp.ToastEdge,
            duration: Duration = .short,
            showCloseButton: Bool = true,
            isPresented: Binding<Bool>
        ) {
            self.style = style
            self.title = title
            self.toastEdge = toastEdge
            self.duration = duration
            self.showCloseButton = showCloseButton
            self._isPresented = isPresented
        }

        public var body: some View {
            contentView
            .overlay(
                RoundedRectangle(cornerRadius: toastCornerRadius)
                    .stroke(style.subtleBorderColor(from: colorProvider), lineWidth: 4)
            )
            .frame(maxWidth: 420)
            .background(style.backgroundColor(from: colorProvider))
            .cornerRadius(toastCornerRadius)
            .transition(AnyTransition.move(edge: toastEdge.asEdge).combined(with: .opacity))
            .task {
                do {
                    try await Task.sleep(nanoseconds: duration.timeInNanoseconds)
                    isPresented.toggle()
                } catch {} // Handle cancellation if needed
            }
            .onTapGesture {
                withAnimation {
                    isPresented.toggle()
                }
            }
        }

        private var contentView: some View {
            HStack(spacing: 0) {
                Warp.IconView(style.icon, size: .default)
                    .foregroundColor(style.iconColor(from: colorProvider))

                Text(title, style: .body)
                    .padding(.leading, 8)
                    .foregroundStyle(style.textColor(from: colorProvider))

                Spacer()

                if showCloseButton || duration == .infinite {
                    Warp.IconView(.close, size: .small)
                }
            }
            .padding(16)
        }
    }
}

extension Warp.ToastStyle {
    fileprivate func backgroundColor(from colorProvider: ColorProvider) -> Color {
        switch self {
        case .error:
            colorProvider.token.backgroundNegativeSubtle
        case .success:
            colorProvider.token.backgroundPositiveSubtle
        case .warning:
            colorProvider.token.backgroundWarningSubtle
        }
    }

    fileprivate func subtleBorderColor(from colorProvider: ColorProvider) -> Color {
        switch self {
        case .error:
            colorProvider.token.borderNegativeSubtle
        case .success:
            colorProvider.token.borderPositiveSubtle
        case .warning:
            colorProvider.token.borderWarningSubtle
        }
    }

    fileprivate func textColor(from colorProvider: ColorProvider) -> Color {
        colorProvider.token.text
    }

    fileprivate func iconColor(from colorProvider: ColorProvider) -> Color {
        switch self {
        case .error:
            colorProvider.token.iconNegative
        case .success:
            colorProvider.token.iconPositive
        case .warning:
            colorProvider.token.iconWarning
        }
    }

    fileprivate var icon: Warp.Icon {
        switch self {
        case .error:
            return .error
        case .success:
            return .success
        case .warning:
            return .warning
        }
    }
}

#Preview {
    Warp.Toast(
        style: .success,
        title: "This is a success toast",
        toastEdge: .top,
        isPresented: .constant(true)
    )
}
