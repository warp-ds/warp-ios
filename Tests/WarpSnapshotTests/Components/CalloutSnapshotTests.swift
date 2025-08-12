import Testing
import SnapshotTesting
import SwiftUI
@testable import Warp

@Suite @MainActor
struct CalloutSnapshotTests {

    static let calloutSize = Warp.CalloutSize.allCases
    static let isDismissableProvider = [false, true]
    static let allArgumentsCombined = combine(
        Warp.Brand.allCases,
        calloutSize,
        isDismissableProvider
    )

    @Test(arguments: Self.allArgumentsCombined)
    func testCalloutSnapshots(brand: Warp.Brand, size: Warp.CalloutSize, isDismissable: Bool) {
        let snapshotName = [
            ".\(brand.description)",
            ".\(size.description)Size",
            isDismissable ? "Dismissable" : nil,
        ].compactMap { $0 }.joined(separator: ".")

        // Set the theme to the current brand
        Warp.Theme = brand

        let calloutsInColumnView = VStack(alignment: .leading) {
            inlineViews(size: size)
            popoverViews(size: size, isDismissable: isDismissable)
        }
        .padding(8)
        // Set width to match iPhone 13 size
        .frame(width: ViewImageConfig.iPhone13.size!.width)

        assertSnapshot(of: calloutsInColumnView, as: .warpImage(compressionQuality: .high), named: snapshotName)
    }

    private func inlineViews(size: Warp.CalloutSize) -> some View {
        VStack(alignment: .leading) {
            Text("Inline")
                    .font(.title2)

            VStack(alignment: .leading) {
                Text("Callout over content")
                        .font(.headline)

                Warp.Callout(
                    size: size,
                    title: "ArrowEdge: .bottom and then a lot more text so we get this wrapped",
                    arrowEdge: .bottom
                )

                Text("This one sits over the content")

                Divider()
            }

            VStack(alignment: .leading) {
                Text("Callout under content")
                        .font(.headline)


                Text("This one sits under the content")

                Warp.Callout(
                    size: size,
                    title: "ArrowEdge: .top",
                    arrowEdge: .top
                )

                Divider()
            }

            VStack(alignment: .leading) {
                Text("Callout before content")
                        .font(.headline)

                HStack {
                    Warp.Callout(
                        size: size,
                        title: "Short",
                        arrowEdge: .trailing
                    )

                    Text("This one sits before the content")
                    Spacer()
                }

                Divider()
            }

            VStack(alignment: .leading) {
                Text("Callout after content")
                        .font(.headline)

                HStack {
                    Text("This one sits after the content")

                    Warp.Callout(
                        size: size,
                        title: "Short",
                        arrowEdge: .leading
                    )

                    Spacer()
                }
                Divider()
            }
        }
    }

    private func popoverViews(size: Warp.CalloutSize, isDismissable: Bool) -> some View {
        VStack(alignment: .leading) {
            Text("Popover")
                    .font(.title2)

            popoverView(
                size: size,
                isDismissable: isDismissable,
                title: "Callout over content",
                description: "This one sits over the content",
                calloutTitle: "ArrowEdge: .bottom",
                calloutEdge: .bottom,
                offset: .vertical(-20)
            )

            popoverView(
                size: size,
                isDismissable: isDismissable,
                title: "Callout under content",
                description: "This one sits under the content",
                calloutTitle: "ArrowEdge: .top",
                calloutEdge: .top,
                offset: .vertical(20)
            )

            popoverView(
                size: size,
                isDismissable: isDismissable,
                title: "Callout before content",
                description: "This one sits before the content",
                calloutTitle: "ArrowEdge: .trailing",
                calloutEdge: .trailing,
                offset: .horizontal(0)
            )

            popoverView(
                size: size,
                isDismissable: isDismissable,
                title: "Callout after content",
                description: "This one sits after the content",
                calloutTitle: "ArrowEdge: .leading",
                calloutEdge: .leading,
                offset: .horizontal(150)
            )
        }
    }

    enum Offset {
        case horizontal(Double)
        case vertical(Double)

        var cgSize: CGSize {
            switch self {
            case .horizontal(let x):
                return CGSize(width: x, height: 0)
            case .vertical(let y):
                return CGSize(width: 0, height: y)
            }
        }
    }

    func popoverView(
        size: Warp.CalloutSize,
        isDismissable: Bool,
        title: String,
        description: String,
        calloutTitle: String,
        calloutEdge: Edge,
        offset: Offset
    ) -> some View {
        ZStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text(title)
                        .font(.headline)
                Text(description)
                Divider()
            }

            Warp.Callout(
                size: size,
                type: .popover(onTapped: (isDismissable) ? {} : nil),
                title: calloutTitle,
                arrowEdge: calloutEdge
            )
            .offset(offset.cgSize)
        }
    }
}

fileprivate extension Warp.CalloutSize {
    static var allCases: [Warp.CalloutSize] {
        [.default, .small]
    }
    var description: String {
        switch self {
        case .default: return "Default"
        case .small: return "Small"
        }
    }
}
