import SwiftUI

public enum Shadow: String, CaseIterable {
    case small, medium, large, xLarge
    
    var opacity1: Double {
        switch self {
        case .small:
            return 0.16
        case .medium:
            return 0.16
        case .large:
            return 0.1
        case .xLarge:
            return 0.2
        }
    }
    var opacity2: Double {
        switch self {
        case .small:
            return 0.12
        case .medium:
            return 0.1
        case .large:
            return 0.2
        case .xLarge:
            return 0.1
        }
    }
    var radius1: CGFloat {
        switch self {
        case .small:
            return 0.5
        case .medium:
            return 4
        case .large:
            return 10
        case .xLarge:
            return 14
        }
    }
    var radius2: CGFloat {
        switch self {
        case .small:
            return 3
        case .medium:
            return 3
        case .large:
            return 6
        case .xLarge:
            return 9
        }
    }
    var x1: CGFloat {
        0
    }
    var x2: CGFloat {
        0
    }
    var y1: CGFloat {
        switch self {
        case .small:
            return 1
        case .medium:
            return 3
        case .large:
            return 10
        case .xLarge:
            return 14
        }
    }
    var y2: CGFloat {
        switch self {
        case .small:
            return 1
        case .medium:
            return 3
        case .large:
            return 6
        case .xLarge:
            return 9
        }
    }
}

struct ShadowType: ViewModifier {
    var shadow: Shadow
    
    func body(content: Content) -> some View {
        content
            .shadow(color: .black.opacity(shadow.opacity1),
                    radius: shadow.radius1,
                    x: shadow.x1,
                    y: shadow.y1)
            .shadow(color: .black.opacity(shadow.opacity2),
                    radius: shadow.radius2,
                    x: shadow.x2,
                    y: shadow.y2)
    }
}

extension View {
    public func shadow(_ shadow: Shadow) -> some View {
        modifier(ShadowType(shadow: shadow))
    }
}
