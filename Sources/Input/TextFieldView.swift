import Foundation
import SwiftUI


struct TextFieldView: View {
    /// <#Description#>
    let placeholder: String

    /// <#Description#>
    let text: Binding<String>

    /// <#Description#>
    let isAnimated: Bool

    /// <#Description#>
    let lineLimit: ClosedRange<UInt8>

    /// <#Description#>
    var isFocused: FocusState<Bool>.Binding

    /// <#Description#>
    @Binding var state: Warp.InputState

    private var inputBorderColor: Color {
        state.inputBorderColor
    }

    private var backgroundColor: Color {
        state.backgroundColor
    }

    private var inputBorderWidth: CGFloat {
        state.inputBorderWidth
    }

    private var shouldBeDisabled: Bool {
        state.shouldBeDisabled
    }

    private var horizontalPadding: CGFloat {
        state.horizontalPadding
    }

    private var cornerRadius: CGFloat {
        4.0
    }

    private var minHeight: CGFloat {
        28.0
    }

    var body: some View {
        TextField(
            placeholder,
            text: text,
            onEditingChanged: { startedEditing in
                let updateState = {
                    if startedEditing {
                        _state.wrappedValue = .active
                    } else {
                        _state.wrappedValue = .normal
                    }
                }

                if isAnimated {
                    withAnimation {
                        updateState()
                    }
                } else {
                    updateState()
                }
            }
        )
        .focused(isFocused)
        .modifier(LineLimitModifier(lineLimit: lineLimit))
        .font(.callout)
        .disabled(shouldBeDisabled)
        .padding(.horizontal, horizontalPadding)
        .frame(minHeight: minHeight, maxHeight: .infinity)
        .background(backgroundColor)
        .overlay(overlayView)
        .cornerRadius(cornerRadius)
    }

    private var overlayView: some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .stroke(inputBorderColor, lineWidth: inputBorderWidth)
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

    private var isDisabled: Bool {
        return self == .disabled
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

    fileprivate var shouldBeDisabled: Bool {
        let isDisabled = self == .disabled
        lazy var isReadOnly = self == .readOnly

        return isDisabled || isReadOnly
    }

    fileprivate var horizontalPadding: CGFloat {
        self == .readOnly ? 0 : 8
    }
}

extension ClosedRange where Bound == Int {
    init(_ range: ClosedRange<UInt8>) {
        self.init(uncheckedBounds: (lower: Int(range.lowerBound), upper: Int(range.upperBound)))
    }
}
