import SwiftUI

// Collects each segment's frame in the HStack coordinate space.
private struct SegmentFrameKey: PreferenceKey {
    static var defaultValue: [String: CGRect] = [:]
    static func reduce(value: inout [String: CGRect], nextValue: () -> [String: CGRect]) {
        value.merge(nextValue()) { _, new in new }
    }
}

extension Warp {

    /// Pure SwiftUI scrollable segmented control.
    ///
    /// iOS 26+: glass capsule outer body + morphing glass pill selection indicator via `glassEffectID`.
    /// iOS 18–25: material capsule body + matched-geometry pill fallback.
    /// Both support tap-to-select and drag-to-slide the pill between items.
    ///
    /// ```swift
    /// @State private var selected: String? = "a"
    ///
    /// Warp.GlassCapsuleSegmentedControl(
    ///     items: [
    ///         .init(id: "a", title: "First"),
    ///         .init(id: "b", title: "Second"),
    ///         .init(id: "c", title: "Third"),
    ///     ],
    ///     selectedID: $selected
    /// )
    /// ```
    public struct GlassCapsuleSegmentedControl: View {

        public struct Item: Hashable, Identifiable {
            public let id: String
            public let title: String

            public init(id: String, title: String) {
                self.id = id
                self.title = title
            }
        }

        private let items: [Item]
        @Binding private var selectedID: String?
        @Namespace private var pillNamespace

        @Environment(\.warpTheme) private var theme
        private var colorProvider: ColorProvider { theme.colors }

        @State private var segmentFrames: [String: CGRect] = [:]

        public init(items: [Item], selectedID: Binding<String?>) {
            self.items = items
            self._selectedID = selectedID
        }

        public var body: some View {
            ScrollViewReader { proxy in
                Group {
                    if #available(iOS 26, *) {
                        glassBody
                    } else {
                        fallbackBody
                    }
                }
                .onAppear {
                    guard let id = selectedID else { return }
                    proxy.scrollTo(id, anchor: .center)
                }
                .onChange(of: selectedID) { _, newID in
                    guard let newID else { return }
                    withAnimation { proxy.scrollTo(newID, anchor: .center) }
                }
            }
            .sensoryFeedback(.selection, trigger: selectedID)
        }

        // MARK: - Drag support

        private func dragGesture() -> some Gesture {
            DragGesture(minimumDistance: 0, coordinateSpace: .named("segments"))
                .onChanged { value in select(at: value.location) }
                .onEnded { value in select(at: value.location) }
        }

        private func select(at point: CGPoint) {
            for (id, frame) in segmentFrames where frame.contains(point) {
                guard selectedID != id else { return }
                selectedID = id
                return
            }
        }

        // MARK: - iOS 26+ Glass

        @available(iOS 26, *)
        private var glassBody: some View {
            GlassEffectContainer {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0) {
                        ForEach(items) { item in
                            glassSegment(item)
                        }
                    }
                    .padding(3)
                    .coordinateSpace(name: "segments")
                    .highPriorityGesture(dragGesture())
                    .onPreferenceChange(SegmentFrameKey.self) { segmentFrames = $0 }
                }
                .scrollBounceBehavior(.basedOnSize, axes: .horizontal)
                .fixedSize(horizontal: false, vertical: true)
                .glassEffect(in: Capsule())
            }
        }

        @available(iOS 26, *)
        @ViewBuilder
        private func glassSegment(_ item: Item) -> some View {
            let isSelected = selectedID == item.id
            SwiftUI.Button(
                action: {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.75)) {
                        selectedID = item.id
                    }
                },
                label: {
                    SwiftUI.Text(item.title)
                        .font(from: .captionStrong)
                        .foregroundColor(colorProvider.token.text)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 7)
                        .contentShape(Capsule())
                }
            )
            .buttonStyle(PlainButtonStyle())
            .background {
                if isSelected {
                    Capsule()
                        .glassEffect(.regular.interactive())
                        .glassEffectID("pill", in: pillNamespace)
                        .padding(.vertical, -3)
                }
            }
            .background {
                GeometryReader { geo in
                    SwiftUI.Color.clear.preference(
                        key: SegmentFrameKey.self,
                        value: [item.id: geo.frame(in: .named("segments"))]
                    )
                }
            }
            .id(item.id)
        }

        // MARK: - iOS 18 Fallback

        private var fallbackBody: some View {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(items) { item in
                        fallbackSegment(item)
                    }
                }
                .padding(3)
                .coordinateSpace(name: "segments")
                .highPriorityGesture(dragGesture())
                .onPreferenceChange(SegmentFrameKey.self) { segmentFrames = $0 }
            }
            .scrollBounceBehavior(.basedOnSize, axes: .horizontal)
            .fixedSize(horizontal: false, vertical: true)
            .background(.regularMaterial, in: Capsule())
        }

        @ViewBuilder
        private func fallbackSegment(_ item: Item) -> some View {
            let isSelected = selectedID == item.id
            SwiftUI.Button(
                action: {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.75)) {
                        selectedID = item.id
                    }
                },
                label: {
                    SwiftUI.Text(item.title)
                        .font(from: .captionStrong)
                        .foregroundColor(isSelected ? colorProvider.token.text : colorProvider.token.textSubtle)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 7)
                        .background {
                            if isSelected {
                                Capsule()
                                    .fill(colorProvider.token.surfaceElevated200)
                                    .shadow(color: .black.opacity(0.12), radius: 4, x: 0, y: 2)
                                    .matchedGeometryEffect(id: "pill", in: pillNamespace)
                            }
                        }
                        .contentShape(Capsule())
                }
            )
            .buttonStyle(PlainButtonStyle())
            .background {
                GeometryReader { geo in
                    SwiftUI.Color.clear.preference(
                        key: SegmentFrameKey.self,
                        value: [item.id: geo.frame(in: .named("segments"))]
                    )
                }
            }
            .id(item.id)
        }
    }
}

#Preview("Glass Capsule Segmented Control") {
    @Previewable @State var selected: String? = "b"

    ZStack {
        LinearGradient(
            colors: [.blue.opacity(0.3), .purple.opacity(0.4)],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .ignoresSafeArea()

        VStack(spacing: 32) {
            Warp.GlassCapsuleSegmentedControl(
                items: [
                    .init(id: "a", title: "First"),
                    .init(id: "b", title: "Second"),
                    .init(id: "c", title: "Third"),
                ],
                selectedID: $selected
            )

            Warp.GlassCapsuleSegmentedControl(
                items: [
                    .init(id: "a", title: "Alpha"),
                    .init(id: "b", title: "Beta"),
                    .init(id: "c", title: "Gamma"),
                    .init(id: "d", title: "Delta"),
                    .init(id: "e", title: "Epsilon"),
                    .init(id: "f", title: "Zeta with long title"),
                    .init(id: "g", title: "Eta"),
                ],
                selectedID: $selected
            )

            Text("Selected: \(selected ?? "none")")
                .foregroundStyle(.primary)
        }
        .padding(.horizontal, Warp.Spacing.spacing200)
    }
}
