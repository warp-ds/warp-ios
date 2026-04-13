import SwiftUI

// MARK: - Environment Key

/// Environment key for injecting the Warp theme throughout the view hierarchy.
///
/// This replaces the global `Warp.Theme` variable with a proper environment-based system
/// that is Swift 6 concurrency-safe and testable.
struct WarpThemeKey: EnvironmentKey {
    static let defaultValue: Warp.Brand = .finn
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
    ///             .foregroundColor(ColorProvider(theme: theme).textPrimary)
    ///     }
    /// }
    /// ```
    public var warpTheme: Warp.Brand {
        get { self[WarpThemeKey.self] }
        set { self[WarpThemeKey.self] = newValue }
    }
}

// MARK: - View Extension

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
        environment(\.warpTheme, theme)
    }
}
