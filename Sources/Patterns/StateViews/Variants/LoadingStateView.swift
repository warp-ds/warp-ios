import SwiftUI

public struct LoadingStateView: View {

    let description: String?

    public init(description: String? = nil) {
        self.description = description ?? "Please wait..."
    }

    public var body: some View {
        VStack(alignment: .center, spacing: Warp.Spacing.spacing300) {
            Warp.Spinner(size: .default)
            if let description {
                Warp.Text(description, style: .body)
                  .lineLimit(nil) // Allow unlimited lines
                  .multilineTextAlignment(.center)
            }
        }
          .padding(Warp.Spacing.spacing400)
          .frame(maxWidth: 420) // Constrain width on large screens (like iPad)
          .frame(maxHeight: .infinity, alignment: .top) // Center horizontally
    }
}

#Preview {
    LoadingStateView()
}
