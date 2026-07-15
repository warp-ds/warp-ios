import Testing
import SnapshotTesting
import SwiftUI
@testable import Warp

@Suite @MainActor
struct SheetSnapshotTests {

    @Test(arguments: Warp.Brand.allCases)
    func snapshotSheetContent(brand: Warp.Brand) {
        Warp.Theme = brand

        let view = VStack(spacing: 0) {
            sheetContent(title: "Medium Sheet", useLargeTitle: false)
                .warpSheetStyle(.medium)
                .frame(height: 300)

            Divider()

            sheetContent(title: "Full Screen Sheet", useLargeTitle: true)
                .warpSheetStyle(.fullScreen)
                .frame(height: 400)
        }
        .frame(width: ViewImageConfig.iPhone13.size!.width)

        assertSnapshot(
            of: view,
            as: .warpImage(compressionQuality: .high),
            named: ".\(brand.description)"
        )
    }

    private func sheetContent(title: String, useLargeTitle: Bool) -> some View {
        NavigationStack {
            VStack(spacing: Warp.Spacing.spacing200) {
                ForEach(1...3, id: \.self) { index in
                    Warp.Text("Content row \(index)", style: .body)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(Warp.Spacing.spacing100)
                }
            }
            .padding()
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(useLargeTitle ? .large : .inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {} label: {
                        Warp.IconView(.chevronLeft, size: .default)
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {} label: {
                        Warp.IconView(.edit, size: .default)
                    }
                }
            }
        }
    }
}
