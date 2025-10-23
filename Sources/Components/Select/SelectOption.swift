import SwiftUI

extension Warp.Select {

    public struct SelectorOption: Identifiable {
        public let id: String
        let title: String

        static let placeholderId = "Warp.Select.PlaceholderOption"

        public init(id: String, title: String) {
            self.id = id
            self.title = title
        }

        init(placeholder: String) {
            self.id = SelectorOption.placeholderId
            self.title = placeholder
        }
    }
}
