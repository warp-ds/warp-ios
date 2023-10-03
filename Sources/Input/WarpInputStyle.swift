import Foundation
import SwiftUI

extension Warp {
    struct InnerInputStyle: TextFieldStyle {
        /// <#Description#>
        let state: Warp.InputState
        
        /// <#Description#>
        let lineLimit: ClosedRange<UInt8>

        private var cornerRadius: CGFloat {
            4.0
        }

        public func _body(configuration: TextField<Self._Label>) -> some View {
            configuration
                .modifier(LineLimitModifier(lineLimit: lineLimit))
                .font(.callout)
                .padding(.horizontal, state.horizontalPadding)
                .background(state.backgroundColor)
                .overlay(overlayView)
                .cornerRadius(cornerRadius)
        }

        private var overlayView: some View {
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(state.inputBorderColor, lineWidth: state.inputBorderWidth)
        }
    }
}

extension TextFieldStyle where Self == Warp.InnerInputStyle {
    /// <#Description#>
    static func innerStyle(
        state: Warp.InputState,
        lineLimit: ClosedRange<UInt8>
    ) -> Warp.InnerInputStyle {
        Warp.InnerInputStyle(
            state: state,
            lineLimit: lineLimit
        )
    }
}

private struct LineLimitModifier: ViewModifier {
    let lineLimit: ClosedRange<UInt8>

    func body(content: Content) -> some View {
        if #available(iOS 16.0, *) {
            let lineLimitRange = ClosedRange<Int>(lineLimit)

            return content
                .lineLimit(lineLimitRange)
        }

        return content
    }
}

extension Warp.InputState {
    /// <#Description#>
    fileprivate var inputBorderColor: Color {
        let colorProvider = Config.colorProvider

        switch self {
            case .normal:
                return colorProvider.inputBorder

            case .active:
                return colorProvider.inputBorderActive

            case .disabled:
                return colorProvider.inputBorderDisabled

            case .error:
                return colorProvider.inputBorderNegative

            case .readOnly:
                return colorProvider.inputBorder
        }
    }

    /// <#Description#>
    fileprivate var backgroundColor: Color {
        let colorProvider = Config.colorProvider

        if self == .disabled {
            return colorProvider.inputBackgroundDisabled
        }

        return colorProvider.inputBackground
    }

    /// <#Description#>
    fileprivate var inputBorderWidth: CGFloat {
        switch self {
            case .normal:
                return 2

            case .active:
                return 4

            case .disabled:
                return 2

            case .error:
                return 2

            case .readOnly:
                return 0
        }
    }

    fileprivate var horizontalPadding: CGFloat {
        self == .readOnly ? 0 : 8
    }
}

extension ClosedRange where Bound == Int {
    fileprivate init(_ range: ClosedRange<UInt8>) {
        self.init(uncheckedBounds: (lower: Int(range.lowerBound), upper: Int(range.upperBound)))
    }
}
