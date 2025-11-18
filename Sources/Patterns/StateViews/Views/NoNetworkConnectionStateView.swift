import SwiftUI

public struct NoNetworkConnectionStateView: View {
    public var retryAction: (@Sendable () -> Void)

    public init(retryAction: @Sendable @escaping () -> Void) {
        self.retryAction = retryAction
    }

    public var body: some View {
        StateView(viewModel: StateViewModel(
            icon: Warp.Icon.wifi,
            tintColor: .blue,
            title: "",
            description: "",
            actionButtonTitle: "",
            primaryAction: retryAction
        ))
    }
}

#Preview {
    NoNetworkConnectionStateView(retryAction: {
        print("Retry Action") // swiftlint:disable:this no_print
    })
}
