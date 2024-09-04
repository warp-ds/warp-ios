import SwiftUI

public protocol RadioOption: Identifiable, Hashable {
    var title: String { get }

//    var indentationLevel: Int? { get }

    var extraContent: AnyView? { get }
}

/// Type erased radio option.
public struct AnyRadioOption<T: Hashable>: RadioOption {
    public let title: String

    public let extraContent: AnyView?

    public let id: T

    public init<R: RadioOption>(option: R) where R.ID == T {
        title = option.title
        extraContent = option.extraContent
        id = option.id
    }

    public static func == (lhs: AnyRadioOption, rhs: AnyRadioOption) -> Bool {
        lhs.id == rhs.id
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
