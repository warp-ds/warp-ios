import SwiftUI

extension Warp {
    /// Represents the different styles a TextArea can have.
    public enum TextAreaStyle: String, CaseIterable {
        case `default`
        case active
        case disabled
        case error
        case readOnly
    }
}
