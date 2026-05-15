import UIKit
import CoreImage

final class WarpPaletteIconManager {

    static let shared = WarpPaletteIconManager()
    private let cache = NSCache<NSString, UIImage>()
    private let ciContext = CIContext(options: nil)

    private let colorKernel: CIColorKernel? = {
        let kernelString = """
                           kernel vec4 replaceColor(__sample pixel, vec4 targetColor, vec4 newColor, float tolerance) {
                               vec3 rgb = pixel.a > 0.0 ? (pixel.rgb / pixel.a) : vec3(0.0);
                               float distance = length(rgb - targetColor.rgb);
                               if (distance < tolerance) {
                                   return vec4(newColor.rgb * pixel.a, pixel.a);
                               }
                               return pixel;
                           }
                           """
        return CIColorKernel(source: kernelString)
    }()

    func recolorRasterizedImage(
        icon: Warp.Icon,
        targetColor: UIColor = .black,
        newColor: UIColor,
        size: Warp.IconSize = .default,
        tolerance: Float = 0.15
    ) -> UIImage? {

        let cacheKey = "\(icon.assetName)_\(size.value)x\(size.value)_\(newColor.hashValue)" as NSString
        if let cachedImage = cache.object(forKey: cacheKey) {
            return cachedImage
        }

        guard let image = icon.rawUIImage,
              let cgImage = image.cgImage,
              let kernel = colorKernel else { return nil }

        let inputImage = CIImage(cgImage: cgImage)
        let ciTargetColor = CIColor(color: targetColor)
        let ciNewColor = CIColor(color: newColor)

        guard let outputCIImage = kernel.apply(
            extent: inputImage.extent,
            arguments: [inputImage, ciTargetColor, ciNewColor, tolerance]
        ) else { return nil }

        guard let outputCGImage = ciContext.createCGImage(outputCIImage, from: outputCIImage.extent) else { return nil }

        // Use the scale of the incoming image to maintain Retina crispness
        let finalImage = UIImage(cgImage: outputCGImage, scale: image.scale, orientation: .up)

        cache.setObject(finalImage, forKey: cacheKey)
        return finalImage
    }
}
