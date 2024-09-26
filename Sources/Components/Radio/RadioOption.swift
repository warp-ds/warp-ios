import SwiftUI

public protocol RadioOption: Identifiable, Hashable, Sendable {
    var title: String { get }
//    var indentationLevel: Int? { get }
    var extraContent: AnyView? { get }
}
