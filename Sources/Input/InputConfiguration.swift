import Foundation
import struct SwiftUI.AnyView
import struct SwiftUI.Image
import struct SwiftUI.Text

extension Warp {
    /// <#Description#>
    public struct InputConfiguration {
        /// <#Description#>
        public let placeholder: String

        /// <#Description#>
        public let title: String?

        /// <#Description#>
        public let additionalInformation: String?

        /// <#Description#>
        public let infoToolTipView: AnyView?

        /// <#Description#>
        public let leftView: AnyView?

        /// <#Description#>
        public let rightView: AnyView?

        /// <#Description#>
        public let prefix: String?

        /// <#Description#>
        public let suffix: String?
        
        /// <#Description#>
        public let errorMessage: String?
        
        /// <#Description#>
        public let helpMessage: String?
        
        /// <#Description#>
        public let isAnimated: Bool
        
        /// <#Description#>
        public let lineLimit: ClosedRange<UInt8>

        public init() {
            placeholder = ""
            title = nil
            additionalInformation = nil
            infoToolTipView = nil
            leftView = nil
            rightView = nil
            prefix = nil
            suffix = nil
            errorMessage = nil
            helpMessage = nil
            isAnimated = true
            lineLimit = 1...1
        }
        
        public init(
            placeholder: String = "",
            title: String? = nil,
            additionalInformation: String? = nil,
            infoToolTipImage: AnyView? = nil,
            leftView: AnyView? = nil,
            rightView: AnyView? = nil,
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
            self.infoToolTipView = infoToolTipImage.flatMap(AnyView.init)
            self.leftView = leftView
            self.rightView = rightView
            self.prefix = prefix
            self.suffix = suffix
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
            self.leftView = iconLeft.flatMap(AnyView.init)
            self.rightView = iconRight.flatMap(AnyView.init)
            self.prefix = prefix
            self.suffix = suffix
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
            self.prefix = prefix
            self.suffix = suffix
            self.errorMessage = errorMessage
            self.helpMessage = helpMessage
            self.isAnimated = isAnimated
            self.lineLimit = lineLimit
        }
    }
}

extension ClosedRange where Bound == UInt8 {
    public static let oneLineLimit: ClosedRange<UInt8> = 1...1
}
