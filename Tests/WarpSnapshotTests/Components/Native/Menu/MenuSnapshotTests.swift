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
            ForEach([Warp.MenuButtonStyle.default, .destructive], id: \.label) { style in
                GroupBox(style.label) {
                    SwiftUI.Menu("Open menu") {
                        Warp.MenuButton("Share", icon: .share) {}
                        Warp.MenuButton("Bookmark", icon: .bookmark) {}
                        Warp.MenuButton("Delete", style: .destructive) {}
                    }
                    .warpMenuButton(style: style)
                }
            }
        }
        .padding(16)
        .frame(width: ViewImageConfig.iPhone13.size!.width)

        assertSnapshot(of: view, as: .warpImage(), named: ".\(brand.description)")
    }

    // MARK: - MenuButton variants

    @Test(arguments: Warp.Brand.allCases)
    func snapshotMenuItems(brand: Warp.Brand) {
        Warp.Theme = brand

        let view = VStack(alignment: .leading, spacing: 16) {
            GroupBox("Text only") {
                VStack(alignment: .leading, spacing: 4) {
                    Warp.MenuButton("Edit") {}
                    Warp.MenuButton("Bookmark") {}
                    Warp.MenuButton("Archive") {}
                }
            }

            GroupBox("With Warp icon") {
                VStack(alignment: .leading, spacing: 4) {
                    Warp.MenuButton("Share", icon: .share) {}
                    Warp.MenuButton("Bookmark", icon: .bookmark) {}
                    Warp.MenuButton("Edit", icon: .edit) {}
                    Warp.MenuButton("Copy", icon: .copy) {}
                }
            }

            GroupBox("Destructive") {
                VStack(alignment: .leading, spacing: 4) {
                    Warp.MenuButton("Delete", style: .destructive) {}
                    Warp.MenuButton("Remove", icon: .heartRate, style: .destructive) {}
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
        case .destructive: return "Destructive"
        }
    }
}

extension Warp.MenuButtonStyle: Identifiable {
    public var id: String { label }
}
