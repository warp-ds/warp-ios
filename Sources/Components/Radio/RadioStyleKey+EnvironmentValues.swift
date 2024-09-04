import Foundation
import protocol SwiftUI.EnvironmentKey
import struct SwiftUI.EnvironmentValues

/// Environment key for representing `RadioStyle`.
struct RadioStyleKey: EnvironmentKey {
    static var defaultValue = AnyRadioStyle(style: DefaultRadioStyle())
}

extension EnvironmentValues {
    /// Environment key for representing ``RadioStyle``.
    public var radioStyle: AnyRadioStyle {
        get { self[RadioStyleKey.self] }
        set { self[RadioStyleKey.self] = newValue }
    }
}
