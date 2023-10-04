import Foundation
import struct SwiftUI.AnyView
import struct SwiftUI.Image
import struct SwiftUI.Text

extension Warp {
    /// <#Description#>
    public struct InputConfiguration {
        /// <#Description#>
        public var placeholder: String

        /// <#Description#>
        public var title: String?

        /// <#Description#>
        public var additionalInformation: String?

        /// <#Description#>
        public var infoToolTipView: AnyView?

        /// <#Description#>
        public var leftView: AnyView?

        /// <#Description#>
        public var rightView: AnyView?

        /// <#Description#>
        public var errorMessage: String?

        /// <#Description#>
        public var helpMessage: String?

        /// <#Description#>
        public var isAnimated: Bool

        /// <#Description#>
        public var lineLimit: ClosedRange<UInt8>

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
            lineLimit = .oneLineLimit
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
            isAnimated: Bool = true,
            lineLimit: ClosedRange<UInt8> = .oneLineLimit
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
            self.lineLimit = lineLimit
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
            isAnimated: Bool = true,
            lineLimit: ClosedRange<UInt8> = .oneLineLimit
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
            self.lineLimit = lineLimit
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
            isAnimated: Bool = true,
            lineLimit: ClosedRange<UInt8> = .oneLineLimit
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
            self.lineLimit = lineLimit
        }
        
        /// <#Description#>
        public static let `default` = InputConfiguration(
            placeholder: "",
            title: nil,
            additionalInformation: nil,
            infoToolTipView: nil,
            iconLeft: nil,
            iconRight: nil,
            errorMessage: nil,
            helpMessage: nil,
            isAnimated: true,
            lineLimit: .oneLineLimit
        )

        /// <#Description#>
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
            isAnimated: true,
            lineLimit: .oneLineLimit
        )

        /// <#Description#>
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
                isAnimated: true,
                lineLimit: .oneLineLimit
            )
        }

        /// <#Description#>
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
                isAnimated: true,
                lineLimit: .oneLineLimit
            )
        }
    }
}

extension ClosedRange where Bound == UInt8 {
    public static let oneLineLimit: ClosedRange<UInt8> = 1...1
}
