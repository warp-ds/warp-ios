import SwiftUI
import Combine

extension Warp {
    /// Inactive state of TextField.
    public static let textFieldDefaultInactiveState = TextFieldState.normal(.none)

    /// A control that displays an editable text with `Warp` designed interface.
    public struct TextField: View {
        /// TextField configurations.
        private let configuration: TextFieldConfiguration

        /// One-way binding TextField text.
        private var text: Binding<String>

        /// Two-way binding TextField state.
        private var state: Binding<TextFieldState>
        
        /// State property that will act as a workaround for handling not bounded state situation.
        @State private var __state: TextFieldState?

        /// Object responsible for providing needed colors.
        private let colorProvider: ColorProvider

        public init(
            placeholder: String = "",
            title: String? = nil,
            additionalInformation: String? = nil,
            infoToolTipView: AnyView? = nil,
            leftView: AnyView? = nil,
            rightView: AnyView? = nil,
            informationState: Warp.TextField.InformationState = .none,
            isAnimated: Bool = true,
            text: Binding<String>,
            state: Binding<TextFieldState>,
            colorProvider: ColorProvider = Warp.Color
        ) {
            self.configuration = TextFieldConfiguration(
                placeholder: placeholder,
                title: title,
                additionalInformation: additionalInformation,
                infoToolTipView: infoToolTipView,
                leftView: leftView,
                rightView: rightView,
                informationState: informationState,
                isAnimated: isAnimated
            )

            self.text = text
            self.state = state
            self.colorProvider = colorProvider
        }

        public init(
            placeholder: String = "",
            title: String? = nil,
            additionalInformation: String? = nil,
            infoToolTipView: AnyView? = nil,
            leftView: AnyView? = nil,
            rightView: AnyView? = nil,
            informationState: Warp.TextField.InformationState = .none,
            isAnimated: Bool = true,
            text: Binding<String>,
            state: TextFieldState = Warp.textFieldDefaultInactiveState,
            colorProvider: ColorProvider = Warp.Color
        ) {
            self.configuration = TextFieldConfiguration(
                placeholder: placeholder,
                title: title,
                additionalInformation: additionalInformation,
                infoToolTipView: infoToolTipView,
                leftView: leftView,
                rightView: rightView,
                informationState: informationState,
                isAnimated: isAnimated
            )

            self.text = text
            self.colorProvider = colorProvider
            __state = state
            self.state = .constant(state)
        }

        public init(
            config: TextFieldConfiguration,
            text: Binding<String>,
            state: Binding<TextFieldState>,
            colorProvider: ColorProvider = Warp.Color
        ) {
            self.configuration = config
            self.text = text
            self.state = state
            self.colorProvider = colorProvider
        }

        public var body: some View {
            let state: Binding<Warp.TextFieldState> = {
                if let _state = self.__state {
                    return Binding(
                        get: { _state },
                        set: { self.__state = $0 }
                    )
                } else {
                    return self.state
                }
            }()

            SwiftUI.TextField(
                configuration.placeholder,
                text: text
            )
            .textFieldStyle(
                .warp(
                    configuration: configuration,
                    text: text.wrappedValue,
                    state: state,
                    colorProvider: colorProvider
                )
            )
        }
    }
}

private struct WarpTextFieldPreview: PreviewProvider {
    private static let colorProvider = Warp.Color

    static var previews: some View {
        ScrollView(showsIndicators: false) {
            VStack (alignment: .leading) {
                ForEach(Warp.TextFieldState.allCases, id: \.self) { state in
                    createView(for: state)
                }
            }
        }
    }

    private static func createView(for state: Warp.TextFieldState) -> some View {
        var text = state.title

        let bindingText = Binding {
            text
        } set: { newValue in
            text = newValue
        }

        return GroupBox(
            content: {
                Warp.TextField(text: bindingText, state: state, colorProvider: colorProvider)
            }, label: {
                Text(state.title)
            }
        )
    }
}

extension Warp.TextFieldState {
    fileprivate static let allCases: [Warp.TextFieldState] = [
        .normal(.none),
        .active(.none),
        .disabled,
        .normal(.error("Error")),
        .readOnly
    ]
}

extension Warp.TextFieldState {
    fileprivate var title: String {
        String(describing: self).localizedCapitalized
    }
}
