import Foundation
import SwiftUI

extension Warp.Radio {
    struct DefaultDeselectedLabel: View {
        /// The text label for the radio button.
        private let label: String

        /// Flag indicating that label should show error state.
        private let hasError: Bool

        /// A Boolean value that indicates whether the view associated with this environment allows user interaction.
        @Environment(\.isEnabled) private var isEnabled

        /// An optional view that will be displayed beside or below the label.
        private let extraContent: AnyView?

        /// The level of indentation for the radio button. Each level adds 24 points of indentation.
        private let indentationLevel: Int? // Maybe remove later if we decide it has no use

        /// A closure that is executed when the radio button is tapped.
        private let action: () -> Void

        /// Object that will provide needed colors.
        private let colorProvider: ColorProvider = Warp.Color

        init(
            label: String,
            hasError: Bool,
            extraContent: AnyView?,
            indentationLevel: Int?,
            action: @escaping () -> Void
        ) {
            self.label = label
            self.hasError = hasError
            self.extraContent = extraContent
            self.indentationLevel = indentationLevel
            self.action = action
        }

        var body: some View {
            HStack(alignment: .top, spacing: Warp.Spacing.spacing100) {
                Spacer()
                    .frame(width: CGFloat(indentationLevel ?? 0) * Warp.Spacing.spacing300)

                Circle()
                    .strokeBorder(borderColor, lineWidth: 1)
                    .background(Circle().fill(fillColor))
                    .frame(width: 20, height: 20)

                contentStack
            }
            .onTapGesture {
                if isEnabled {
                    action()
                }
            }
        }

        private var contentStack: some View {
            HStack(alignment: .top, spacing: Warp.Spacing.spacing100) {
                SwiftUI.Text(label)
                    .font(Warp.Typography.body.font)
                    .foregroundColor(textColor)

                extraContent
            }
        }

        private var borderColor: Color {
            switch (isEnabled, hasError) {
                case (true, false):
                    return colorProvider.radioBorder

                case (true, true):
                    return colorProvider.radioNegativeBorder

                case (false, _):
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
