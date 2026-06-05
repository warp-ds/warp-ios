import Foundation
import SwiftUI

extension Warp {

    /// - Todo: Replace with proper token Liquid Glass when available
    private static let snackbarCornerRadius: Double = 24

    /// A snackbar is a message that provides quick, at-a-glance feedback on the outcome of an action.
    ///
    /// The Snackbar is best used for short success, warning, and error messages to confirm an action.
    /// Snackbars appear temporarily at the bottom of the screen and can optionally include an action button.
    ///
    /// **Duration Behavior:**
    /// When an action button is provided, the snackbar enforces a minimum duration of `.long` (10 seconds)
    /// to give users adequate time to read the message and tap the action button.
    ///
    /// **Usage:**
    ///
    /// ```swift
    /// Warp.Snackbar(
    ///     type: .positive,
    ///     title: "Item successfully added",
    ///     isPresented: $showSnackbar
    /// )
    /// ```
    ///
    /// - Parameters:
    ///   - type: The `SnackbarType` determining the visual style (`.positive`, `.warning`, `.negative`, `.info`, `.neutral` without icon, or `.neutralIcon(_)` with a custom icon).
    ///   - title: The message text to display.
    ///   - duration: How long the snackbar remains visible. Defaults to `.short`.
    ///   - showCloseButton: Whether to show a close button. Defaults to `true`.
    ///   - isPresented: A binding that controls the snackbar's visibility.
    public struct Snackbar: View {

        /// Represents an action button that can be displayed in the snackbar.
        public struct Action {
            /// The title displayed on the action button.
            let title: String

            /// The closure executed when the action button is tapped.
            let handler: () -> Void

            /// Initializes a snackbar action.
            /// - Parameters:
            ///   - title: The text displayed on the action button.
            ///   - handler: The closure to execute when the button is tapped.
            public init(title: String, handler: @escaping () -> Void) {
                self.title = title
                self.handler = handler
            }
        }

        /// The visual style of the snackbar.
        let type: SnackbarType

        /// The message text displayed in the snackbar.
        let title: String

        /// The duration for which the snackbar will be displayed.
        let duration: Duration

        /// A binding that controls whether the snackbar is presented.
        @Binding public var isPresented: Bool

        /// Accessibility focus state for VoiceOver.
        @AccessibilityFocusState private var isFocused: Bool

        /// The current theme from the environment.
        @Environment(\.warpTheme) private var theme

        /// Object responsible for providing colors in different environments and variants.
        private var colorProvider: ColorProvider {
            theme.colors
        }

        /// Optional inline action button.
        private let action: Action?

        /// Optional long action button displayed below the message.
        private let longAction: Action?

        /// Whether to show a close button.
        private let showCloseButton: Bool

