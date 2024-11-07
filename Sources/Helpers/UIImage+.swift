import UIKit

extension UIImage {
    /// Resizes the image to the specified target size using `UIGraphicsImageRenderer`.
    ///
    /// - Parameter targetSize: The desired size for the image.
    /// - Returns: A resized `UIImage`.
    func resized(to targetSize: CGSize) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: targetSize)
        let resizedImage = renderer.image { context in
            self.draw(in: CGRect(origin: .zero, size: targetSize))
        }
        return resizedImage
    }
    
    /// Loads an image from the Warp bundle.
    /// - Parameter icon: The icon from `Warp.TaxonomyIcon`.
    public static func warpIcon(named name: String) -> UIImage? {
        return UIImage(named: name, in: .module, compatibleWith: nil)
    }
}
