import Foundation
import SwiftUI

/// Minimum height reserved for text field in order to keep it elegant.
private let textFieldMinHeight = 28.0

extension Warp {
    /// Text field style that will be used internally.
    /// Responsible for configuring text field inside the borders.
    struct InnerInputStyle: TextFieldStyle {
        /// State of input.
        let state: Warp.InputState
        
        /// View that can be added as a helper in left side of the text field.
        let leftView: AnyView?
        
        /// View that can be added as a helper in right side of the text field.
        let rightView: AnyView?

        private var cornerRadius: CGFloat {
            4.0
        }

        public func _body(configuration: TextField<Self._Label>) -> some View {
            HStack(spacing: 8) {
                if let leftView = leftView {
                    createToolbarView(from: leftView)
                }

                configuration
                    .frame(minHeight: textFieldMinHeight, maxHeight: .infinity)
                    .font(.callout)

                if let rightView = rightView {
                    createToolbarView(from: rightView)
                }
            }
            .padding(.horizontal, state.horizontalPadding)
            .overlay(overlayView)
            .background(state.backgroundColor)
            .cornerRadius(cornerRadius)
        }

        private var overlayView: some View {
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(state.inputBorderColor, lineWidth: state.inputBorderWidth)
        }

        private func createToolbarView(from toolbarView: some View) -> some View {
            return toolbarView
                .foregroundColor(FinnColors.gray500)
                .inputAdditionalView()
        }
    }
}

extension TextFieldStyle where Self == Warp.InnerInputStyle {
    /// A text field style with ability to add arbitrary view in left or right side.
    static func innerStyle(
        state: Warp.InputState,
        leftView: AnyView? = nil,
        rightView: AnyView? = nil
    ) -> Warp.InnerInputStyle {
        Warp.InnerInputStyle(
            state: state,
            leftView: leftView,
            rightView: rightView
        )
    }

    /// A text field style with ability to add arbitrary view in left or right side.
    static func innerStyle(
        state: Warp.InputState,
        leftView: some View,
        rightView: some View
    ) -> Warp.InnerInputStyle {
        Warp.InnerInputStyle(
            state: state,
            leftView: AnyView(leftView),
            rightView: AnyView(rightView)
        )
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
        self == .readOnly ? 4 : 8
    }
}
