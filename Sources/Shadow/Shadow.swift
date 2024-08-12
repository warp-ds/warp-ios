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
        // Remove existing shadow layers to avoid stacking
        layer.sublayers?.removeAll(where: { $0.name == "firstShadowLayer" || $0.name == "secondShadowLayer" })

        // First shadow layer
        let firstShadowLayer = CALayer()
        firstShadowLayer.name = "firstShadowLayer"
        firstShadowLayer.shadowColor = UIColor.black.withAlphaComponent(shadow.opacity1).cgColor
        firstShadowLayer.shadowOffset = CGSize(width: shadow.x1, height: shadow.y1)
        firstShadowLayer.shadowRadius = shadow.radius1 * 2
        firstShadowLayer.shadowOpacity = 1
        firstShadowLayer.frame = self.bounds
        firstShadowLayer.backgroundColor = self.backgroundColor?.cgColor

        // Second shadow layer
        let secondShadowLayer = CALayer()
        secondShadowLayer.shadowColor = UIColor.black.withAlphaComponent(shadow.opacity2).cgColor
        secondShadowLayer.shadowOffset = CGSize(width: shadow.x2, height: shadow.y2)
        secondShadowLayer.shadowRadius = shadow.radius2 * 2
        secondShadowLayer.shadowOpacity = 1
        secondShadowLayer.frame = self.bounds
        secondShadowLayer.backgroundColor = self.backgroundColor?.cgColor

        // Add the shadow layers to the view's layer
        self.layer.insertSublayer(firstShadowLayer, at: 0)
        self.layer.insertSublayer(secondShadowLayer, at: 0)
    }
    
    public func layoutShadowLayers() {
        // Update shadow layers' frames
        layer.sublayers?.forEach { sublayer in
            if sublayer.name == "firstShadowLayer" || sublayer.name == "secondShadowLayer" {
                sublayer.frame = self.bounds
            }
        }
    }
}
