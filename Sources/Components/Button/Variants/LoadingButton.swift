import Foundation
import SwiftUI

extension Warp.Button {
    /// Factory method for creating warp loading button with arbitrary style.
    public static func createLoadingButton(
        type: Warp.ButtonType,
        title: String,
        icon: Image? = nil,
        action: @escaping () -> Void = {},
        size: Warp.ButtonSize = .big,
        barColor: Color = .gray,
        isAnimating: Binding<Bool>,
        isEnabled: Bool = true,
        fullWidth: Bool = false,
        colorProvider: ColorProvider = Warp.Config.colorProvider
    ) -> some View {
        return PatternedButton(
            title: title,
            color: barColor,
            animationSpeed: 1,
            isAnimating: isAnimating,
            action: action
        )
        .buttonStyle(
            .warp(
                type: type,
                size: size,
                colorProvider: colorProvider,
                isEnabled: isEnabled
            )
        )
        .frame(maxHeight: 50)
    }
}

private struct LoadingButton_Preview: PreviewProvider {
    @State static var isAnimating = false

    static var previews: some View {
        Warp.Button.createLoadingButton(
            type: .primary,
            title: "Title",
            action: {},
            isAnimating: $isAnimating
        )
        .onAppear {
            isAnimating = true
        }
    }
}
