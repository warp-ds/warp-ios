import Foundation
import SwiftUI

extension Warp.Radio {
    struct DefaultSelectedLabel: View {
        /// The text label for the radio button.
        private let label: String

        /// The state of the radio button (default, error, disabled).
        private let style: Warp.RadioStyle

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
            style: Warp.RadioStyle,
            extraContent: AnyView? = nil,
            indentationLevel: Int? = 0,
            action: @escaping () -> Void
        ) {
            self.label = label
            self.style = style
            self.extraContent = extraContent
            self.indentationLevel = indentationLevel
            self.action = action
        }

        var body: some View {
            HStack(alignment: .top, spacing: Warp.Spacing.spacing100) {
                Spacer()
                    .frame(width: CGFloat(indentationLevel ?? 0) * Warp.Spacing.spacing300)

                Circle()
                    .strokeBorder(borderColor, lineWidth: 6)
                    .background(Circle().fill(fillColor))
                    .frame(width: 20, height: 20)

                contentStack
            }
            .onTapGesture {
                if style != .disabled {
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
            switch style {
                case .default:
                    return colorProvider.radioBorderSelected

                case .error:
                    return colorProvider.radioNegativeBorder

                case .disabled:
                    return colorProvider.radioBorderDisabled
            }
        }

        private var fillColor: Color {
            if style == .disabled {
                return colorProvider.radioBackgroundDisabled
            }

            return colorProvider.radioBackground
        }

        private var textColor: Color {
            switch style {
                case .default, .error:
                    return colorProvider.token.text

                case .disabled:
                    return colorProvider.token.textDisabled
            }
        }
    }
}
