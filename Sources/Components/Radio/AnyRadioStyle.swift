import Foundation
import SwiftUI

/// Radio style type erasure.
public struct AnyRadioStyle: RadioStyle {
    private var _makeBody: (Configuration) -> AnyView

    public init<R: RadioStyle>(style: R) {
        _makeBody = { configuration in
            AnyView(style.makeBody(configuration: configuration))
        }
    }

    public func makeBody(configuration: Configuration) -> some View {
        _makeBody(configuration)
    }
}
