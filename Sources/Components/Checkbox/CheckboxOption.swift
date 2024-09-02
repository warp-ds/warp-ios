import SwiftUI

public protocol CheckboxOption: Identifiable, Hashable {
    var title: String { get }
    var state: Warp.CheckboxState { get }
    var extraContent: AnyView? { get }
    var indentationLevel: Int { get }
    
    func updatedState(_ newState: Warp.CheckboxState) -> Self
}
