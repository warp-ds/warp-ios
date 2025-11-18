import SwiftUI

public struct ErrorStateView: View {
    public var description: String?
    public var retryAction: (@Sendable () -> Void)

    public init(description: String? = nil, retryAction: @Sendable @escaping () -> Void) {
        self.description = description
        self.retryAction = retryAction
    }

    public var body: some View {
        StateView(viewModel: StateViewModel(
            icon: Warp.Icon.smileySad,
            tintColor: .blue,
            title: "",
            description: description ?? "",
            actionButtonTitle: "",
            primaryAction: retryAction
        ))
    }
}

#Preview {
    ErrorStateView(retryAction: {
        print("Retry Action") // swiftlint:disable:this no_print
    })
}
