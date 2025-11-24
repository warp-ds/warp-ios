import SwiftUI

public struct LoginStateView: View {

    let loginAction: (@Sendable () -> Void)
    let createAccountAction: (@Sendable () -> Void)

    public init(
        loginAction: @Sendable @escaping () -> Void,
        createAccountAction: @Sendable @escaping () -> Void
    ) {
        self.loginAction = loginAction
        self.createAccountAction = createAccountAction
    }

    public var body: some View {
        StateView(
            image: .icon(.user),
            title: Warp.Strings.patternStateLoginTitle.localized,
            description: Warp.Strings.patternStateLoginDescription.localized,
            actionButton: .init(title: Warp.Strings.patternStateLoginAction.localized, action: loginAction),
            quietButton: .init(title: Warp.Strings.patternStateLoginCreateAccountAction.localized, action: createAccountAction),
            showLogo: true
        )
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
