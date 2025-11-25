import SwiftUI


/// A offline state view that displays a WiFi icon, localized title and description,
/// along with a retry action button to recover from a network failure, styled for WARP.
///
/// **Usage:**
/// ```
/// NoNetworkStateView(retryAction: {
///     print("Retry tapped")
/// })
///
public struct NoNetworkStateView: View, StateViewConfigurable {

    public var configuration: StateViewConfiguration

    /// Initializes a `NoNetworkStateView` with a retry action.
    ///
    /// - Parameter retryAction: Closure invoked on retry button tap.
    public init(retryAction: @Sendable @escaping () -> Void) {
        configuration = StateViewConfiguration(
            image: .icon(.wifi),
            title: Warp.Strings.patternStateNoNetworkConnectionTitle.localized,
            description: Warp.Strings.patternStateNoNetworkConnectionDescription.localized,
            actionButton: .init(title:  Warp.Strings.patternStatRetryAction.localized, action: retryAction)
        )
    }

    public var body: some View {
        StateView(configuration: configuration)
    }
}

#Preview {
    NoNetworkStateView(retryAction: {
        print("Retry Action") // swiftlint:disable:this no_print
    })
}
