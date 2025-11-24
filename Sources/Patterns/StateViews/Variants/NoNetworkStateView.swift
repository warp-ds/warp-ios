import SwiftUI

public struct NoNetworkStateView: View {

    let retryAction: (@Sendable () -> Void)

    public init(retryAction: @Sendable @escaping () -> Void) {
        self.retryAction = retryAction
    }

    public var body: some View {
        StateView(
            image: .icon(.wifi),
            title: Warp.Strings.patternStateNoNetworkConnectionTitle.localized,
            description: Warp.Strings.patternStateNoNetworkConnectionDescription.localized,
            actionButton: .init(title:  Warp.Strings.patternStatRetryAction.localized, action: retryAction)
        )
    }
}

#Preview {
    NoNetworkStateView(retryAction: {
        print("Retry Action") // swiftlint:disable:this no_print
    })
}
