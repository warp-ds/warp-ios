import Foundation
import SwiftUI

/// <#Description#>
struct InputAdditionalViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: 16, maxHeight: 16)
            .clipped()
            .scaledToFit()
    }
}

extension View {
    /// <#Description#>
    func inputAdditionalView() -> some View {
        modifier(InputAdditionalViewModifier())
    }
}
