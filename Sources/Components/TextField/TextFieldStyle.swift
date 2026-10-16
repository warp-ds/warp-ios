extension Warp {
    /// Represents the different styles a `TextField` can have.
    public enum TextFieldStyle: String, CaseIterable, Sendable {
        case `default`
        case disabled
        case error
        case readOnly
    }
}
