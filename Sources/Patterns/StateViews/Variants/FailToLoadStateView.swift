import SwiftUI

/// A predefined empty state representing a failure to load something
/// It displays a sad smiley icon, localized title and description for the fail-to-load scenario,
/// and includes a retry action button provided via closure.
///
/// **Usage:**
/// ```
/// FailToLoadStateView(retryAction: {
///     print("Retry tapped")
/// })
/// ```
///
public struct FailToLoadStateView: View, StateViewConfigurable {

    public var configuration: StateViewConfiguration

    /// Initializes a new `FailToLoadStateView` with a retry action.
    ///
    /// - Parameter retryAction: A closure called when the retry button is pressed.
    public init(retryAction: @Sendable @escaping () -> Void) {
        configuration = StateViewConfiguration(
            image: .icon(.smileyNeutral),
            title: Warp.Strings.patternStateFailToLoadTitle.localized,
            description: Warp.Strings.patternStateFailToLoadDescription.localized,
            actionButton: .init(title:  Warp.Strings.patternStatRetryAction.localized, action: retryAction)
        )
    }

    public var body: some View {
        StateView(configuration: configuration)
    }
}

#Preview {
    FailToLoadStateView(retryAction: {
        print("Retry Action") // swiftlint:disable:this no_print
    })
}
