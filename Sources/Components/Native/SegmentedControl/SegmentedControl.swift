import SwiftUI

extension Warp {
    /// A scrollable segmented control that uses `UISegmentedControl` with Liquid Glass on iOS 26+
    /// and a custom tab strip on earlier versions.
    ///
    /// Segments can display an optional notification badge (dot or count). Pass `badgeType` to
    /// choose between a red (`.default`) or blue (`.primary`) badge style. The style applies to
    /// all badges and can be changed at any time — the control updates without losing selection state.
    ///
    /// **Usage:**
    /// ```swift
    /// @State private var selected: String? = "tab1"
    ///
    /// Warp.SegmentedControl(
    ///     items: [
    ///         .init(identifier: "tab1", title: "First", badge: 3),
    ///         .init(identifier: "tab2", title: "Second"),
    ///     ],
    ///     selectedIdentifier: $selected,
    ///     badgeType: .primary
    /// )
    /// ```
    public struct SegmentedControl: UIViewRepresentable {

        public typealias Item = GlassSegmentedControl.Item

        private let items: [Item]
        private let badgeType: Warp.NotificationBadgeType
        @Binding private var selectedIdentifier: String?

        /// Creates a segmented control.
        ///
        /// - Parameters:
        ///   - items: Ordered list of segments to display.
        ///   - selectedIdentifier: Binding to the `identifier` of the selected segment.
        ///   - badgeType: Visual style applied to all badges. Defaults to `.default` (red). Use `.primary` for blue.
        public init(
            items: [Item],
            selectedIdentifier: Binding<String?>,
            badgeType: Warp.NotificationBadgeType = .default
        ) {
            self.items = items
            self.badgeType = badgeType
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
            let intrinsicSize = uiView.intrinsicContentSize
            guard intrinsicSize.height != UIView.noIntrinsicMetric, intrinsicSize.height > 0 else { return nil }

            guard let width = proposal.width else { return nil }
            return CGSize(width: width, height: intrinsicSize.height)
        }

        public func updateUIView(_ uiView: Warp.GlassSegmentedControl, context: Context) {
            context.coordinator.parent = self
            let coordinator = context.coordinator
            guard items != coordinator.lastItems
                || selectedIdentifier != coordinator.lastSelectedIdentifier
                || badgeType != coordinator.lastBadgeType
            else { return }
            coordinator.lastItems = items
            coordinator.lastSelectedIdentifier = selectedIdentifier
            coordinator.lastBadgeType = badgeType
            uiView.configure(items: items, selectedIdentifier: selectedIdentifier, badgeType: badgeType)
        }

        @MainActor
        public final class Coordinator: NSObject, Warp.GlassSegmentedControlDelegate {
            var parent: SegmentedControl
            var lastItems: [Item] = []
            var lastSelectedIdentifier: String? = nil
            var lastBadgeType: Warp.NotificationBadgeType = .default

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
                .init(identifier: "a", title: "First", badge: 4),
                .init(identifier: "b", title: "Second"),
                .init(identifier: "c", title: "Third tab", badge: 4),
                .init(identifier: "d", title: "Fourth"),
                .init(identifier: "e", title: "Fifth tab with long title"),
            ],
            selectedIdentifier: $selected
        )
        .padding(.horizontal, Warp.Spacing.spacing200)

        Text("Selected: \(selected ?? "none")")
    }
    .padding()
}
