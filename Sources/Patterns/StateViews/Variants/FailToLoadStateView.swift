import SwiftUI

public struct FailToLoadStateView: View, StateViewConfigurable {

    public var configuration: StateViewConfiguration

    public init(retryAction: @Sendable @escaping () -> Void) {
        configuration = StateViewConfiguration(
            image: .icon(.smileySad),
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
