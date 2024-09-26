import Foundation
import SwiftUI

/// Minimum height reserved for TextField in order to keep it elegant.
private let textFieldMinHeight = 34.0

extension Warp {
    /// Style that is responsible to transform TextField into warp design system TextField.
    @MainActor
    public struct TextFieldStyle: @preconcurrency SwiftUI.TextFieldStyle {
        /// TextField configurations.
        private let configuration: TextFieldConfiguration

        /// TextField text.
        /// It will be consumed in accessibility engine in order to proxy TextField interactions to a TextField.
        private var text: String

        /// Two-way binding of TextField state.
        @Binding private var state: TextFieldState

        /// Flag indicating if TextField is focused.
        @FocusState private var isFocused: Bool

        /// Object responsible for providing needed colors.
        private let colorProvider: ColorProvider

        public init(
            configuration: Warp.TextFieldConfiguration,
            text: String,
            state: Binding<Warp.TextFieldState>,
            colorProvider: ColorProvider
        ) {
            self.configuration = configuration
            self.text = text
            self._state = state
            self.colorProvider = colorProvider
        }

        public func _body(configuration: SwiftUI.TextField<Self._Label>) -> some View {
            VStack(alignment: .leading) {
                topView

                configuration
                    .body
                    .textFieldStyle(
                        .innerStyle(
                            state: state,
                            leftView: self.configuration.leftView,
                            rightView: self.configuration.rightView,
                            colorProvider: colorProvider
                        )
                    )
                    .focused($isFocused) { isFocused in
                        let updateState = {
                            let informationState = state.informationState

                            if isFocused {
                                if let informationState {
                                    state = .active(informationState)
                                } else {
                                    state = .active(.none)
                                }
                            } else {
                                if let informationState {
                                    state = .normal(informationState)
                                } else {
                                    state = textFieldDefaultInactiveState
                                }
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

                helperTextView
            }
            .frame(minHeight: textFieldMinHeight, maxHeight: .infinity)
            .disabled(state.shouldBeDisabled)
            .onTapGesture {
                // Not checking for stateful disable logic.
                if !isFocused {
                    isFocused = true
                }
            }
            .accessibilityElement(children: .combine)
            .accessibilityRepresentation {
                SwiftUI.TextField(self.configuration.placeholder, text: .constant(text))
                    .accessibilityInputLabels(accessibilityInformation)
                    .accessibilityLabel(accessibilityInformation.joined(separator: ", "))
                    .accessibilityHint(self.configuration.placeholder)
            }
        }

        /// Information that will be produced for Accessibility engine based on current configuration.
        private var accessibilityInformation: [String] {
            var textFieldLabels: [String] = []

            if let title = configuration.title {
                textFieldLabels.append(title)
            }

            if let additionalInformation = configuration.additionalInformation {
                textFieldLabels.append(additionalInformation)
            }

            if let description = state.description {
                textFieldLabels.append(description)
            }

            return textFieldLabels
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
                textFieldState: state,
                colorProvider: colorProvider
            )
        }
    }
}

// Variants + syntactic sugar.
@MainActor
extension SwiftUI.TextFieldStyle where Self == Warp.TextFieldStyle {
    /// Style that is responsible for transforming TextField to warp designed TextField.
    /// TextField will be wrapped inside borders with additional arbitrary views.
    public static func warp(
        placeholder: String = "",
        title: String? = nil,
        additionalInformation: String? = nil,
        infoToolTipView: AnyView? = nil,
        iconLeft: Image? = nil,
        iconRight: Image? = nil,
        informationState: Warp.TextField.InformationState = .none,
        isAnimated: Bool = true,
        text: String,
        state: Binding<Warp.TextFieldState> = .constant(Warp.textFieldDefaultInactiveState),
        colorProvider: ColorProvider
    ) -> Warp.TextFieldStyle {
        let configuration = Warp.TextFieldConfiguration(
            placeholder: placeholder,
            title: title,
            additionalInformation: additionalInformation,
            infoToolTipView: infoToolTipView,
            iconLeft: iconLeft,
            iconRight: iconRight,
            informationState: informationState,
            isAnimated: isAnimated
        )

        return Warp.TextFieldStyle(
            configuration: configuration,
            text: text,
            state: state,
            colorProvider: colorProvider
        )
    }

    /// Style that is responsible for transforming TextField to warp designed TextField.
    /// TextField will be wrapped inside borders with additional arbitrary views.
    public static func warp(
        configuration: Warp.TextFieldConfiguration,
        text: String,
        state: Binding<Warp.TextFieldState> = .constant(Warp.textFieldDefaultInactiveState),
        colorProvider: ColorProvider
    ) -> Warp.TextFieldStyle {
        Warp.TextFieldStyle(
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

extension Warp.TextFieldState {
    /// Flag indicating TextField should be disabled based on current state.
    fileprivate var shouldBeDisabled: Bool {
        let isDisabled = self == .disabled
        lazy var isReadOnly = self == .readOnly

        return isDisabled || isReadOnly
    }

    fileprivate var description: String? {
        switch self {
            case .disabled:
                return NSLocalizedString(
                    "Warp.TextField.Disabled.Title",
                    value: "Currently disabled",
                    comment: ""
                )

            case .active(let state), .normal(let state):
                if case .error = state {
                    return NSLocalizedString(
                        "Warp.TextField.Error.Title",
                        value: "Has error",
                        comment: ""
                    )
                }

                return nil

            case .readOnly:
                return NSLocalizedString(
                    "Warp.TextField.ReadOnly.Title",
                    value: "Read only",
                    comment: ""
                )
        }
    }
}

extension Warp.TextFieldState {
    fileprivate var informationState: Warp.TextField.InformationState? {
        switch self {
            case .normal(let state), .active(let state):
                return state

            default:
                return nil
        }
    }
}
