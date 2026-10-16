extension Warp {
    /// Represents the different styles a `TextArea` can have.
    public enum TextAreaStyle: String, CaseIterable, Sendable {
        case `default`
        case disabled
        case error
        case readOnly
    }
}
