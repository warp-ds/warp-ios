import Foundation
import SwiftUI

public protocol RadioStyle {
    /// A view that represents the body of a radio.
    associatedtype Body : View

    /// The properties of a radio.
    typealias Configuration = RadioStyleConfiguration

    /// Creates a view that represents the body of a radio.
    ///
    /// The system calls this method for each ``Radio`` instance in a view
    /// hierarchy where this style is the current radio style.
    ///
    /// - Parameter configuration : The properties of the radio.
    @ViewBuilder func makeBody(configuration: Self.Configuration) -> Self.Body
}

/// The properties of a radio.
public struct RadioStyleConfiguration {
    /// A type-erased  label of a radio.
    public struct Label: View {
        public let body: AnyView

        init<Content: View>(@ViewBuilder content: () -> Content) {
            body = AnyView(content())
        }
    }

    /// Selected represented view.
    public let selectedLabel: RadioStyleConfiguration.Label

    /// Deselected represented view.
    public let deselectedLabel: RadioStyleConfiguration.Label

    /// Flag indicating that the radio is selected.
    public let isSelected: Bool
}
