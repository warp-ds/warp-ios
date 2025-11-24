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
            title: Warp.Strings.patternStateNoSearchResultsTitle.localized,
            description: Warp.Strings.patternStateNoSearchResultsDescription.localized,
            actionButton: .init(title: Warp.Strings.patternStateNoSearchResultsSaveSearchAction.localized, action: saveSearchAction),
            quietButton: .init(title: Warp.Strings.patternStateNoSearchResultsClearFiltersAction.localized, action: clearFiltersAction)
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
