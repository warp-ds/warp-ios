import SwiftUI


/// A no search results state view that displays a search icon, localized title and description,
/// along with action buttons to save the search or clear filters, styled for WARP.
///
/// **Usage:**
/// ```
/// NoSearchResultsStateView(
///    saveSearchAction: {
///       print("Save Search tapped")
///    },
///    clearFiltersAction: {
///       print("Clear Filters tapped")
///    }
/// )
/// ```
public struct NoSearchResultsStateView: View, StateViewConfigurable {

    public var configuration: StateViewConfiguration


    /// Initializes a `NoSearchResultsStateView` with button action closures.
    ///
    /// - Parameters:
    ///   - saveSearchAction: Closure called on save search button tap.
    ///   - clearFiltersAction: Closure called on clear filters button tap.
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
