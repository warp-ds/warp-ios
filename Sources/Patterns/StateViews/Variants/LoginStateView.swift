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
            title: "The marketplace of possibilities",
            description: "Log in to send messages, save favourites and searches. You'll also receive handy notifications for what's important to you.",
            actionButton: .init(title: "Log in", action: loginAction),
            secondaryButton: .init(title: "Create an account", action: createAccountAction),
            showVendEndorsement: true
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
