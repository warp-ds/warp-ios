import Testing
import SnapshotTesting
import SwiftUI
@testable import Warp

@Suite @MainActor
struct MenuSnapshotTests {

    // MARK: - Menu button label styles

    @Test(arguments: Warp.Brand.allCases)
    func snapshotMenuButtonStyles(brand: Warp.Brand) {
        Warp.Theme = brand

        let view = VStack(alignment: .leading, spacing: 16) {
            ForEach([Warp.MenuButtonStyle.default, .primary, .destructive], id: \.label) { style in
                GroupBox(style.label) {
                    Menu("Open menu") {
                        Warp.MenuItem("Share", icon: .share) {}
                        Warp.MenuItem("Bookmark", icon: .bookmark) {}
                        Warp.MenuItem("Delete", role: .destructive) {}
                    }
                    .warpMenuButton(style: style)
                }
            }
        }
        .padding(16)
        .frame(width: ViewImageConfig.iPhone13.size!.width)

        assertSnapshot(of: view, as: .warpImage(), named: ".\(brand.description)")
    }

    // MARK: - MenuItem variants

    @Test(arguments: Warp.Brand.allCases)
    func snapshotMenuItems(brand: Warp.Brand) {
        Warp.Theme = brand

        let view = VStack(alignment: .leading, spacing: 16) {
            GroupBox("Text only") {
                VStack(alignment: .leading, spacing: 4) {
                    Warp.MenuItem("Edit") {}
                    Warp.MenuItem("Bookmark") {}
                    Warp.MenuItem("Archive") {}
                }
            }

            GroupBox("With Warp icon") {
                VStack(alignment: .leading, spacing: 4) {
                    Warp.MenuItem("Share", icon: .share) {}
                    Warp.MenuItem("Bookmark", icon: .bookmark) {}
                    Warp.MenuItem("Edit", icon: .edit) {}
                    Warp.MenuItem("Copy", icon: .copy) {}
                }
            }

            GroupBox("Destructive") {
                VStack(alignment: .leading, spacing: 4) {
                    Warp.MenuItem("Delete", role: .destructive) {}
                    Warp.MenuItem("Remove", icon: .heartRate, role: .destructive) {}
                }
            }
        }
        .padding(16)
        .frame(width: ViewImageConfig.iPhone13.size!.width)

        assertSnapshot(of: view, as: .warpImage(), named: ".\(brand.description)")
    }
}

// MARK: - Helpers

private extension Warp.MenuButtonStyle {
    var label: String {
        switch self {
        case .default: return "Default"
        case .primary: return "Primary"
        case .destructive: return "Destructive"
        }
    }
}

extension Warp.MenuButtonStyle: Identifiable {
    public var id: String { label }
}
