import SwiftUI

public struct PageNotFoundStateView: View {

    let brandName: String

    public init(brandName: String = "Vend") {
        self.brandName = brandName
    }

    public var body: some View {
        StateView(
            image: .icon(.question),
            title: "title",
            description: "description"
        )
    }
}

#Preview {
    PageNotFoundStateView(brandName: Warp.Theme.description)
}
