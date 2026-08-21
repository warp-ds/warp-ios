import SwiftUI

extension Warp {
    /// A scrollable segmented control that uses `UISegmentedControl` with Liquid Glass on iOS 26+
    /// and a custom tab strip on earlier versions.
    ///
    /// **Usage:**
    /// ```swift
    /// @State private var selected: String? = "tab1"
    ///
    /// Warp.SegmentedControl(
    ///     items: [
    ///         .init(identifier: "tab1", title: "First"),
    ///         .init(identifier: "tab2", title: "Second"),
    ///     ],
    ///     selectedIdentifier: $selected
    /// )
    /// ```
    public struct SegmentedControl: UIViewRepresentable {

        public typealias Item = GlassSegmentedControl.Item

        private let items: [Item]
        @Binding private var selectedIdentifier: String?

        public init(items: [Item], selectedIdentifier: Binding<String?>) {
            self.items = items
            self._selectedIdentifier = selectedIdentifier
        }

        public func makeCoordinator() -> Coordinator {
            Coordinator(parent: self)
        }

        public func makeUIView(context: Context) -> Warp.GlassSegmentedControl {
            let control = Warp.GlassSegmentedControl()
            control.translatesAutoresizingMaskIntoConstraints = true
            control.delegate = context.coordinator
            return control
        }

        public func sizeThatFits(_ proposal: ProposedViewSize, uiView: Warp.GlassSegmentedControl, context: Context) -> CGSize? {
            let height = uiView.intrinsicContentSize.height
            guard height != UIView.noIntrinsicMetric, height > 0 else { return nil }
            return CGSize(width: proposal.width ?? 0, height: height)
        }

        public func updateUIView(_ uiView: Warp.GlassSegmentedControl, context: Context) {
            context.coordinator.parent = self
            let coordinator = context.coordinator
            guard items != coordinator.lastItems || selectedIdentifier != coordinator.lastSelectedIdentifier else { return }
            coordinator.lastItems = items
            coordinator.lastSelectedIdentifier = selectedIdentifier
            uiView.configure(items: items, selectedIdentifier: selectedIdentifier)
        }

        @MainActor
        public final class Coordinator: NSObject, Warp.GlassSegmentedControlDelegate {
            var parent: SegmentedControl
            var lastItems: [Item] = []
            var lastSelectedIdentifier: String? = nil

            init(parent: SegmentedControl) {
                self.parent = parent
            }

            public func glassSegmentedControl(
                _ control: Warp.GlassSegmentedControl,
                didSelectItemWithIdentifier identifier: String
            ) {
                lastSelectedIdentifier = identifier
                parent.selectedIdentifier = identifier
            }
        }
    }
}

#Preview {
    @Previewable @State var selected: String? = "b"

    VStack(spacing: 40) {
        Warp.SegmentedControl(
            items: [
                .init(identifier: "a", title: "First"),
                .init(identifier: "b", title: "Second"),
                .init(identifier: "c", title: "Third tab"),
                .init(identifier: "d", title: "Fourth"),
                .init(identifier: "e", title: "Fifth tab with long title"),
            ],
            selectedIdentifier: $selected
        )
        .fixedSize(horizontal: false, vertical: true)

        Text("Selected: \(selected ?? "none")")
    }
    .padding()
}
