import Foundation
import SwiftUI

/// Modifier that will be applied to TextField additional views to fit the expected area.
/// (left/right view and info tool tip view)
struct TextFieldAdditionalViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: 16, maxHeight: 16)
            .clipped()
            .scaledToFit()
    }
}

extension View {
    /// Modifier that will prepare TextField additional views to fit the expected area.
    func textFieldAdditionalView() -> some View {
        modifier(TextFieldAdditionalViewModifier())
    }
}
