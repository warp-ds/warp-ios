import Foundation
import SwiftUI

extension Warp {

    private static let snackbarCornerRadius: Double = 24

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

        public struct Action {
            let title: String
            let handler: () -> Void

            public init(title: String, handler: @escaping () -> Void) {
                self.title = title
                self.handler = handler
            }
        }

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

        private let action: Action?
        private let longAction: Action?
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
            self.action = nil
            self.longAction = nil
            self.duration = duration
            self.showCloseButton = showCloseButton
            self._isPresented = isPresented
        }

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
            action: Action?,
            duration: Duration = .short,
            showCloseButton: Bool = true,
            isPresented: Binding<Bool>
        ) {
            self.type = type
            self.title = title
            self.action = action
            self.longAction = nil
            self.duration = duration
            self.showCloseButton = showCloseButton
            self._isPresented = isPresented
        }

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
            longAction: Action?,
            duration: Duration = .short,
            showCloseButton: Bool = true,
            isPresented: Binding<Bool>
        ) {
            self.type = type
            self.title = title
            self.action = nil
            self.longAction = longAction
            self.duration = duration
            self.showCloseButton = showCloseButton
            self._isPresented = isPresented
        }

        public var body: some View {
            Group {
                if longAction != nil {
                    longActionContentView
                } else {
                    actionContentView
                }
            }
            .frame(maxWidth: 420)
            .background(type.backgroundColor(from: colorProvider).opacity(0.9))
            .cornerRadius(snackbarCornerRadius)
            .background(
                RoundedRectangle(cornerRadius: snackbarCornerRadius)
                    .fill(.ultraThinMaterial)
            )
            .cornerRadius(snackbarCornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: snackbarCornerRadius)
                    .stroke(SwiftUI.Color.white.opacity(0.15), lineWidth: 1)
            )
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

        private var actionContentView: some View {
            HStack(spacing: Warp.Spacing.spacing150) {
                iconAndTitle

                Spacer()

                if let action = action {
                    actionButton(for: action)
                        .padding(.trailing, Warp.Spacing.spacing100)
                }

                closeButton
            }
            .padding(Warp.Spacing.spacing200)
        }

        private var longActionContentView: some View {
            VStack(spacing: Warp.Spacing.spacing150) {
                HStack(spacing: Warp.Spacing.spacing150) {
                    iconAndTitle

                    Spacer()
                }

                if let longAction {
                    HStack(spacing: Warp.Spacing.spacing150) {
                        Spacer()

                        actionButton(for: longAction)

                        closeButton
                    }
                }
            }
            .padding(Warp.Spacing.spacing200)
        }

        private var iconAndTitle: some View {
            HStack(spacing: 0) {
                Warp.IconView(type.icon, size: .default, color: type.iconColor(from: colorProvider))

                Text(title, style: .body, color: type.textColor(from: colorProvider))
                    .padding(.leading, 8)
            }
        }

        private func actionButton(for action: Action) -> some View {
            SwiftUI.Button(action: action.handler) {
                Text(action.title, style: .bodyStrong)
                    .foregroundColor(type.textColor(from: colorProvider))
            }
        }

        private var closeButton: some View {
            Group {
                if showCloseButton || duration == .infinite {
                    Warp.IconView(.close, size: .small, color: colorProvider.token.iconInvertedStatic)
                }
            }
        }
    }
}

extension Warp.Snackbar.`Type` {
    fileprivate func backgroundColor(from colorProvider: ColorProvider) -> Color {
        colorProvider.tooltipBackgroundStatic
    }

    fileprivate func subtleBorderColor(from colorProvider: ColorProvider) -> Color {
        colorProvider.tooltipBackgroundStatic
    }

    fileprivate func textColor(from colorProvider: ColorProvider) -> Color {
        colorProvider.token.textInvertedStatic
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
