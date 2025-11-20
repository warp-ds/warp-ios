import SwiftUI

public struct PageNotFoundStateView: View {

    let brandName: String

    public init(brandName: String) {
        self.brandName = brandName
    }

    public var body: some View {
        StateView(
            image: .icon(.question),
            title: "Page not found",
            description: "You can find everything in \(brandName)... except this page. Error 404."
        )
    }
}

#Preview {
    PageNotFoundStateView(brandName: Warp.Theme.description)
}
