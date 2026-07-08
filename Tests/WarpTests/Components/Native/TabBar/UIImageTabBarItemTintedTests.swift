// Tests/WarpTests/Components/Native/TabBar/UIImageTabBarItemTintedTests.swift
import Testing
import UIKit
@testable import Warp

@Suite @MainActor
struct UIImageTabBarItemTintedTests {

    /// Renders a UIImage into a small bitmap and returns the PNG bytes.
    /// Used to compare two UIImages that may carry the tint as a render-time
    /// effect (which `UIImage.cgImage` does not reflect) rather than baked
    /// into their underlying bitmap.
    private func renderedBytes(of image: UIImage) -> Data {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 4, height: 4))
        let rendered = renderer.image { _ in
            image.draw(in: CGRect(x: 0, y: 0, width: 4, height: 4))
        }
        return rendered.pngData() ?? Data()
    }

    /// Build a 1×1 white template source image.
    /// Template rendering is required because `UIImage.withTintColor` only
    /// re-colors template images; against `.alwaysOriginal` the returned
    /// image's pixels stay unchanged. Real tab bar icons are template-rendered
    /// (SF Symbols / asset-catalog template), so this mirrors production usage.
    private func makeTemplateSourceImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 1, height: 1))
        let image = renderer.image { context in
            UIColor.white.setFill()
            context.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        }
        return image.withRenderingMode(.alwaysTemplate)
    }

    /// Verifies the helper routes `.normal` to `Warp.UIToken.icon` by comparing
    /// its output to a manual `withTintColor(Warp.UIToken.icon, ...)` call.
    /// Both calls observe the same `Warp.Theme` value at the same instant, so
    /// the test is theme-independent and doesn't race with other suites that
    /// mutate `Warp.Theme`.
    @Test
    func normalStateUsesIconToken() {
        let source = makeTemplateSourceImage()
        let viaHelper = source.warpTabBarItemTinted(state: .normal)
        let viaExpected = source.withTintColor(Warp.UIToken.icon, renderingMode: .alwaysOriginal)
        #expect(renderedBytes(of: viaHelper) == renderedBytes(of: viaExpected))
    }

    /// Verifies the helper routes `.selected` to `Warp.UIColor.navbarIconSelected`.
    @Test
    func selectedStateUsesNavbarIconSelectedToken() {
        let source = makeTemplateSourceImage()
        let viaHelper = source.warpTabBarItemTinted(state: .selected)
        let viaExpected = source.withTintColor(Warp.UIColor.navbarIconSelected, renderingMode: .alwaysOriginal)
        #expect(renderedBytes(of: viaHelper) == renderedBytes(of: viaExpected))
    }

    /// Sanity check: different states must produce different tinted output.
    /// Catches a bug where someone accidentally swapped the two tokens
    /// (so `.normal` and `.selected` happened to use the same token).
    @Test
    func differentStatesProduceDifferentOutput() {
        let source = makeTemplateSourceImage()
        let normal = source.warpTabBarItemTinted(state: .normal)
        let selected = source.warpTabBarItemTinted(state: .selected)
        #expect(renderedBytes(of: normal) != renderedBytes(of: selected))
    }
}
