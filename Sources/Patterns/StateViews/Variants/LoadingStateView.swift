import SwiftUI

/// A simple loading state showing a spinner and a localized loading description text, styled for WARP.
///
/// **Usage:**
/// ```
/// LoadingStateView()
/// ```
public struct LoadingStateView: View {

    public init() {}

    public var body: some View {
        VStack(alignment: .center, spacing: Warp.Spacing.spacing300) {
            Warp.Spinner(size: .default)
            Warp.Text(Warp.Strings.patternStateLoadingDescription.localized, style: .body)
              .lineLimit(nil) // Allow unlimited lines
              .multilineTextAlignment(.center)
        }
          .padding(Warp.Spacing.spacing400)
          .frame(maxWidth: 420) // Constrain width on large screens (like iPad)
          .frame(maxHeight: .infinity, alignment: .center)
    }
}

#Preview {
    LoadingStateView()
}
