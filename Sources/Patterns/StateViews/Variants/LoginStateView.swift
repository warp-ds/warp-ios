import SwiftUI

public struct LoginStateView: View, StateViewConfigurable {

    public var configuration: StateViewConfiguration

    public init(
        loginAction: @Sendable @escaping () -> Void,
        createAccountAction: @Sendable @escaping () -> Void
    ) {
        configuration = StateViewConfiguration(
            image: .icon(.user),
            title: Warp.Strings.patternStateLoginTitle.localized,
            description: Warp.Strings.patternStateLoginDescription.localized,
            actionButton: .init(title: Warp.Strings.patternStateLoginAction.localized, action: loginAction),
            quietButton: .init(title: Warp.Strings.patternStateLoginCreateAccountAction.localized, action: createAccountAction),
            showLogo: true
        )
    }

    public var body: some View {
        StateView(configuration: configuration)
    }
}

#Preview {
    LoginStateView(
        loginAction: {
            print("Login Action") // swiftlint:disable:this no_print
        },
        createAccountAction: {
            print("Create Account Action") // swiftlint:disable:this no_print
        }
    )
}
