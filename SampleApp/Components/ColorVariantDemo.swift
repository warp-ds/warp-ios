import SwiftUI
import Warp

/// Demonstrates how `warpColorVariant(_:)` is scoped.
///
/// Shaped like Fashion Hub's filters flow so the scoping questions are answered by looking at
/// the screen. Watch the primary button: premium renders it near-black, stock FINN blue.
struct ColorVariantDemo: View {
    @State private var isSheetPresented = false
    @State private var isNestedSheetPresented = false
    @State private var switchValue = true
    @State private var isCheckboxSelected = true
    @State private var stockSliderValue = 40.0
    @State private var premiumSliderValue = 40.0

    var body: some View {
        // No NavigationStack here: the sample app already pushes this into one, and nesting
        // stacks produces a second navigation bar.
        ScrollView {
            VStack(alignment: .leading, spacing: Warp.Spacing.spacing200) {
                singleComponent
                Divider()
                sliderComparison
                Divider()
                containerWithSibling
                Divider()
                resetInsideVariant
                Divider()
                navigationOutOfVariant
                Divider()
                sheetFromInsideVariant
            }
            .padding()
        }
        .navigationTitle("Colour variant")
        .navigationBarTitleDisplayMode(.inline)
    }

    // MARK: - One component

    private var singleComponent: some View {
        section(
            "Applied to one component",
            note: "Only the button carrying the modifier changes. Its neighbour is untouched."
        ) {
            HStack(spacing: Warp.Spacing.spacing200) {
                Warp.Button(title: "Premium", action: {})
                    .warpColorVariant(.premium)
                Warp.Button(title: "Stock", action: {})
            }
        }
    }

    // MARK: - Slider, both variants

    private var sliderComparison: some View {
        section(
            "Applied to a slider",
            note: "Both sliders are interactive. The thumb and filled track derive from "
                + "backgroundPrimary, so premium recolours them while stock stays FINN blue."
        ) {
            VStack(alignment: .leading, spacing: Warp.Spacing.spacing300) {
                VStack(alignment: .leading, spacing: Warp.Spacing.spacing100) {
                    Warp.Text("Stock — \(Int(stockSliderValue))", style: .body)
                    Warp.Slider(value: $stockSliderValue, range: 0...100, step: 1)
                }

                VStack(alignment: .leading, spacing: Warp.Spacing.spacing100) {
                    Warp.Text("Premium — \(Int(premiumSliderValue))", style: .body)
                    Warp.Slider(value: $premiumSliderValue, range: 0...100, step: 1)
                }
                .warpColorVariant(.premium)
            }
        }
    }

    // MARK: - Container, and a sibling outside it

    private var containerWithSibling: some View {
        section(
            "Applied to a container",
            note: "Everything inside the group changes. The sibling below it does not."
        ) {
            VStack(alignment: .leading, spacing: Warp.Spacing.spacing200) {
                Group {
                    Warp.Button(title: "Inside group", action: {})
                    Warp.Switch(isOn: $switchValue)
                    Warp.Checkbox(isSelected: $isCheckboxSelected, label: "Inside group")
                }
                .warpColorVariant(.premium)

                Warp.Button(title: "Sibling, outside group", action: {})
            }
        }
    }

    // MARK: - Opting back out

    private var resetInsideVariant: some View {
        section(
            "Opting out inside a variant",
            note: "A nested .warpColorVariant(nil) returns a subtree to the brand."
        ) {
            VStack(alignment: .leading, spacing: Warp.Spacing.spacing200) {
                Warp.Button(title: "Premium", action: {})
                Warp.Button(title: "Opted back out", action: {})
                    .warpColorVariant(nil)
            }
            .warpColorVariant(.premium)
        }
    }

    // MARK: - Navigating out

    private var navigationOutOfVariant: some View {
        section(
            "Pushing a destination",
            note: "Verified: neither inherits. A push renders outside the link's subtree, "
                + "so apply the variant per screen."
        ) {
            VStack(alignment: .leading, spacing: Warp.Spacing.spacing100) {
                // Even declared here, the destination renders outside this subtree.
                NavigationLink {
                    DestinationScreen(title: "Pushed from inside the variant")
                } label: {
                    Warp.Text("Push from inside the variant", style: .body)
                }
                .warpColorVariant(.premium)

                NavigationLink {
                    DestinationScreen(title: "Pushed from outside the variant")
                } label: {
                    Warp.Text("Push from outside the variant", style: .body)
                }
            }
        }
    }

    // MARK: - Presenting a sheet

    private var sheetFromInsideVariant: some View {
        section(
            "Presenting a sheet",
            note: "Verified: attaching .sheet before the variant inherits it, after does not."
        ) {
            VStack(alignment: .leading, spacing: Warp.Spacing.spacing200) {
                // .sheet attached after the variant, so the sheet is outside its subtree.
                Warp.Button(title: "Sheet attached after variant", action: { isSheetPresented = true })
                    .warpColorVariant(.premium)
                    .sheet(isPresented: $isSheetPresented) {
                        SheetScreen(title: "Attached after .warpColorVariant")
                    }

                // .sheet attached before the variant, so the variant wraps the presentation.
                Warp.Button(title: "Sheet attached before variant", action: { isNestedSheetPresented = true })
                    .sheet(isPresented: $isNestedSheetPresented) {
                        SheetScreen(title: "Attached before .warpColorVariant")
                    }
                    .warpColorVariant(.premium)
            }
        }
    }

    // MARK: - Layout helper

    private func section(
        _ title: String,
        note: String,
        @ViewBuilder content: () -> some View
    ) -> some View {
        VStack(alignment: .leading, spacing: Warp.Spacing.spacing100) {
            Warp.Text(title, style: .title4)
            Warp.Text(note, style: .detail)
                .foregroundColor(Warp.Token.textSubtle)
            content()
        }
    }
}

// MARK: - Destinations

// A destination in its own type, as real screens are.
private struct DestinationScreen: View {
    let title: String

    var body: some View {
        VStack(alignment: .leading, spacing: Warp.Spacing.spacing200) {
            Warp.Text(title, style: .title4)
            Warp.Button(title: "Primary button", action: {})
            Spacer()
        }
        .padding()
    }
}

// Nested `NavigationStack`, mirroring Fashion Hub's filters sheet.
private struct SheetScreen: View {
    let title: String

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: Warp.Spacing.spacing200) {
                Warp.Text(title, style: .title4)
                Warp.Button(title: "Primary button", action: {})
                Spacer()
            }
            .padding()
            .navigationTitle("Sheet")
        }
    }
}

#Preview {
    ColorVariantDemo()
        .warpTheme(.finn)
}
