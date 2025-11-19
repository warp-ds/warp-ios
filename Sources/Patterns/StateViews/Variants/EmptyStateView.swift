import SwiftUI

public struct EmptyStateView: View {

    let title: String
    let description: String?

    public init(title: String? = nil, description: String? = nil) {
        self.title = title ?? "Nothing here yet"
        self.description = description ?? "There’s no content to display at the moment."
    }

    public var body: some View {
        StateView(
            image: .icon(.smileyNeutral),
            title: title,
            description: description,
            showVendEndorsement: false
        )
    }
}

#Preview {
    EmptyStateView()
}
