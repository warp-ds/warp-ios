import Foundation
import SwiftUI

extension Warp {
    /// <#Description#>
    public struct InputStyle: TextFieldStyle {
        /// <#Description#>
        public static let inputDefaultInactiveState = InputState.normal

        /// <#Description#>
        private let config: InputConfiguration

        /// <#Description#>
        public var text: Binding<String>

        /// <#Description#>
        private var state: Binding<InputState>

        /// <#Description#>
        @FocusState private var isFocused: Bool

        /// <#Description#>
        private let colorProvider: ColorProvider

        public init(
            configuration: Warp.InputConfiguration,
            text: Binding<String>,
            state: Binding<Warp.InputState>,
            colorProvider: ColorProvider
        ) {
            self.config = configuration
            self.text = text
            self.colorProvider = colorProvider
            self.state = state
        }

        public init(
            configuration: Warp.InputConfiguration,
            text: Binding<String>,
            state: Warp.InputState = inputDefaultInactiveState,
            colorProvider: ColorProvider
        ) {
            self.config = configuration
            self.text = text
            self.colorProvider = colorProvider

            var tempState = state

            self.state = Binding {
                return tempState
            } set: { newValue in
                tempState = newValue
            }
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
                                state.wrappedValue = .normal
                            }
                        }

                        if config.isAnimated {
                            withAnimation {
                                updateState()
                            }
                        } else {
                            updateState()
                        }
                    }
                    .textFieldStyle(
                        .innerStyle(
                            state: state.wrappedValue,
                            lineLimit: config.lineLimit
                        )
                    )

                helperTextView
            }
            .onTapGesture {
                if !isFocused {
                    isFocused = true
                }
            }
            .disabled(state.wrappedValue.shouldBeDisabled)
            .accessibilityElement(children: .combine)
            .accessibilityRepresentation {
                TextField(config.placeholder, text: text)
                    .accessibilityInputLabels(accessibilityInformation)
                    .accessibilityLabel(accessibilityInformation.joined(separator: ", "))
                    .accessibilityHint(config.placeholder)
            }
        }

        /// Information that will be produced for Accessibility engine based on current configuration.
        private var accessibilityInformation: [String] {
            var inputLabels: [String] = []

            if let title = config.title {
                inputLabels.append(title)
            }

            if let additionalInformation = config.additionalInformation {
                inputLabels.append(additionalInformation)
            }

            return inputLabels
        }

        // MARK: - TopView

        private var topView: some View {
            ToolTipView(
                title: config.title,
                additionalInformation: config.additionalInformation,
                infoToolTipView: config.infoToolTip,
                colorProvider: colorProvider
            )
        }

        // MARK: - Helper text

        private var helperTextView: some View {
            HelperInformationView(
                state: state.wrappedValue,
                errorMessage: config.errorMessage,
                helpMessage: config.helpMessage
            )
        }
    }
}

extension TextFieldStyle where Self == Warp.InputStyle {
    /// <#Description#>
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

    /// <#Description#>
    public static func warp(
        configuration: Warp.InputConfiguration,
        text: Binding<String>,
        state: Warp.InputState = .normal,
        colorProvider: ColorProvider
    ) -> Warp.InputStyle {
        Warp.InputStyle(
            configuration: configuration,
            text: text,
            state: state,
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
    fileprivate var shouldBeDisabled: Bool {
        let isDisabled = self == .disabled
        lazy var isReadOnly = self == .readOnly

        return isDisabled || isReadOnly
    }
}
