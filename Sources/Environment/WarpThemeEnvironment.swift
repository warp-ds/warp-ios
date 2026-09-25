import SwiftUI

// MARK: - Theme Context

/// The theme in scope for a view hierarchy: a brand, plus an optional colour variant.
///
/// Read through `@Environment(\.warpTheme)`. Variants are resolved here rather than at each
/// call site, so components use `colors` and `token` unchanged.
public struct WarpThemeContext: Equatable, Sendable, CustomStringConvertible {
    /// The brand in scope. A variant never changes this.
    public let brand: Warp.Brand

    /// The colour variant layered on top of ``brand``, if any.
    public internal(set) var variant: Warp.ColorVariant?

    public init(brand: Warp.Brand) {
        self.brand = brand
        self.variant = nil
    }

    init(brand: Warp.Brand, variant: Warp.ColorVariant?) {
        self.brand = brand
        self.variant = variant
    }

    // MARK: Provider access

    /// Semantic SwiftUI colour tokens, with any variant overrides applied.
    public var token: TokenProvider {
        guard let variant else { return brand.token }
        return variant.tokenProvider(base: brand.token)
    }

    // Brand is passed through unchanged, so colours that branch on brand take their usual
    // path; only token values differ.
    var colors: ColorProvider {
        ColorProvider(theme: brand, token: token)
    }

    /// Semantic UIKit colour tokens.
    ///
    /// Variants are not applied: UIKit has no view subtree to bound them to.
    public var uiToken: UITokenProvider {
        brand.uiToken
    }

    // Variants are colour-only and never affect typography.
    var fonts: [Warp.Font] {
        brand.fonts
    }

    public var description: String {
        brand.description
    }
}

// MARK: - Environment Key

/// Environment key for injecting the Warp theme throughout the view hierarchy.
///
/// This replaces the global `Warp.Theme` variable with a proper environment-based system
/// that is Swift 6 concurrency-safe and testable.
struct WarpThemeKey: EnvironmentKey {
    // Default to the global theme for backward compatibility, remove in future versions
    static let defaultValue = WarpThemeContext(brand: Warp.Theme)
}

extension EnvironmentValues {
    /// The current Warp theme for the view hierarchy.
    ///
    /// Use this instead of the global `Warp.Theme` variable:
    /// ```swift
    /// struct MyView: View {
    ///     @Environment(\.warpTheme) private var theme
    ///
    ///     var body: some View {
    ///         Text("Hello")
    ///             .foregroundColor(theme.colors.text)
    ///     }
    /// }
    /// ```
    public var warpTheme: WarpThemeContext {
        get { self[WarpThemeKey.self] }
        set { self[WarpThemeKey.self] = newValue }
    }
}

// MARK: - View Extensions

public extension View {
    /// Sets the Warp theme for this view and all its descendants.
    ///
    /// - Parameter theme: The brand theme to apply
    /// - Returns: A view with the theme set in its environment
    ///
    /// Example:
    /// ```swift
    /// ContentView()
    ///     .warpTheme(.finn)
    /// ```
    func warpTheme(_ theme: Warp.Brand) -> some View {
        // Transform rather than replace, so a brand set inside a variant-scoped subtree
        // keeps the variant.
        transformEnvironment(\.warpTheme) { context in
            context = WarpThemeContext(brand: theme, variant: context.variant)
        }
    }

    /// Applies a colour variant to this view and everything it contains.
    ///
    /// Scope is exactly what the modifier wraps, so it works on a single component or a
    /// container. Content rendered outside that subtree — a navigation destination declared
    /// elsewhere, or anything pushed from UIKit — is unaffected.
    ///
    /// ```swift
    /// Warp.Button(title: "Show results") { … }
    ///     .warpColorVariant(.premium)   // this button only
    ///
    /// Group { filterRows }
    ///     .warpColorVariant(.premium)   // every Warp component inside
    /// ```
    ///
    /// - Parameter variant: The variant to apply, or `nil` to clear an inherited one.
    func warpColorVariant(_ variant: Warp.ColorVariant?) -> some View {
        transformEnvironment(\.warpTheme) { context in
            context.variant = variant
        }
    }
}
