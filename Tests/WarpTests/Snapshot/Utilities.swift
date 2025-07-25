import SwiftUI
import SnapshotTesting
import SnapshotTestingHEIC

/// Chunks an array into smaller arrays of a specified size.
extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}

// MARK: - Snapshotting Extension

/// Extension to provide a snapshotting instance with predefined configurations for Warp components.
extension Snapshotting where Value: SwiftUI.View, Format == UIImage {

    static var warpImage: Snapshotting {
        warpImage()
    }

    /// Creates a snapshotting instance that captures a SwiftUI view as an image in HEIC format.
    static func warpImage(
        drawHierarchyInKeyWindow: Bool = false,
        precision: Float = 1,
        perceptualPrecision: Float = 1,
        layout: SwiftUISnapshotLayout = .sizeThatFits, // .device(config: .iPhone13),
        traits: UITraitCollection = .init(),
        // Use medium compression to lower file size while maintaining quality
        compressionQuality: CompressionQuality = .medium
    ) -> Snapshotting {
        imageHEIC(
            drawHierarchyInKeyWindow: drawHierarchyInKeyWindow,
            precision: precision,
            perceptualPrecision: perceptualPrecision,
            layout: layout,
            traits: traits,
            compressionQuality: compressionQuality
        )
    }
}

// MARK: - Test parametrization utilities

/// Combines two collection into a single collection of tuples.
func combine<C1: Collection, C2: Collection>(
    _ c1: C1, _ c2: C2
) -> [(C1.Element, C2.Element)] {
    var result: [(C1.Element, C2.Element)] = []
    for a in c1 {
        for b in c2 {
            result.append((a, b))
        }
    }
    return result
}

/// Combines three collections into a single collection of tuples.
func combine<C1: Collection, C2: Collection, C3: Collection>(
    _ c1: C1,
    _ c2: C2,
    _ c3: C3
) -> [(C1.Element, C2.Element, C3.Element)] {
    var result: [(C1.Element, C2.Element, C3.Element)] = []
    for a in c1 {
        for b in c2 {
            for c in c3 {
                result.append((a, b, c))
            }
        }
    }
    return result
}

/// Combines four collections into a single collection of tuples.
func combine<C1: Collection, C2: Collection, C3: Collection, C4: Collection>(
    _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4
) -> [(C1.Element, C2.Element, C3.Element, C4.Element)] {
    var result: [(C1.Element, C2.Element, C3.Element, C4.Element)] = []
    for a in c1 {
        for b in c2 {
            for c in c3 {
                for d in c4 {
                    result.append((a, b, c, d))
                }
            }
        }
    }
    return result
}

/// Combines five collections into a single collection of tuples.
func combine<C1: Collection, C2: Collection, C3: Collection, C4: Collection, C5: Collection>(
    _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5
) -> [(C1.Element, C2.Element, C3.Element, C4.Element, C5.Element)] {
    var result: [(C1.Element, C2.Element, C3.Element, C4.Element, C5.Element)] = []
    for a in c1 {
        for b in c2 {
            for c in c3 {
                for d in c4 {
                    for e in c5 {
                        result.append((a, b, c, d, e))
                    }
                }
            }
        }
    }
    return result
}

/// Combines six collections into a single collection of tuples.
func combine<C1: Collection, C2: Collection, C3: Collection, C4: Collection, C5: Collection, C6: Collection>(
    _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6
) -> [(C1.Element, C2.Element, C3.Element, C4.Element, C5.Element, C6.Element)] {
    var result: [(C1.Element, C2.Element, C3.Element, C4.Element, C5.Element, C6.Element)] = []
    for a in c1 {
        for b in c2 {
            for c in c3 {
                for d in c4 {
                    for e in c5 {
                        for f in c6 {
                            result.append((a, b, c, d, e, f))
                        }
                    }
                }
            }
        }
    }
    return result
}
