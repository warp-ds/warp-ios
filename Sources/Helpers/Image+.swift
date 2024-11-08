import SwiftUI

extension Image {
    /// Loads an image from the Warp bundle.
    /// - Parameter named: The rawValue of the icon from `Warp Assets`.
    public static func warpIcon(named name: String) -> Image {
        SwiftUI.Image(name, bundle: .module)
    }
}
