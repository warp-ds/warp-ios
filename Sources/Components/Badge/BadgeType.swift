extension Warp {
    /// Warp badge styles that are designed for specific scenarios.
    public enum BadgeVariant: String, Equatable, CaseIterable {
        /// Used to convey general information that isn’t critical.
        case info
        
        /// Used to communicate success.
        case success
        
        /// Used to communicate warning.
        case warning
        
        /// Used to communicate error.
        case negative
        
        /// Used to communicate disabled.
        case disabled
        
        /// Used to communicate sponsored.
        case sponsored
        
        /// Used to communicate neutral.
        case neutral
        
        /// Used to communicate price.
        case price
    }
    
    /// Badge positions are custom badges used only as overlays on images and cards.
    /// They have predefined corner radii, so it’s important to use the correct variant in the appropriate corner of your image or card.
    public enum BadgePosition: String, Equatable, CaseIterable {
        case `default`
        case topLeft
        case topRight
        case bottomLeft
        case bottomRight
    }
}
