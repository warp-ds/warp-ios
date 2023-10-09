import Foundation
import SwiftUI

extension Warp.Button {
    /// Wrapper around image name for providing more context related to button icon.
    public struct Icon: ExpressibleByStringLiteral {
        /// Image name.
        public let name: String

        /// Image description,
        /// will be used to describe image in accessibility environment.
        public let description: String?

        public init(name: String, description: String? = nil) {
            self.name = name
            self.description = description
        }

        public init(stringLiteral value: String) {
            self.name = value
            description = nil
        }
    }
}
