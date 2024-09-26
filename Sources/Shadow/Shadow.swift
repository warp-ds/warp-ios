import SwiftUI

extension Warp {
    /// Defines shadow properties for different shadow sizes.
    public enum Shadow: CaseIterable {
        case small, medium, large, xLarge
        
        public var name: String {
            switch self {
            case .small:  return "Small"
            case .medium: return "Medium"
            case .large:  return "Large"
            case .xLarge: return "xLarge"
            }
        }
        
        /// The opacity for the first shadow layer.
        fileprivate var opacity1: Double {
            switch self {
            case .small:  return 0.16
            case .medium: return 0.16
            case .large:  return 0.1
            case .xLarge: return 0.2
            }
        }
        
        /// The opacity for the second shadow layer.
        fileprivate var opacity2: Double {
            switch self {
            case .small:  return 0.12
            case .medium: return 0.1
            case .large:  return 0.2
            case .xLarge: return 0.1
            }
        }
        
        /// The blur radius for the first shadow layer.
        fileprivate var radius1: CGFloat {
            switch self {
            case .small:  return 0.5
            case .medium: return 4
            case .large:  return 10
            case .xLarge: return 14
            }
        }
        
        /// The blur radius for the second shadow layer.
        fileprivate var radius2: CGFloat {
            switch self {
            case .small:  return 3
            case .medium: return 3
            case .large:  return 6
            case .xLarge: return 9
            }
        }
        
        /// The horizontal offset for the first shadow layer.
        fileprivate var x1: CGFloat {
            0
        }
        
        /// The horizontal offset for the second shadow layer.
        fileprivate var x2: CGFloat {
            0
        }
        
        /// The vertical offset for the first shadow layer.
        fileprivate var y1: CGFloat {
            switch self {
            case .small: return 1
            case .medium: return 3
            case .large: return 10
            case .xLarge: return 14
            }
        }
        
        /// The vertical offset for the second shadow layer.
        fileprivate var y2: CGFloat {
            switch self {
            case .small:  return 1
            case .medium: return 3
            case .large:  return 6
            case .xLarge: return 9
            }
        }
    }
}

/// A view modifier that applies double shadows to a view based on the specified `Warp.Shadow` properties.
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
    /// Applies double shadows to the view based on the specified `Warp.Shadow` properties.
    ///
    /// - Parameter shadow: A `Warp.Shadow` object containing properties for the two shadows.
    /// - Returns: A view modified with the specified double shadows.
    public func addShadow(_ shadow: Warp.Shadow) -> some View {
        modifier(ShadowViewModifier(shadow: shadow))
    }
}

extension UIView {
    /// Adds double shadow layers to the view with specified shadow properties.
    ///
    /// This method creates and adds two shadow layers to the view, with properties specified by the `Warp.Shadow` parameter.
    /// It removes any existing shadow layers before adding the new ones.
    ///
    /// - Parameter shadow: A `Warp.Shadow` object containing properties for the two shadows.
    ///
    /// - Note: To ensure the shadow layers update correctly with layout changes, call `layoutShadowLayers` in your view's `viewDidLayoutSubviews` method.
    public func addShadow(_ shadow: Warp.Shadow) {
        // Remove existing shadow layers to avoid stacking multiple shadow layers
        layer.sublayers?.removeAll(where: { $0.name == "firstShadowLayer" || $0.name == "secondShadowLayer" })
        
        // Create the first shadow layer
        let firstShadowLayer = createShadowLayer(
            name: "firstShadowLayer",
            color: UIColor.black.withAlphaComponent(shadow.opacity1),
            offset: CGSize(width: shadow.x1, height: shadow.y1),
            radius: shadow.radius1 * 2,
            opacity: 1
        )
        
        // Create the second shadow layer
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
    
    /// Creates a shadow layer with specified properties.
    ///
    /// - Parameters:
    ///   - name: The name of the shadow layer.
    ///   - color: The color of the shadow.
    ///   - offset: The offset of the shadow.
    ///   - radius: The blur radius of the shadow.
    ///   - opacity: The opacity of the shadow.
    /// - Returns: A configured `CALayer` instance for the shadow.
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
    
    /// Updates the frames and paths of the shadow layers to match the view's bounds and corner radius.
    ///
    /// - Note: Call this method in your view's `viewDidLayoutSubviews` method to ensure the shadow layers update correctly with layout changes.
    public func layoutShadowLayers() {
        // Update shadow layers' frames and paths
        updateShadowLayersFrameAndCornerRadius()
    }
    
    /// Updates the frames and paths of the shadow layers to match the view's bounds and corner radius.
    private func updateShadowLayersFrameAndCornerRadius() {
        // Create a shadow path with the same corner radius as the view
        let shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.layer.cornerRadius).cgPath
        
        // Update each shadow layer's frame, corner radius, and shadow path
        layer.sublayers?.forEach { sublayer in
            if sublayer.name == "firstShadowLayer" || sublayer.name == "secondShadowLayer" {
                sublayer.frame = self.bounds
                sublayer.cornerRadius = self.layer.cornerRadius
                sublayer.shadowPath = shadowPath
            }
        }
    }
}
