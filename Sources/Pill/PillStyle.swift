extension Warp.Pill {
    /// The style the Pill component has
    public enum Style: Equatable, CaseIterable {
        /// Used to represent a removable value the user has chosen.
        case filter
        /// Used to represent a proposed/recommended value a user can choose.
        case suggestion
    }
    
    /// The state the Pill component is in
    public enum State: Equatable, CaseIterable {
        case `default`
        case hover
        case active
    }
}
