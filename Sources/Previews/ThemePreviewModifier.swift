import SwiftUI

/// A preview modifier that sets the Warp theme.
///
/// Use like #Preview(traits: .themeFinn)
public struct ThemePreviewModifier: PreviewModifier {
    init(theme: Warp.Brand) {
        Warp.Theme = theme
    }

    public static func makeSharedContext() async throws -> Void {}

    public func body(content: Content, context: Void) -> some View {
        content
    }
 }

@available(iOS 18.0, *)
public extension PreviewTrait where T == Preview.ViewTraits {
    static let themeBlocket = PreviewTrait.modifier(ThemePreviewModifier(theme: .blocket))
    static let themeDba = PreviewTrait.modifier(ThemePreviewModifier(theme: .dba))
    static let themeFinn = PreviewTrait.modifier(ThemePreviewModifier(theme: .finn))
    static let themeTori = PreviewTrait.modifier(ThemePreviewModifier(theme: .tori))
}
