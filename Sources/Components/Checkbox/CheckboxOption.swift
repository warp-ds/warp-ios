import SwiftUI

public protocol CheckboxOption: Identifiable, Hashable {
    var title: String { get }
    var isSelected: Bool { get set }
    var extraContent: AnyView? { get }    
}
