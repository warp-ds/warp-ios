import SwiftUI

public extension StateViewModel {
    static var `default`: StateViewModel {
        StateViewModel(
            icon: Warp.Icon.smileyNeutral,
            tintColor: .blue,
            title: "",
            description: ""
        )
    }
}

public struct EmptyStateView: View {

    @ObservedObject public var viewModel: StateViewModel

    public init(viewModel: StateViewModel = .default) {
        self.viewModel = viewModel
    }

    public var body: some View {
        StateView(viewModel: viewModel)
    }
}

#Preview {
    EmptyStateView()
}
