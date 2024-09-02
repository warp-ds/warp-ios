import SwiftUI

extension Warp {
    /// Represents the different states a checkbox can be in.
    public enum CheckboxState: String, CaseIterable {
        case notSelected
        case selected
        case partiallySelected
    }
}
