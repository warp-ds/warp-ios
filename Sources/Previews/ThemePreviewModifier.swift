import SwiftUI

/// A preview modifier that sets the Warp theme in the preview.
///
/// Usage: `#Preview(traits: .themeFinn)`
struct ThemePreviewModifier: PreviewModifier {
    init(theme: Warp.Brand) {
        Warp.Theme = theme
    }

    static func makeSharedContext() async throws -> Void {}

    func body(content: Content, context: Void) -> some View {
        content
    }
 }

@available(iOS 18.0, *)
public extension PreviewTrait where T == Preview.ViewTraits {
    /// Preview modifier that sets the Blocket Warp theme.
    static let themeBlocket = PreviewTrait.modifier(ThemePreviewModifier(theme: .blocket))

    /// Preview modifier that sets the DBA Warp theme.
    static let themeDba = PreviewTrait.modifier(ThemePreviewModifier(theme: .dba))

    /// Preview modifier that sets the FINN Warp theme.
    static let themeFinn = PreviewTrait.modifier(ThemePreviewModifier(theme: .finn))

    /// Preview modifier that sets the Tori Warp theme.
    static let themeTori = PreviewTrait.modifier(ThemePreviewModifier(theme: .tori))
}
