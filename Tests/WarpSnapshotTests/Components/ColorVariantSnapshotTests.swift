import Testing
import SnapshotTesting
import SwiftUI
@testable import Warp

@Suite @MainActor
struct ColorVariantSnapshotTests {

    static let userInterfaceStyles: [UIUserInterfaceStyle] = [.light, .dark]

    // Stock and premium side by side, so the snapshot shows exactly what the variant changes.
    @Test(arguments: userInterfaceStyles)
    func snapshotPremiumComparedToBrand(style: UIUserInterfaceStyle) {
        let snapshotName = style == .dark ? ".Dark" : ".Light"
        Warp.Theme = .finn

        let comparison = HStack(alignment: .top, spacing: 16) {
            ComponentColumn(title: "FINN")
            ComponentColumn(title: "FINN premium")
                .warpColorVariant(.premium)
        }
        .padding(8)
        .background(Warp.Brand.finn.token.background)
        // Set width to match iPhone 13 size
        .frame(width: ViewImageConfig.iPhone13.size!.width)

        assertSnapshot(
            of: comparison.warpTheme(.finn),
            as: .warpImage(traits: UITraitCollection(userInterfaceStyle: style), compressionQuality: .medium),
            named: snapshotName
        )
    }
}

/// The components premium recolours: those that read `backgroundPrimary` from tokens.
private struct ComponentColumn: View {
    let title: String

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Warp.Text(title, style: .title4)
            Warp.Button(title: "Primary", action: {}, type: .primary)
            Warp.Checkbox(isSelected: .constant(true), label: "Selected")
            Warp.Checkbox(isSelected: .constant(false), label: "Not selected")
            Warp.Switch(isOn: .constant(true), state: .default)
            Warp.Switch(isOn: .constant(false), state: .default)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
