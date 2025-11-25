import SwiftUI

public struct NoSearchResultsStateView: View, StateViewConfigurable {

    public var configuration: StateViewConfiguration

    public init(
        saveSearchAction: @Sendable @escaping () -> Void,
        clearFiltersAction: @Sendable @escaping () -> Void
    ) {
        configuration = StateViewConfiguration(
            image: .icon(.search),
            title: Warp.Strings.patternStateNoSearchResultsTitle.localized,
            description: Warp.Strings.patternStateNoSearchResultsDescription.localized,
            actionButton: .init(title: Warp.Strings.patternStateNoSearchResultsSaveSearchAction.localized, action: saveSearchAction),
            quietButton: .init(title: Warp.Strings.patternStateNoSearchResultsClearFiltersAction.localized, action: clearFiltersAction)
        )
    }

    public var body: some View {
        StateView(configuration: configuration)
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
