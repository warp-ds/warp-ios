import Foundation
import SwiftUI

/// `SwiftUI` Button style that will transform button label view to `Warp` design view style.
public struct WarpButtonStyle: ButtonStyle {
    /// Object responsible for creating color, based on`ButtonType`,  button state.
    private let colorFactory: Warp.Button.ColorFactory
    
    /// Object responsible for creating UI metrics based on `ButtonType`, `ButtonSize`.
    private let metricsFactory: Warp.Button.UIMetricsFactory

    /// Object responsible for creating button title typography requirements based on `ButtonType`.
    private let typographyFactory: Warp.Button.TypographyFactory

    private let isLoading: Bool

    public init(
        type: Warp.ButtonType,
        size: Warp.ButtonSize,
        colorProvider: ColorProvider,
        isEnabled: Bool,
        isLoading: Bool
    ) {
        colorFactory = Warp.Button.ColorFactory(
            for: type,
            consuming: colorProvider,
            isEnabled: isEnabled,
            isLoading: isLoading
        )

        metricsFactory = Warp.Button.UIMetricsFactory(
            type: type,
            size: size,
            isEnabled: isEnabled,
            isLoading: isLoading
        )

        typographyFactory = Warp.Button.TypographyFactory(for: type, size: size)

        self.isLoading = isLoading
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
            isPressed: isPressed,
            isLoading: isLoading
        )

        return configuration
            .label
            .modifier(typographyModifiers)
            .modifier(uiModifiers)
            .iflet(metricsFactory.shadow) { view, shadow in
                view.addShadow(shadow)
            }
    }
}

/// Syntactic sugar to ease using warp button style.
public extension ButtonStyle where Self == WarpButtonStyle {
    /// Button style that will transform button label view to `Warp` design style view.
    static func warp(
        type: Warp.ButtonType,
        size: Warp.ButtonSize,
        colorProvider: ColorProvider,
        isEnabled: Bool,
        isLoading: Bool
    ) -> Self {
        return WarpButtonStyle(
            type: type,
            size: size,
            colorProvider: colorProvider,
            isEnabled: isEnabled,
            isLoading: isLoading
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

            return font
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

    let metricsFactory: Warp.Button.UIMetricsFactory

    let isPressed: Bool

    let isLoading: Bool

    func body(content: Content) -> some View {
        let backgroundColor = colorFactory.makeBackgroundColor(
            isPressed: isPressed
        )

        let overlayView = createOverlayView(isPressed: isPressed)

        return content
            .background {
                if isLoading {
                    patternedOpaqueView
                }
            }
            .padding(.vertical, metricsFactory.verticalPadding)
            .padding(.horizontal, metricsFactory.horizontalPadding)
            .background(backgroundColor)
            .overlay(overlayView)
            .cornerRadius(metricsFactory.cornerRadius)
    }

    private var patternedOpaqueView: some View {
        PatternedOpaqueView(
            barColors: (FinnColors.gray50, FinnColors.gray200)
        )
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