        /// Initializes a basic snackbar without an action button.
        /// - Parameters:
        ///   - type: The visual style of the snackbar.
        ///   - title: The message text to display.
        ///   - duration: How long the snackbar remains visible. Defaults to `.short`.
        ///   - showCloseButton: Whether to show a close button. Defaults to `true`.
        ///   - isPresented: A binding controlling the snackbar's visibility.
        public init(
            type: SnackbarType,
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

        /// Initializes a snackbar with an inline action button.
        /// - Parameters:
        ///   - type: The visual style of the snackbar.
        ///   - title: The message text to display.
        ///   - action: An optional action button displayed inline with the message.
        ///   - duration: How long the snackbar remains visible. Defaults to `.short`. When an action is provided, a minimum duration of `.long` (10 seconds) is enforced.
        ///   - showCloseButton: Whether to show a close button. Defaults to `true`.
        ///   - isPresented: A binding controlling the snackbar's visibility.
        public init(
            type: SnackbarType,
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

        /// Initializes a snackbar with a long action button displayed below the message.
        /// - Parameters:
        ///   - type: The visual style of the snackbar.
        ///   - title: The message text to display.
        ///   - longAction: An optional action button displayed below the message for longer action titles.
        ///   - duration: How long the snackbar remains visible. Defaults to `.short`. When an action is provided, a minimum duration of `.long` (10 seconds) is enforced.
        ///   - showCloseButton: Whether to show a close button. Defaults to `true`.
        ///   - isPresented: A binding controlling the snackbar's visibility.
        public init(
            type: SnackbarType,
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
            .frame(maxWidth: 480)
            .background(type.backgroundColor(from: colorProvider).opacity(0.72))
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
            .accessibilityFocused($isFocused)
            .onChange(of: isPresented) { oldValue, newValue in
                if newValue {
                    isFocused = true
                }
            }
            .task {
                // Do not start the timer if the duration is infinite, allowing the snackbar to stay until manually dismissed
                guard duration != .infinite else {
                    return
                }

                // Enforce minimum duration of .long (10 seconds) when an action is provided
                let effectiveDuration: UInt64 = {
                    let hasAction = action != nil || longAction != nil
                    let minimumDuration = Duration.long.timeInNanoseconds
                    return hasAction && duration.timeInNanoseconds < minimumDuration
                        ? minimumDuration
                        : duration.timeInNanoseconds
                }()

                do {
                    try await Task.sleep(nanoseconds: effectiveDuration)
                    withAnimation {
                        isPresented = false
                    }
                } catch {} // Handle cancellation if needed
            }
            .onTapGesture {
                withAnimation {
                    isPresented = false
                }
            }
        }

        private var actionContentView: some View {
            HStack(spacing: Warp.Spacing.spacing150) {
                iconAndTitle

                Spacer()
                
                HStack(spacing: Warp.Spacing.spacing200) {
                    if let action = action {
                        actionButton(for: action)
                    }

                    closeButton
                }
            }
              .frame(minHeight: IconSize.default.value) // Ensure the content area is at least as tall as the icon for proper vertical alignment
              .padding(Warp.Spacing.spacing150)
        }

        private var longActionContentView: some View {
            VStack(spacing: Warp.Spacing.spacing150) {
                HStack(spacing: Warp.Spacing.spacing150) {
                    iconAndTitle

                    Spacer()
                }
                  .frame(minHeight: IconSize.default.value) // Ensure the content area is at least as tall as the icon for proper vertical alignment

                if let longAction {
                    HStack(spacing: Warp.Spacing.spacing200) {
                        Spacer()

                        actionButton(for: longAction)

                        closeButton
                    }
                      .frame(minHeight: IconSize.default.value) // Ensure the content area is at least as tall as the icon for proper vertical alignment
                }
            }
            .padding(Warp.Spacing.spacing150)
        }

        private var iconAndTitle: some View {
            HStack(spacing: Warp.Spacing.spacing150) {
                if type.hasIcon {
                    if case .neutralIcon(let customIcon) = type { // Neutral icon isn't a palette icon, so we need to handle it separately
                        Warp.IconView(customIcon, size: .default, color: type.iconColor(from: colorProvider))
                    } else {
                        Warp.PaletteIconView(type.icon, size: .default, color: type.iconColor(from: colorProvider))
                    }
                }
                
                Text(title, style: .caption, color: type.textColor(from: colorProvider))
                  .padding(.leading, type.hasIcon ? 0: Warp.Spacing.spacing50) // Add left padding to the title when there is no icon to maintain consistent spacing
            }
        }

        private func actionButton(for action: Action) -> some View {
            SwiftUI.Button(action: {
                action.handler()
                withAnimation {
                    isPresented = false
                }
            }) {
                Text(action.title, style: .title5)
                    .foregroundColor(type.textColor(from: colorProvider))
            }
        }

        private var closeButton: some View {
            Group {
                if showCloseButton || duration == .infinite {
                    SwiftUI.Button(action: {
                        withAnimation {
                            isPresented = false
                        }
                    }) {
                        Warp.IconView(.close, size: .default, color: colorProvider.token.iconInvertedStatic)
                    }
                }
            }
        }
    }
}

extension Warp.SnackbarType {
    fileprivate func backgroundColor(from colorProvider: ColorProvider) -> Color {
        colorProvider.tooltipBackgroundStatic
    }

    fileprivate func textColor(from colorProvider: ColorProvider) -> Color {
        colorProvider.token.textInvertedStatic
    }

    fileprivate var hasIcon: Bool {
        switch self {
        case .neutral:
            return false
        case .positive, .warning, .negative, .info, .neutralIcon:
            return true
        }
    }

    fileprivate func iconColor(from colorProvider: ColorProvider) -> Color {
        switch self {
        case .positive:
            colorProvider.token.iconPositive
        case .warning:
            colorProvider.token.iconWarning
        case .negative:
            colorProvider.token.iconNegative
        case .info:
            colorProvider.token.iconInfo
        case .neutral:
            colorProvider.token.icon
        case .neutralIcon:
            colorProvider.token.iconInvertedStatic
        }
    }

    fileprivate var icon: Warp.Icon {
        switch self {
        case .positive:
            return .successFilled
        case .warning:
            return .warningFilled
        case .negative:
            return .errorFilled
        case .info:
            return .infoFilled
        case .neutral:
            return .info
        case .neutralIcon(let customIcon):
            return customIcon
        }
    }
}

#Preview {
    Warp.Snackbar(
        type: .positive,
        title: "This is a positive snackbar",
        isPresented: .constant(true)
    )
    .warpTheme(.finn)
}
