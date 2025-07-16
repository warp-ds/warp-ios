import SwiftUI

public protocol RadioOption: Identifiable, Hashable {
    var title: String { get }
    var extraContent: AnyView? { get }
}
