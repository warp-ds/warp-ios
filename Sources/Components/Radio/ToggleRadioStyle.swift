import Foundation
import SwiftUI

extension Warp {
    public struct ToggleRadioStyle: ToggleStyle {
        /// An optional view that will be displayed beside or below the label.
        private let extraContent: AnyView?
        
        /// <#Description#>
        @Environment(\.isEnabled) private var isEnabled

        private let indentationLevel: Int?

        private let hasError: Bool

        /// Object that will provide needed colors.
        private let colorProvider: ColorProvider = Warp.Color

        init(extraContent: AnyView?, hasError: Bool = false, indentationLevel: Int? = 0) {
            self.extraContent = extraContent
            self.indentationLevel = indentationLevel
            self.hasError = hasError
        }

        public func makeBody(configuration: Configuration) -> some View {
            HStack(alignment: .top, spacing: Spacing.spacing100) {
                Circle()
                    .strokeBorder(
                        createBorderColor(isOn: configuration.isOn),
                        lineWidth: configuration.isOn ? 6 : 1
                    )
                    .background(Circle().fill(fillColor))
                    .frame(width: 20, height: 20)

                Spacer()
                    .frame(width: CGFloat(indentationLevel ?? 0) * Spacing.spacing300)

                configuration.label
                    .font(Typography.body.font)
                    .foregroundColor(textColor)

                extraContent
            }
            .padding(.horizontal)
        }

        private func createBorderColor(isOn: Bool) -> Color {
            switch (isEnabled, isOn, hasError) {
                case (true, true, false):
                    return colorProvider.radioBorderSelected

                case (true, false, false):
                    return colorProvider.radioBorder

                case (true, _, true):
                    return colorProvider.radioNegativeBorder

                case (false, _, _):
                    return colorProvider.radioBorderDisabled
            }
        }

        private var fillColor: Color {
            if !isEnabled {
                return colorProvider.radioBackgroundDisabled
            }

            return colorProvider.radioBackground
        }

        private var textColor: Color {
            if !isEnabled {
                return colorProvider.token.textDisabled
            }

            return colorProvider.token.text
        }
    }
}
