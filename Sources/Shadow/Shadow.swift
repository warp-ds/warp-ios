import SwiftUI

@MainActor extension Warp {
    public enum Shadow {
        case small, medium, large, xLarge
        
        fileprivate var opacity1: Double {
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
        
        fileprivate var opacity2: Double {
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
        
        fileprivate var radius1: CGFloat {
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
        
        fileprivate var radius2: CGFloat {
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
        
        fileprivate var x1: CGFloat {
            0
        }
        
        fileprivate var x2: CGFloat {
            0
        }
        
        fileprivate var y1: CGFloat {
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
        
        fileprivate var y2: CGFloat {
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
}

private struct ShadowViewModifier: ViewModifier {
    let shadow: Warp.Shadow
    
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
    public func shadow(_ shadow: Warp.Shadow) -> some View {
        modifier(ShadowViewModifier(shadow: shadow))
    }
}
