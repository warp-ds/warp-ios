import SwiftUI

extension View {
    /// Conditionally applies a view modifier based on a boolean value.
    ///
    /// If the condition is `true`, the specified closure is applied to the view.
    /// Otherwise, the original view is returned unchanged.
    ///
    /// - Parameters:
    ///   - conditional: A boolean value that determines whether to apply the closure.
    ///   - content: A closure that takes the original view and returns a modified view.
    /// - Returns: Either the modified view (if the condition is true) or the original view (if the condition is false).
    @ViewBuilder func `if`<Content: View>(
        _ conditional: Bool,
        @ViewBuilder _ content: (Self) -> Content
    ) -> some View {
        if conditional {
            content(self)
        } else {
            self
        }
    }
    
    /// Conditionally applies one of two view modifiers based on a boolean value.
    ///
    /// If the condition is `true`, the `truthy` closure is applied to the view.
    /// If the condition is `false`, the `falsy` closure is applied to the view.
    ///
    /// - Parameters:
    ///   - conditional: A boolean value that determines which closure to apply.
    ///   - truthy: A closure that takes the original view and returns a modified view if the condition is `true`.
    ///   - falsy: A closure that takes the original view and returns a modified view if the condition is `false`.
    /// - Returns: Either the `truthy` modified view or the `falsy` modified view.
    @ViewBuilder func `if`<Truthy: View, Falsy: View>(
        _ conditional: Bool = true,
        @ViewBuilder _ truthy: (Self) -> Truthy,
        @ViewBuilder else falsy: (Self) -> Falsy
    ) -> some View {
        if conditional {
            truthy(self)
        } else {
            falsy(self)
        }
    }
    
    /// Conditionally applies a view modifier when an optional value is non-nil.
    ///
    /// If the optional contains a value, the closure is applied to the view, passing the unwrapped value.
    /// Otherwise, the original view is returned unchanged.
    ///
    /// - Parameters:
    ///   - conditional: An optional value to check.
    ///   - content: A closure that takes the original view and the unwrapped value, returning a modified view.
    /// - Returns: Either the modified view (if the optional is non-nil) or the original view (if the optional is nil).
    @ViewBuilder func iflet<Content: View, T>(
        _ conditional: Optional<T>,
        @ViewBuilder _ content: (Self, _ value: T) -> Content
    ) -> some View {
        if let value = conditional {
            content(self, value)
        } else {
            self
        }
    }

    /// Applies scroll bounce behavior based on content size for iOS 16.4 and above.
    @ViewBuilder func scrollBounceBasedOnSize() -> some View {
        if #available(iOS 16.4, *) {
            self.scrollBounceBehavior(.basedOnSize)
        } else {
            self  // No-op fallback
        }
    }
}
