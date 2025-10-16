import SwiftUI

extension Warp.Select {

    public struct SelectorOption: Identifiable {
        public let id: String
        let title: String

        public init(id: String, title: String) {
            self.id = id
            self.title = title
        }
    }
}
