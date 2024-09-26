import SwiftUI

public protocol CheckboxOption: Identifiable, Hashable {
    var title: String { get }
    var isSelected: Binding<Bool> { get }
    var extraContent: AnyView? { get }
}
