import SwiftUI

public protocol RadioOption: Identifiable, Hashable {
    var name: String { get }
    var indentationLevel: Int { get }
    var extraContent: AnyView? { get }
}
