import SwiftUI

/// A login state view that presents a user icon, localized title and description,
/// along with primary and secondary action buttons for login and account creation, styled for WARP.
/// This view also displays the brand logo.
///
/// **Usage:**
/// ```
/// LoginStateView(
///    loginAction: {
///       print("Login tapped")
///    },
///    createAccountAction: {
///       print("Create Account tapped")
///    }
/// )
/// ```
public struct LoginStateView: View, StateViewConfigurable {

    public var configuration: StateViewConfiguration

    /// Initializes a `LoginStateView` with provided actions for login and creating an account.
    ///
    /// - Parameters:
    ///   - loginAction: Closure called on login button tap.
    ///   - createAccountAction: Closure called on create account button tap.
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
