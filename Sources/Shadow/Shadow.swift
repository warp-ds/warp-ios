import SwiftUI

extension Warp {
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

extension UIView {
    public func dropShadow(_ shadow: Warp.Shadow) {
        let shadows = UIView()
        shadows.frame = CGRect(x: 0, y: 0, width: 192, height: 192)

        let shadowPath0 = UIBezierPath(roundedRect: shadows.bounds, cornerRadius: 8)
        let layer1 = CALayer()
        layer1.shadowPath = shadowPath0.cgPath
        layer1.shadowColor = UIColor.black.withAlphaComponent(shadow.opacity1).cgColor
        layer1.shadowOpacity = 1
        layer1.shadowRadius = shadow.radius1 * 2
        layer1.shadowOffset = CGSize(width: shadow.x1, height: shadow.y1)

        let shadowPath1 = UIBezierPath(roundedRect: shadows.bounds, cornerRadius: 8)
        let layer2 = CALayer()
        layer2.shadowPath = shadowPath1.cgPath
        layer2.shadowColor = UIColor.black.withAlphaComponent(shadow.opacity2).cgColor
        layer2.shadowOpacity = 1
        layer2.shadowRadius = shadow.radius2 * 2
        layer2.shadowOffset = CGSize(width: shadow.x2, height: shadow.y2)

        let layer3 = CALayer()
        layer3.backgroundColor = UIColor.white.cgColor
        layer3.cornerRadius = 8
        layer3.bounds = shadows.bounds
        layer3.position = shadows.center
        
        layer.masksToBounds = false
        layer.addSublayer(layer1)
        layer.addSublayer(layer2)
        layer.addSublayer(layer3)
    }
}
