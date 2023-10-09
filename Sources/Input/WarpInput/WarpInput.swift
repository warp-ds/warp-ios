import SwiftUI
import Combine

extension Warp {
    /// Inactive state of input.
    public static let inputDefaultInactiveState = InputState.normal

    public struct Input: View {
        /// Input configurations.
        private let configuration: InputConfiguration

        /// One-way binding TextField text.
        public var text: Binding<String>

        /// Two-way binding input state.
        @Binding private var state: InputState

        /// Object responsible for providing needed colors.
        private let colorProvider: ColorProvider

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
            text: Binding<String>,
            state: Binding<InputState>,
            colorProvider: ColorProvider = Config.colorProvider
        ) {
            self.configuration = InputConfiguration(
                placeholder: placeholder,
                title: title,
                additionalInformation: additionalInformation,
                infoToolTipView: infoToolTipView,
                leftView: leftView,
                rightView: rightView,
                errorMessage: errorMessage,
                helpMessage: helpMessage,
                isAnimated: isAnimated
            )

            self.text = text
            self._state = state
            self.colorProvider = colorProvider
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
            text: Binding<String>,
            state: InputState = Warp.inputDefaultInactiveState,
            colorProvider: ColorProvider = Config.colorProvider
        ) {
            self.configuration = InputConfiguration(
                placeholder: placeholder,
                title: title,
                additionalInformation: additionalInformation,
                infoToolTipView: infoToolTipView,
                leftView: leftView,
                rightView: rightView,
                errorMessage: errorMessage,
                helpMessage: helpMessage,
                isAnimated: isAnimated
            )

            self.text = text

            var __state = state
            self._state = Binding(
                get: { __state },
                set: { __state = $0 }
            )

            self.colorProvider = colorProvider
        }

        public init(
            config: InputConfiguration,
            text: Binding<String>,
            state: Binding<InputState>,
            colorProvider: ColorProvider = Config.colorProvider
        ) {
            self.configuration = config
            self.text = text
            self._state = state
            self.colorProvider = colorProvider
        }

        public var body: some View {
            TextField(
                configuration.placeholder,
                text: text
            )
            .textFieldStyle(
                .warp(
                    configuration: configuration,
                    text: text.wrappedValue,
                    state: $state,
                    colorProvider: colorProvider
                )
            )
        }
    }
}

private struct WarpInputPreview: PreviewProvider {
    private static let colorProvider = Config.colorProvider

    static var previews: some View {
        ScrollView(showsIndicators: false) {
            VStack (alignment: .leading) {
                ForEach(Warp.InputState.allCases, id: \.self) { state in
                    createView(for: state)
                }
            }
        }
    }

    private static func createView(for state: Warp.InputState) -> some View {
        var text = state.title

        let bindingText = Binding {
            text
        } set: { newValue in
            text = newValue
        }

        return GroupBox(
            content: {
                Warp.Input(text: bindingText, state: state, colorProvider: colorProvider)
            }, label: {
                Text(state.title)
            }
        )
    }
}

extension Warp.InputState {
    fileprivate static var allCases: [Warp.InputState] = [
        .normal,
        .active,
        .disabled,
        .error,
        .readOnly
    ]
}

extension Warp.InputState {
    fileprivate var title: String {
        String(describing: self).localizedCapitalized
    }
}
