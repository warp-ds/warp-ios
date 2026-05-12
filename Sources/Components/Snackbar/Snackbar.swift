import Foundation
import SwiftUI

extension Warp {
    private static let snackbarCornerRadius: Double = 8

    /**
        A snackbar is a message, which provides quick, at-a-glance feedback on the outcome of an action.

        **When to use**

        The Snackbar is best used for short success, warning, and error messages to confirm an action.

         To use the iOS `Snackbar` View you need to provide it with
        - a `Snackbar.Type` (can be `.error`, `.success` or `.warning`)
        - a `title`
        - a Binding to a boolean value allowing the `Snackbar` to dismiss
     */
    public struct Snackbar: View {

        /// Preferred type of snackbar
        let type: Snackbar.`Type`

        /// Text that will be shown in snackbar
        let title: String

        /// Duration for which the snackbar will be displayed
        let duration: Duration

        /// Binding to a boolean value that allows the snackbar to control dismissal
        @Binding public var isPresented: Bool

        /// The current theme from the environment.
        @Environment(\.warpTheme) private var theme

        /// Object responsible for providing colors in different environments and variants.
        private var colorProvider: ColorProvider {
            theme.colors
        }

        private let showCloseButton: Bool

        /**
         - Parameter type: The `Snackbar.Type` of the `Snackbar`
         - Parameter title: String to display in the `Snackbar`
         - Parameter duration: Duration for which the `Snackbar` will be displayed, default is `.short`
         - Parameter showCloseButton: Whether to show close button on the `Snackbar`, default is `true`
         - Parameter isPresented: Is the `Snackbar` presented or not
         */
        public init(
            type: Snackbar.`Type`,
            title: String,
            duration: Duration = .short,
            showCloseButton: Bool = true,
            isPresented: Binding<Bool>
        ) {
            self.type = type
            self.title = title
            self.duration = duration
            self.showCloseButton = showCloseButton
            self._isPresented = isPresented
        }

        public var body: some View {
            contentView
            .overlay(
                RoundedRectangle(cornerRadius: snackbarCornerRadius)
                    .stroke(type.subtleBorderColor(from: colorProvider), lineWidth: 4)
            )
            .frame(maxWidth: 420)
            .background(type.backgroundColor(from: colorProvider))
            .cornerRadius(snackbarCornerRadius)
            .transition(AnyTransition.move(edge: .bottom).combined(with: .opacity))
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
                Warp.IconView(type.icon, size: .default)
                    .foregroundColor(type.iconColor(from: colorProvider))

                Text(title, style: .body)
                    .padding(.leading, 8)
                    .foregroundStyle(type.textColor(from: colorProvider))

                Spacer()

                if showCloseButton || duration == .infinite {
                    Warp.IconView(.close, size: .small)
                }
            }
            .padding(16)
        }
    }
}

extension Warp.Snackbar.`Type` {
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
    Warp.Snackbar(
        type: .success,
        title: "This is a success snackbar",
        isPresented: .constant(true)
    )
    .warpTheme(.finn)
}
