import Foundation
import struct SwiftUI.AnyView
import struct SwiftUI.Image
import struct SwiftUI.Text

@MainActor extension Warp {
    /// Configurations that will be applied to TextField.
    public struct TextFieldConfiguration {
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
        public var informationState: Warp.TextField.InformationState

        /// Flag indicating if TextField changes should be animated.
        public var isAnimated: Bool

        public init() {
            placeholder = ""
            title = nil
            additionalInformation = nil
            infoToolTipView = nil
            leftView = nil
            rightView = nil
            informationState = .none
            isAnimated = true
        }
        
        public init(
            placeholder: String = "",
            title: String? = nil,
            additionalInformation: String? = nil,
            infoToolTipView: AnyView? = nil,
            leftView: AnyView? = nil,
            rightView: AnyView? = nil,
            informationState: Warp.TextField.InformationState = .none,
            isAnimated: Bool = true
        ) {
            self.placeholder = placeholder
            self.title = title
            self.additionalInformation = additionalInformation
            self.infoToolTipView = infoToolTipView.flatMap(AnyView.init)
            self.leftView = leftView
            self.rightView = rightView
            self.informationState = informationState
            self.isAnimated = isAnimated
        }

        public init(
            placeholder: String = "",
            title: String? = nil,
            additionalInformation: String? = nil,
            infoToolTipView: AnyView? = nil,
            iconLeft: Image?,
            iconRight: Image? = nil,
            informationState: Warp.TextField.InformationState = .none,
            isAnimated: Bool = true
        ) {
            self.placeholder = placeholder
            self.title = title
            self.additionalInformation = additionalInformation
            self.infoToolTipView = infoToolTipView
            self.leftView = iconLeft.flatMap(AnyView.init)
            self.rightView = iconRight.flatMap(AnyView.init)
            self.informationState = informationState
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
            informationState: Warp.TextField.InformationState = .none,
            isAnimated: Bool = true
        ) {
            self.placeholder = placeholder
            self.title = title
            self.additionalInformation = additionalInformation
            self.infoToolTipView = infoToolTipView
            self.leftView = leftPriceSymbol.flatMap(SwiftUI.Text.init).flatMap(AnyView.init)
            self.rightView = rightPriceSymbol.flatMap(SwiftUI.Text.init).flatMap(AnyView.init)
            self.informationState = informationState
            self.isAnimated = isAnimated
        }
        
        /// Plain TextField configuration.
        public static let `default` = TextFieldConfiguration(
            placeholder: "",
            title: nil,
            additionalInformation: nil,
            infoToolTipView: nil,
            iconLeft: nil,
            iconRight: nil,
            informationState: .none,
            isAnimated: true
        )

        /// Common search TextField configuration.
        public static let searchTextField = TextFieldConfiguration(
            placeholder: NSLocalizedString(
                "TextFieldConfiguration.Title.Search",
                value: "Search",
                comment: ""
            ),
            title: nil,
            additionalInformation: nil,
            infoToolTipView: nil,
            iconLeft: Image(systemName: "magnifyingglass"),
            iconRight: nil,
            informationState: .none,
            isAnimated: true
        )

        /// Configuration for a TextField that will be used inside a form.
        public static func form(
            placeholder: String = "",
            title: String,
            additionalInformation: String? = nil,
            leftView: AnyView? = nil,
            rightView: AnyView? = nil,
            informationState: Warp.TextField.InformationState = .none
        ) -> TextFieldConfiguration {
            TextFieldConfiguration(
                placeholder: placeholder,
                title: title,
                additionalInformation: additionalInformation,
                infoToolTipView: nil,
                leftView: leftView,
                rightView: rightView,
                informationState: informationState,
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
            informationState: Warp.TextField.InformationState = .none
        ) -> TextFieldConfiguration {
            TextFieldConfiguration(
                placeholder: placeholder,
                title: title,
                additionalInformation: additionalInformation,
                infoToolTipView: nil,
                leftView: leftSymbol.flatMap(SwiftUI.Text.init).flatMap(AnyView.init),
                rightView: rightSymbol.flatMap(SwiftUI.Text.init).flatMap(AnyView.init),
                informationState: informationState,
                isAnimated: true
            )
        }
    }
}
