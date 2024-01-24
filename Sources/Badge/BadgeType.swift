extension Warp.Badge {
    /// Warp badge styles, that has been designed for certain scenarios.
    public enum Style: Equatable, CaseIterable {
        /// Used to convey general information that isn’t critical.
        case info
        /// Used to communicate success.
        case success
        /// Used to communicate warning.
        case warning
        /// Used to communicate error.
        case error
        /// Used to communicate disabled.
        case disabled
        /// Used to communicate sponsored.
        case sponsored
        /// Used to communicate neutral.
        case neutral
    }
    
    /// Badge variants are custom badges used only as overlay on images and cards. They have predefined corner radii so it’s important to use the correct variant in the appropriate corner of your image or card.
    public enum Alignment: Equatable, CaseIterable {
        case `default`
        case topLeft
        case topRight
        case bottomLeft
        case bottomRight
    }
}
