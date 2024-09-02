import SwiftUI

public protocol CheckboxOption: Identifiable, Hashable {
    var title: String { get }
    var state: Warp.CheckboxState { get }
    var extraContent: AnyView? { get }
    var indentationLevel: Int { get }
}
