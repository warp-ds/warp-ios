import SwiftUI

public struct VerifyIdentityStateView: View {

    let verifyAction: (@Sendable () -> Void)

    public init(verifyAction: @Sendable @escaping () -> Void) {
        self.verifyAction = verifyAction
    }

    public var body: some View {
        StateView(
            image: .icon(.verification),
            title: "Please verify yourself",
            description: "Before you make contact, you need to verify yourself. We do this so that the other person can be confident in who they are talking to.",
            actionButton: .init(title: "Verify using BankID", action: verifyAction)
        )
    }
}

#Preview {
    VerifyIdentityStateView(verifyAction: {
        print("Verify Action") // swiftlint:disable:this no_print
    })
}
