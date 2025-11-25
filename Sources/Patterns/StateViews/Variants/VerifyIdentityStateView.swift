import SwiftUI

/// A identify verification state that shows a verification icon, localized title and description,
/// and a customizable action button with the electronic ID (eID) provider name embedded in its title, styled for WARP.
///
/// **Usage:**
/// ```
/// VerifyIdentityStateView(
///    eidProvider: "BankID",
///    verifyAction: {
///       print("Verify tapped")
///    }
/// )
/// ```
public struct VerifyIdentityStateView: View, StateViewConfigurable {

    public var configuration: StateViewConfiguration

    /// Initializes a `VerifyIdentityStateView` with the electronic ID provider name and verify action.
    ///
    /// - Parameters:
    ///   - eidProvider: The electronic ID provider name to inject in the button title.
    ///   - verifyAction: Closure called when the verify button is tapped.
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
