import SwiftUI

extension Warp {
    /// Represents the different styles a checkbox can have.
    public enum CheckboxStyle: String, CaseIterable, Sendable {
        case `default`
        case error
        case disabled
    }
}
