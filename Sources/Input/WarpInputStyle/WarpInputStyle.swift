import Foundation
import SwiftUI

extension Warp {
    /// Inactive state of input.
    public static let inputDefaultInactiveState = InputState.normal

    /// Style that is responsible to transform TextField into warp design system input.
    public struct InputStyle: TextFieldStyle {
        /// Input configurations.
        private let configuration: InputConfiguration

        /// One-way binding of input text.
        public var text: Binding<String>

        /// Two-way binding of input state.
        private var state: Binding<InputState>

        /// Flag indicating if input is focused.
        @FocusState private var isFocused: Bool

        /// Object responsible for providing needed colors.
        private let colorProvider: ColorProvider

        public init(
            configuration: Warp.InputConfiguration,
            text: Binding<String>,
            state: Binding<Warp.InputState>,
            colorProvider: ColorProvider
        ) {
            self.configuration = configuration
            self.text = text
            self.colorProvider = colorProvider
            self.state = state
        }

        public func _body(configuration: TextField<Self._Label>) -> some View {
            VStack(alignment: .leading) {
                topView

                configuration
                    .body
                    .focused($isFocused) { isFocused in
                        let updateState = {
                            if isFocused {
                                state.wrappedValue = .active
                            } else {
                                state.wrappedValue = inputDefaultInactiveState
                            }
                        }

                        if self.configuration.isAnimated {
                            withAnimation(.smooth) {
                                updateState()
                            }
                        } else {
                            updateState()
                        }
                    }
                    .textFieldStyle(
                        .innerStyle(
                            state: state.wrappedValue,
                            leftView: self.configuration.leftView,
                            rightView: self.configuration.rightView
                        )
                    )

                helperTextView
            }
            .frame(minHeight: 34, maxHeight: .infinity)
            .disabled(state.wrappedValue.shouldBeDisabled)
            .onTapGesture {
                // Not checking for stateful disable logic, since whole will be disabled.
                if !isFocused {
                    isFocused = true
                }
            }
            .accessibilityElement(children: .combine)
            .accessibilityRepresentation {
                TextField(self.configuration.placeholder, text: text)
                    .accessibilityInputLabels(accessibilityInformation)
                    .accessibilityLabel(accessibilityInformation.joined(separator: ", "))
                    .accessibilityHint(self.configuration.placeholder)
            }
        }

        /// Information that will be produced for Accessibility engine based on current configuration.
        private var accessibilityInformation: [String] {
            var inputLabels: [String] = []

            if let title = configuration.title {
                inputLabels.append(title)
            }

            if let additionalInformation = configuration.additionalInformation {
                inputLabels.append(additionalInformation)
            }

            if let stateTitle = state.wrappedValue.stateTitle {
                inputLabels.append(stateTitle)
            }

            return inputLabels
        }

        // MARK: - TopView

        private var topView: some View {
            ToolTipView(
                title: configuration.title,
                additionalInformation: configuration.additionalInformation,
                infoToolTipView: configuration.infoToolTipView,
                colorProvider: colorProvider
            )
        }

        // MARK: - Helper text

        private var helperTextView: some View {
            HelperInformationView(
                state: state.wrappedValue,
                errorMessage: configuration.errorMessage,
                helpMessage: configuration.helpMessage
            )
        }
    }
}

// Variants + syntactic sugar.
extension TextFieldStyle where Self == Warp.InputStyle {
    /// Style that is responsible for transforming TextField to warp designed TextField.
    /// TextField will be wrapped inside borders with additional arbitrary views.
    public static func warp(
        placeholder: String = "",
        title: String? = nil,
        additionalInformation: String? = nil,
        infoToolTipView: AnyView? = nil,
        iconLeft: Image? = nil,
        iconRight: Image? = nil,
        errorMessage: String? = nil,
        helpMessage: String? = nil,
        isAnimated: Bool = true,
        text: Binding<String>,
        state: Binding<Warp.InputState>,
        colorProvider: ColorProvider
    ) -> Warp.InputStyle {
        let configuration = Warp.InputConfiguration(
            placeholder: placeholder,
            title: title,
            additionalInformation: additionalInformation,
            infoToolTipView: infoToolTipView,
            iconLeft: iconLeft,
            iconRight: iconRight,
            errorMessage: errorMessage,
            helpMessage: helpMessage,
            isAnimated: isAnimated
        )

        return Warp.InputStyle(
            configuration: configuration,
            text: text,
            state: state,
            colorProvider: colorProvider
        )
    }

