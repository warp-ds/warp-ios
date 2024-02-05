import Foundation
import SwiftUI

extension Warp {
    /// The style the Pill component has
    public enum PillStyle: Equatable, CaseIterable {
        /// Used to represent a removable value the user has chosen.
        case filter
        /// Used to represent a proposed/recommended value a user can choose.
        case suggestion
    }
}

extension Warp.Pill {
    /// Factory responsible for creating button, UI element color,
    /// based on button type and current state.
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

        /// Create foreground color based on button type for current state.
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

/// `SwiftUI` Button style that will transform button label view to `Warp` design view style.
public struct WarpPillStyle: ButtonStyle {
    /// Object responsible for creating color, based on`ButtonType`,  button state.
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
public extension ButtonStyle where Self == WarpPillStyle {
    /// Button style that will transform button label view to `Warp` design style view.
    static func warp(
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
