import SwiftUI

public struct VerifyIdentityStateView: View, StateViewConfigurable {

    public var configuration: StateViewConfiguration

    public init(
        eidProvider: String,
        verifyAction: @Sendable @escaping () -> Void
    ) {
        configuration = StateViewConfiguration(
            image: .icon(.verification),
            title: Warp.Strings.patternStateVerifyIdentityTitle.localized,
            description: Warp.Strings.patternStateVerifyIdentityDescription.localized,
            actionButton: .init(
                title: Warp.Strings.patternStateVerifyIdentityAction.localized.replacingOccurrences(of: "{eid_provider}", with: eidProvider),
                action: verifyAction
            )
        )
    }

    public var body: some View {
        StateView(configuration: configuration)
    }
}

#Preview {
    VerifyIdentityStateView(eidProvider: "BankID", verifyAction: {
        print("Verify Action") // swiftlint:disable:this no_print
    })
}
