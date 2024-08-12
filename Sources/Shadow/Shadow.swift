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
        let firstShadowLayer = createShadowLayer(
            name: "firstShadowLayer",
            color: UIColor.black.withAlphaComponent(shadow.opacity1),
            offset: CGSize(width: shadow.x1, height: shadow.y1),
            radius: shadow.radius1 * 2,
            opacity: 1
        )
        
        // Second shadow layer
        let secondShadowLayer = createShadowLayer(
            name: "secondShadowLayer",
            color: UIColor.black.withAlphaComponent(shadow.opacity2),
            offset: CGSize(width: shadow.x2, height: shadow.y2),
            radius: shadow.radius2 * 2,
            opacity: 1
        )
        
        // Add the shadow layers to the view's layer
        self.layer.insertSublayer(firstShadowLayer, at: 0)
        self.layer.insertSublayer(secondShadowLayer, at: 0)
        
        // Update the corner radius and shadow path
        updateShadowLayersFrameAndCornerRadius()
    }
    
    private func createShadowLayer(name: String, color: UIColor, offset: CGSize, radius: CGFloat, opacity: Float) -> CALayer {
        let shadowLayer = CALayer()
        shadowLayer.name = name
        shadowLayer.shadowColor = color.cgColor
        shadowLayer.shadowOffset = offset
        shadowLayer.shadowRadius = radius
        shadowLayer.shadowOpacity = opacity
        shadowLayer.backgroundColor = self.backgroundColor?.cgColor
        shadowLayer.cornerRadius = self.layer.cornerRadius
        return shadowLayer
    }
    
    public func layoutShadowLayers() {
        // Update shadow layers' frames and paths
        updateShadowLayersFrameAndCornerRadius()
    }
    
    private func updateShadowLayersFrameAndCornerRadius() {
        let shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.layer.cornerRadius).cgPath
        
        layer.sublayers?.forEach { sublayer in
            if sublayer.name == "firstShadowLayer" || sublayer.name == "secondShadowLayer" {
                sublayer.frame = self.bounds
                sublayer.cornerRadius = self.layer.cornerRadius
                sublayer.shadowPath = shadowPath
            }
        }
    }
}
