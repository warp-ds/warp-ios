import Foundation
import SwiftUI

/// `SwiftUI` Button style that will transform button label view to `Warp` design view style.
public struct WarpButtonStyle: ButtonStyle {
    /// Object responsible for creating color, based on`ButtonType`,  button state.
    private let colorFactory: Warp.Button.ColorFactory
    
    /// Object responsible for creating UI metrics based on `ButtonType`, `ButtonSize`.
    private let metricsFactory: Warp.Button.MetricsFactory
    
    /// Object responsible for creating button title typography requirements based on `ButtonType`.
    private let typographyFactory: Warp.Button.TypographyFactory

    public init(
        type: Warp.ButtonType,
        size: Warp.ButtonSize,
        colorProvider: ColorProvider,
        isEnabled: Bool
    ) {
        colorFactory = Warp.Button.ColorFactory(
            for: type,
            consuming: colorProvider,
            isEnabled: isEnabled
        )

        metricsFactory = Warp.Button.MetricsFactory(
            type: type,
            size: size,
            isEnabled: isEnabled
        )

        typographyFactory = Warp.Button.TypographyFactory(for: type)
    }

    public func makeBody(configuration: Configuration) -> some View {
        let isPressed = configuration.isPressed

        let typographyModifiers = TypographyModifiers(
            typographyFactory: typographyFactory,
            colorFactory: colorFactory
        )

        let uiModifiers = UIModifiers(
            colorFactory: colorFactory,
            metricsFactory: metricsFactory,
            isPressed: isPressed
        )

        return configuration
            .label
            .modifier(typographyModifiers)
            .modifier(uiModifiers)
    }

    private func createOverlayView(isPressed: Bool) -> some View {
        let borderColor = colorFactory.makeBorderColor(isPressed: isPressed)

        return RoundedRectangle(cornerRadius: metricsFactory.cornerRadius)
            .stroke(
                borderColor,
                lineWidth: metricsFactory.borderWidth
            )
    }
}

/// Syntactic sugar to ease using warp button style.
public extension ButtonStyle where Self == WarpButtonStyle {
    /// Button style that will transform button label view to `Warp` design style view.
    static func warp(
        type: Warp.ButtonType,
        size: Warp.ButtonSize,
        colorProvider: ColorProvider,
        isEnabled: Bool
    ) -> Self {
        return WarpButtonStyle(
            type: type,
            size: size,
            colorProvider: colorProvider,
            isEnabled: isEnabled
        )
    }
}

private struct TypographyModifiers: ViewModifier {
    let typographyFactory: Warp.Button.TypographyFactory

    let colorFactory: Warp.Button.ColorFactory

    func body(content: Content) -> some View {
        let foregroundColor = colorFactory.makeForegroundColor()

        let font = {
            let font = typographyFactory.font
            let weight = typographyFactory.fontWeight

            return font.weight(weight)
        }()

        return content
            .foregroundColor(foregroundColor)
            .font(font)
            .lineLimit(typographyFactory.lineLimit)
            .truncationMode(typographyFactory.truncationMode)
    }
}

private struct UIModifiers: ViewModifier {
    let colorFactory: Warp.Button.ColorFactory

    let metricsFactory: Warp.Button.MetricsFactory

    let isPressed: Bool

    func body(content: Content) -> some View {
        let backgroundColor = colorFactory.makeBackgroundColor(
            isPressed: isPressed
        )

        let overlayView = createOverlayView(isPressed: isPressed)

        return content
            .padding(.vertical, metricsFactory.verticalPadding)
            .padding(.horizontal, metricsFactory.horizontalPadding)
            .background(backgroundColor)
            .overlay(overlayView)
            .cornerRadius(metricsFactory.cornerRadius)
            .shadow(
                color: colorFactory.makeShadowColor(),
                radius: metricsFactory.shadowRadius,
                y: metricsFactory.shadowVerticalOffset
            )
            .cornerRadius(metricsFactory.cornerRadius)
    }

    private func createOverlayView(isPressed: Bool) -> some View {
        let borderColor = colorFactory.makeBorderColor(isPressed: isPressed)

        return RoundedRectangle(cornerRadius: metricsFactory.cornerRadius)
            .stroke(
                borderColor,
                lineWidth: metricsFactory.borderWidth
            )
    }
}
