import SwiftUI

public struct VerifyIdentityStateView: View {

    let eidProvider: String
    let verifyAction: (@Sendable () -> Void)

    public init(
        eidProvider: String,
        verifyAction: @Sendable @escaping () -> Void
    ) {
        self.eidProvider = eidProvider
        self.verifyAction = verifyAction
    }

    public var body: some View {
        let actionTitle = Warp.Strings.patternStateVerifyIdentityAction.localized.replacingOccurrences(of: "{eid_provider}", with: eidProvider)
        StateView(
            image: .icon(.verification),
            title: Warp.Strings.patternStateVerifyIdentityTitle.localized,
            description: Warp.Strings.patternStateVerifyIdentityDescription.localized,
            actionButton: .init(title: actionTitle, action: verifyAction)
        )
    }
}

#Preview {
    VerifyIdentityStateView(eidProvider: "BankID", verifyAction: {
        print("Verify Action") // swiftlint:disable:this no_print
    })
}
