import SwiftUI

extension Warp.Pill {
    /// Factory responsible for creating pill, UI element color,
    /// based on pill style and current state.
    @MainActor
    struct ColorFactory {
        /// Pill style.
        private let style: Warp.PillStyle
        
        /// Object responsible for providing colors in different environments and variants.
        private let colorProvider: ColorProvider

        init(for style: Warp.PillStyle, consuming colorProvider: ColorProvider) {
            self.style = style
            self.colorProvider = colorProvider
        }

        // MARK: Foreground color

        private var normalForegroundColor: Color {
            switch style {
            case .filter:
                return colorProvider.pillFilterText
            case .suggestion:
                return colorProvider.pillSuggestionText
            }
        }

        /// Create foreground color based on pill style for current state.
        func makeForegroundColor() -> Color {
            return normalForegroundColor
        }

        // MARK: Background color

        private var normalBackgroundColor: Color {
            switch style {
            case .filter:
                return colorProvider.pillFilterBackground
            case .suggestion:
                return colorProvider.pillSuggestionBackground
            }
        }

        private var pressedBackgroundColor: Color {
            switch style {
            case .filter:
                return colorProvider.pillFilterBackgroundActive
            case .suggestion:
                return colorProvider.pillSuggestionBackgroundActive
            }
        }

        /// Create background color based on pill style for current state.
        func makeBackgroundColor(isPressed: Bool) -> Color {
            if isPressed {
                return pressedBackgroundColor
            }

            return normalBackgroundColor
        }
    }
}

/// `SwiftUI` Pill style that will transform pill label view to `Warp` design view style.
struct WarpPillStyle: ButtonStyle {
    /// Object responsible for creating color, based on`PillStyle`,  pill state.
    private let colorFactory: Warp.Pill.ColorFactory
    
    public init(
        style: Warp.PillStyle,
        colorProvider: ColorProvider
    ) {
        colorFactory = Warp.Pill.ColorFactory(
            for: style,
            consuming: colorProvider
        )
    }

    public func makeBody(configuration: Configuration) -> some View {
        let isPressed = configuration.isPressed

        let uiModifiers = UIModifiers(
            colorFactory: colorFactory,
            isPressed: isPressed
        )

        return configuration
            .label
            .modifier(uiModifiers)
    }
}

/// Syntactic sugar to ease using warp button style.
extension ButtonStyle where Self == WarpPillStyle {
    /// Button style that will transform pill background view to `Warp` design style view.
    static func warpPill(
        style: Warp.PillStyle,
        colorProvider: ColorProvider
    ) -> Self {
        return WarpPillStyle(
            style: style,
            colorProvider: colorProvider
        )
    }
}

private struct UIModifiers: ViewModifier {
    let colorFactory: Warp.Pill.ColorFactory

    let isPressed: Bool

    func body(content: Content) -> some View {
        let foregroundColor = colorFactory.makeForegroundColor()
        
        let backgroundColor = colorFactory.makeBackgroundColor(
            isPressed: isPressed
        )

        return content
            .background(backgroundColor)
            .foregroundColor(foregroundColor)
            .cornerRadius(100)
    }
}
