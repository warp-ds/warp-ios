import SwiftUI

public struct NoSearchResultsStateView: View {

    let saveSearchAction: (@Sendable () -> Void)
    let clearFiltersAction: (@Sendable () -> Void)

    public init(
        saveSearchAction: @Sendable @escaping () -> Void,
        clearFiltersAction: @Sendable @escaping () -> Void
    ) {
        self.saveSearchAction = saveSearchAction
        self.clearFiltersAction = clearFiltersAction
    }

    public var body: some View {
        StateView(
            image: .icon(.search),
            title: "Well, this place is empty",
            description: "We can’t find the product you’re looking for – it may already have been sold. Would you like to be notified when there are new results for this search?",
            actionButton: .init(title: "Save search", action: saveSearchAction),
            secondaryButton: .init(title: "Clear filters", action: clearFiltersAction)
        )
    }
}

#Preview {
    NoSearchResultsStateView(
        saveSearchAction: {
            print("Save Search Action") // swiftlint:disable:this no_print
        },
        clearFiltersAction: {
            print("Clear Filters Action") // swiftlint:disable:this no_print
        }
    )
}
