import SwiftUI
import Warp

struct InputView: View {
    @State private var state = Warp.InputState.normal
    private let colorProvider = Warp.Config.colorProvider

    @State private var randomUsageTextFieldText = ""
    @State private var searchTextFieldText = ""
    @State private var discardableTextFieldText = ""
    @State private var passwordTextFieldText = ""
    @State private var moneyTextFieldText = ""
    @State private var styleTextFieldText = ""
    @State private var multilineTextFieldText = ""
    @State private var isSecured = true

    @FocusState private var isFocused: Bool

    private static let defaultConfiguration = Warp.InputConfiguration.default

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack (alignment: .leading) {
                ForEach(Warp.InputState.allCases, id: \.self) { state in
                    createView(for: state)
                }

                GroupBox(
                    content: {
                        Warp.Input.createSearchTextField(text: $searchTextFieldText)
                            .padding()
                    }, label: {
                        Text("Search TextField")
                    }
                )

                GroupBox(
                    content: {
                        Warp.Input.createWithDiscardButton(
                            configuration: Self.defaultConfiguration,
                            text: $discardableTextFieldText,
                            state: .constant(.normal)
                        )
                        .padding()
                    }, label: {
                        Text("TextField with discardable button")
                    }
                )

                GroupBox(
                    content: {
                        Warp.Input.createSecureTextField(
                            configuration: Self.defaultConfiguration,
                            text: $passwordTextFieldText,
                            state: .constant(.normal),
                            isSecured: $isSecured
                        )

                        .padding()
                    }, label: {
                        Text("Password TextField")
                    }
                )

                GroupBox(
                    content: {
                        Warp.Input.createDecimalTextField(
                            text: $moneyTextFieldText,
                            leftSymbol: "kr"
                        )
                        .padding()
                    }, label: {
                        Text("Left kr TextField")
                    }
                )

                GroupBox(
                    content: {
                        Warp.Input.createDecimalTextField(
                            text: $moneyTextFieldText,
                            rightSymbol: "kr"
                        )
                        .padding()
                    }, label: {
                        Text("Right kr TextField")
                    }
                )

                GroupBox(
                    content: {
                        Warp.Input(
                            placeholder: "Warp",
                            title: "WarpInput",
                            additionalInformation: "Optional",
                            infoToolTipView: AnyView(Image(systemName: "exclamationmark.circle")),
                            leftView: AnyView(Image(systemName: "magnifyingglass")),
                            rightView: AnyView(Image(systemName: "xmark")),
                            errorMessage: "Error message",
                            helpMessage: "Help message",
                            text: $randomUsageTextFieldText
                        )
                        .padding()
                    }, label: {
                        Text("Random usage")
                    }
                )

                GroupBox(
                    content: {
                        Warp.Input(
                            placeholder: "Warp",
                            title: "WarpInput",
                            additionalInformation: "Optional",
                            infoToolTipView: AnyView(Image(systemName: "exclamationmark.circle")),
                            leftView: AnyView(Image(systemName: "magnifyingglass")),
                            rightView: AnyView(Image(systemName: "xmark")),
                            errorMessage: "Error message",
                            helpMessage: "Help message",
                            text: $randomUsageTextFieldText
                        )
                        .padding()
                    }, label: {
                        Text("Random usage")
                    }
                )

                GroupBox(
                    content: {
                        TextField("", text: $styleTextFieldText)
                            .focused($isFocused)
                            .textFieldStyle(
                                .warp(
                                    configuration: .default,
                                    text: styleTextFieldText,
                                    state: $state,
                                    colorProvider: colorProvider
                                )
                            )
                            .padding()
                    }, label: {
                        Text("TextField style")
                    }
                )

                if #available(iOS 16.0, *) {
                    GroupBox(
                        content: {
                            TextField("", text: $multilineTextFieldText, axis: .vertical)
                                .textFieldStyle(
                                    .warp(
                                        configuration: .default,
                                        text: multilineTextFieldText,
                                        colorProvider: colorProvider
                                    )
                                )
                                .lineLimit(...4)
                                .padding()
                        }, label: {
                            Text("Multiline TextField")
                        }
                    )
                }
            }
            .padding(.horizontal)
        }
    }

    private func createView(for state: Warp.InputState) -> some View {
        var text = state.title

        let bindingText = Binding {
            text
        } set: { newValue in
            text = newValue
        }

        return GroupBox(
            content: {
                Warp.Input(text: bindingText, state: state)
                    .padding()
            }, label: {
                Text(state.title)
            }
        )
    }
}

#Preview {
    InputView()
}

extension Warp.InputState: CaseIterable {
    public static var allCases: [Warp.InputState] = [
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
