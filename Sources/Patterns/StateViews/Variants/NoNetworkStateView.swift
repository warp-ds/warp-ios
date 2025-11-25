import SwiftUI

public struct NoNetworkStateView: View, StateViewConfigurable {

    public var configuration: StateViewConfiguration

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
