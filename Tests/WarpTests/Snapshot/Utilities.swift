import SwiftUI
import SnapshotTesting
import SnapshotTestingHEIC

extension Snapshotting where Value: SwiftUI.View, Format == UIImage {

    static var warpImage: Snapshotting {
        warpImage()
    }

    /// Creates a snapshotting instance that captures a SwiftUI view as an image in HEIC format.
    static func warpImage(
        drawHierarchyInKeyWindow: Bool = false,
        precision: Float = 1,
        perceptualPrecision: Float = 1,
        layout: SwiftUISnapshotLayout = .device(config: .iPhone13),
        traits: UITraitCollection = .init(),
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
