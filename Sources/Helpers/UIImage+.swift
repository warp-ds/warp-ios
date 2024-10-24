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
}
