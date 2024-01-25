import SwiftUI
import Warp

struct TextFieldView: View {
    @State private var state = Warp.TextFieldState.normal
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

    private static let defaultConfiguration = Warp.TextFieldConfiguration.default

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack (alignment: .leading) {
                ForEach(Warp.TextFieldState.allCases, id: \.self) { state in
                    createView(for: state)
                }

                GroupBox(
                    content: {
                        Warp.TextField.createSearchTextField(text: $searchTextFieldText)
                            .padding()
                    }, label: {
                        Text("Search TextField")
                    }
                )

                GroupBox(
                    content: {
                        Warp.TextField.createWithDiscardButton(
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
                        Warp.TextField.createSecureTextField(
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
                        Warp.TextField.createDecimalTextField(
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
                        Warp.TextField.createDecimalTextField(
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
                        Warp.TextField(
                            placeholder: "Warp",
                            title: "WarpTextField",
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
                        Warp.TextField(
                            placeholder: "Warp",
                            title: "WarpTextField",
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
                        SwiftUI.TextField("", text: $styleTextFieldText)
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
                            SwiftUI.TextField("", text: $multilineTextFieldText, axis: .vertical)
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

    private func createView(for state: Warp.TextFieldState) -> some View {
        var text = state.title

        let bindingText = Binding {
            text
        } set: { newValue in
            text = newValue
        }

        return GroupBox(
            content: {
                Warp.TextField(text: bindingText, state: state)
                    .padding()
            }, label: {
                Text(state.title)
            }
        )
    }
}

#Preview {
    TextFieldView()
}

extension Warp.TextFieldState: CaseIterable {
    public static var allCases: [Warp.TextFieldState] = [
        .normal,
        .active,
        .disabled,
        .error,
        .readOnly
    ]
}

extension Warp.TextFieldState {
    fileprivate var title: String {
        String(describing: self).localizedCapitalized
    }
}
