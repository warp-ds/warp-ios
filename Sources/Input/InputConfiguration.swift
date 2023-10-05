import Foundation
import struct SwiftUI.AnyView
import struct SwiftUI.Image
import struct SwiftUI.Text

extension Warp {
    /// Configurations that will be applied to input.
    public struct InputConfiguration {
        /// TextField placeholder.
        public var placeholder: String

        /// Info tool tip title.
        public var title: String?

        /// Info tool tip additional brief information that will be shown after `title`.
        public var additionalInformation: String?

        /// Info tool tip view that will be show after `additionalInformation`.
        public var infoToolTipView: AnyView?

        /// Additional view that will be placed on the left side, inside the borders.
        public var leftView: AnyView?

        /// Additional view that will be placed on the right side, inside the borders.
        public var rightView: AnyView?

        /// Error message that will be shown when state changes to error.
        public var errorMessage: String?

        /// Helper message.
        public var helpMessage: String?

        /// Flag indicating if input changes should be animated.
        public var isAnimated: Bool

        public init() {
            placeholder = ""
            title = nil
            additionalInformation = nil
            infoToolTipView = nil
            leftView = nil
            rightView = nil
            errorMessage = nil
            helpMessage = nil
            isAnimated = true
        }
        
        public init(
            placeholder: String = "",
            title: String? = nil,
            additionalInformation: String? = nil,
            infoToolTipView: AnyView? = nil,
            leftView: AnyView? = nil,
            rightView: AnyView? = nil,
            errorMessage: String? = nil,
            helpMessage: String? = nil,
            isAnimated: Bool = true
        ) {
            self.placeholder = placeholder
            self.title = title
            self.additionalInformation = additionalInformation
            self.infoToolTipView = infoToolTipView.flatMap(AnyView.init)
            self.leftView = leftView
            self.rightView = rightView
            self.errorMessage = errorMessage
            self.helpMessage = helpMessage
            self.isAnimated = isAnimated
        }

        public init(
            placeholder: String = "",
            title: String? = nil,
            additionalInformation: String? = nil,
            infoToolTipView: AnyView? = nil,
            iconLeft: Image?,
            iconRight: Image? = nil,
            errorMessage: String? = nil,
            helpMessage: String? = nil,
            isAnimated: Bool = true
        ) {
            self.placeholder = placeholder
            self.title = title
            self.additionalInformation = additionalInformation
            self.infoToolTipView = infoToolTipView
            self.leftView = iconLeft.flatMap(AnyView.init)
            self.rightView = iconRight.flatMap(AnyView.init)
            self.errorMessage = errorMessage
            self.helpMessage = helpMessage
            self.isAnimated = isAnimated
        }

        public init(
            placeholder: String = "",
            title: String? = nil,
            additionalInformation: String? = nil,
            infoToolTipView: AnyView? = nil,
            leftPriceSymbol: String? = nil,
            rightPriceSymbol: String?,
            prefix: String? = nil,
            suffix: String? = nil,
            errorMessage: String? = nil,
            helpMessage: String? = nil,
            isAnimated: Bool = true
        ) {
            self.placeholder = placeholder
            self.title = title
            self.additionalInformation = additionalInformation
            self.infoToolTipView = infoToolTipView
            self.leftView = leftPriceSymbol.flatMap(Text.init).flatMap(AnyView.init)
            self.rightView = rightPriceSymbol.flatMap(Text.init).flatMap(AnyView.init)
            self.errorMessage = errorMessage
            self.helpMessage = helpMessage
            self.isAnimated = isAnimated
        }
        
        /// Plain TextField configuration.
        public static let `default` = InputConfiguration(
            placeholder: "",
            title: nil,
            additionalInformation: nil,
            infoToolTipView: nil,
            iconLeft: nil,
            iconRight: nil,
            errorMessage: nil,
            helpMessage: nil,
            isAnimated: true
        )

        /// Common search TextField configuration.
        public static let searchTextField = InputConfiguration(
            placeholder: NSLocalizedString(
                "InputConfiguration.Title.Search",
                value: "Search",
                comment: ""
            ),
            title: nil,
            additionalInformation: nil,
            infoToolTipView: nil,
            iconLeft: Image(systemName: "magnifyingglass"),
            iconRight: nil,
            errorMessage: nil,
            helpMessage: nil,
            isAnimated: true
        )

        /// Configuration for a TextField that will be used inside a form.
        public static func form(
            placeholder: String = "",
            title: String,
            additionalInformation: String? = nil,
            leftView: AnyView? = nil,
            rightView: AnyView? = nil,
            errorMessage: String? = nil,
            helpMessage: String? = nil
        ) -> InputConfiguration {
            InputConfiguration(
                placeholder: placeholder,
                title: title,
                additionalInformation: additionalInformation,
                infoToolTipView: nil,
                leftView: leftView,
                rightView: rightView,
                errorMessage: errorMessage,
                helpMessage: helpMessage,
                isAnimated: true
            )
        }

        /// Configuration for a TextField that will be used to gather numeric values.
        public static func decimal(
            placeholder: String = "",
            title: String = "",
            additionalInformation: String? = nil,
            leftSymbol: String? = nil,
            rightSymbol: String? = nil,
            errorMessage: String? = nil,
            helpMessage: String? = nil
        ) -> InputConfiguration {
            InputConfiguration(
                placeholder: placeholder,
                title: title,
                additionalInformation: additionalInformation,
                infoToolTipView: nil,
                leftView: leftSymbol.flatMap(Text.init).flatMap(AnyView.init),
                rightView: rightSymbol.flatMap(Text.init).flatMap(AnyView.init),
                errorMessage: errorMessage,
                helpMessage: helpMessage,
                isAnimated: true
            )
        }
    }
}
