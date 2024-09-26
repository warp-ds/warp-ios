import Foundation
import SwiftUI

extension Warp {
    /// The style the Pill component has
    @MainActor
    public enum PillStyle: Equatable, CaseIterable {
        /// Used to represent a removable value the user has chosen.
        case filter
        /// Used to represent a proposed/recommended value a user can choose.
        case suggestion
    }
}
