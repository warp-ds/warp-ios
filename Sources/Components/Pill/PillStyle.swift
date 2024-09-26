import Foundation
import SwiftUI

extension Warp {
    /// The style the Pill component has
    public enum PillStyle: Equatable, CaseIterable, Sendable {
        /// Used to represent a removable value the user has chosen.
        case filter
        /// Used to represent a proposed/recommended value a user can choose.
        case suggestion
    }
}