    /// Style that is responsible for transforming TextField to warp designed TextField.
    /// TextField will be wrapped inside borders with additional arbitrary views.
    public static func warp(
        placeholder: String = "",
        title: String? = nil,
        additionalInformation: String? = nil,
        infoToolTipView: AnyView? = nil,
        iconLeft: Image? = nil,
        iconRight: Image? = nil,
        prefix: String? = nil,
        suffix: String? = nil,
        errorMessage: String? = nil,
        helpMessage: String? = nil,
        isAnimated: Bool = true,
        text: Binding<String>,
        state: Warp.InputState = Warp.inputDefaultInactiveState,
        colorProvider: ColorProvider
    ) -> Warp.InputStyle {
        let configuration = Warp.InputConfiguration(
            placeholder: placeholder,
            title: title,
            additionalInformation: additionalInformation,
            infoToolTipView: infoToolTipView,
            iconLeft: iconLeft,
            iconRight: iconRight,
            errorMessage: errorMessage,
            helpMessage: helpMessage,
            isAnimated: isAnimated
        )

        var tempState = state

        let bindingState = Binding {
            return tempState
        } set: { newValue in
            tempState = newValue
        }

        return Warp.InputStyle(
            configuration: configuration,
            text: text,
            state: bindingState,
            colorProvider: colorProvider
        )
    }

    /// Style that is responsible for transforming TextField to warp designed TextField.
    /// TextField will be wrapped inside borders with additional arbitrary views.
    public static func warp(
        configuration: Warp.InputConfiguration,
        text: Binding<String>,
        state: Binding<Warp.InputState>,
        colorProvider: ColorProvider
    ) -> Warp.InputStyle {
        Warp.InputStyle(
            configuration: configuration,
            text: text,
            state: state,
            colorProvider: colorProvider
        )
    }

    /// Style that is responsible for transforming TextField to warp designed TextField.
    /// TextField will be wrapped inside borders with additional arbitrary views.
    public static func warp(
        configuration: Warp.InputConfiguration,
        text: Binding<String>,
        state: Warp.InputState = Warp.inputDefaultInactiveState,
        colorProvider: ColorProvider
    ) -> Warp.InputStyle {
        var tempState = state

        let bindingState = Binding {
            return tempState
        } set: { newValue in
            tempState = newValue
        }

        return Warp.InputStyle(
            configuration: configuration,
            text: text,
            state: bindingState,
            colorProvider: colorProvider
        )
    }
}

extension View {
    fileprivate func focused(
        _ condition: FocusState<Bool>.Binding,
        onFocus: @escaping (Bool) -> Void
    ) -> some View {
        focused(condition)
            .onChange(of: condition.wrappedValue) { value in
                onFocus(value == true)
            }
    }
}

extension Warp.InputState {
    /// <#Description#>
    fileprivate var shouldBeDisabled: Bool {
        let isDisabled = self == .disabled
        lazy var isReadOnly = self == .readOnly

        return isDisabled || isReadOnly
    }
    
    /// <#Description#>
    fileprivate var stateTitle: String? {
        switch self {
            case .disabled:
                return NSLocalizedString(
                    "Input.Disabled.Title",
                    value: "Currently disabled",
                    comment: ""
                )

            case .error:
                return NSLocalizedString(
                    "Input.Error.Title",
                    value: "Has error",
                    comment: ""
                )

            case .readOnly:
                return NSLocalizedString(
                    "Input.ReadOnly.Title",
                    value: "Read only",
                    comment: ""
                )

            default:
                return nil
        }
    }
}