import Foundation

extension Warp {
    /// Style for `Box` view.
    @MainActor
    public enum BoxStyle: Equatable {
        /// Used to group information that separates itself from other elements in a page layout.
        /// Use this box to show generic information that isn’t necessarily directly related to the main focus content on your page.
        case neutral

        /// Used to highlight content on a page. It differs from an “Info alert”, 
        /// which is used in a more contextual manner, where the information is presented to the user as a prompt to take action.
        /// Use this box to show information that is related, or relevant to the main focus content on your page.
        case info

        /// Can be used on coloured backgrounds, when a neutral or info box doesn’t work.
        /// It can also be used as an alternative way to group information on a page that might need a variation of grouped information.
        /// Use this box when showing generic information on coloured or low contrast backgrounds.
        case bordered
    }
}
