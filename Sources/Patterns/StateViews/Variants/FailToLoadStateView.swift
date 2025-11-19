import SwiftUI

public struct FailToLoadStateView: View {

    let retryAction: (@Sendable () -> Void)

    public init(retryAction: @Sendable @escaping () -> Void) {
        self.retryAction = retryAction
    }

    public var body: some View {
        StateView(
            image: .icon(.smileySad),
            title: "Sorry, something went wrong",
            description: "Try again in a little while, or get more information from customer support.",
            actionButton: .init(title: "Please try again", action: retryAction)
        )
    }
}

#Preview {
    FailToLoadStateView(retryAction: {
        print("Retry Action") // swiftlint:disable:this no_print
    })
}
