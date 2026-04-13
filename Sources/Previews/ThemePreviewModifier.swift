import SwiftUI

/// A preview modifier that sets the Warp theme in the preview using environment injection.
///
/// Usage: `#Preview(traits: .themeFinn) { MyView() }`
struct ThemePreviewModifier: PreviewModifier {
    let theme: Warp.Brand

    static func makeSharedContext() async throws -> Void {}

    func body(content: Content, context: Void) -> some View {
        content
            .warpTheme(theme)
    }
 }

@available(iOS 18.0, *)
public extension PreviewTrait where T == Preview.ViewTraits {
    /// Preview modifier that sets the Blocket Warp theme via environment.
    static let themeBlocket = PreviewTrait.modifier(ThemePreviewModifier(theme: .blocket))

    /// Preview modifier that sets the DBA Warp theme via environment.
    static let themeDba = PreviewTrait.modifier(ThemePreviewModifier(theme: .dba))

    /// Preview modifier that sets the FINN Warp theme via environment.
    static let themeFinn = PreviewTrait.modifier(ThemePreviewModifier(theme: .finn))

    /// Preview modifier that sets the Tori Warp theme via environment.
    static let themeTori = PreviewTrait.modifier(ThemePreviewModifier(theme: .tori))

    /// Preview modifier that sets the Vend Warp theme via environment.
    static let themeVend = PreviewTrait.modifier(ThemePreviewModifier(theme: .vend))

    /// Preview modifier that sets the Neutral Warp theme via environment.
    static let themeNeutral = PreviewTrait.modifier(ThemePreviewModifier(theme: .neutral))
}
