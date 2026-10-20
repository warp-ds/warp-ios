import SwiftUI
import UIKit

extension Warp {
    // MARK: - Delegate

    @MainActor
    public protocol GlassSegmentedControlDelegate: AnyObject {
        func glassSegmentedControl(
            _ control: GlassSegmentedControl,
            didSelectItemWithIdentifier identifier: String
        )
    }

    // MARK: - GlassSegmentedControl

    /// A scrollable segmented control that uses `UISegmentedControl` with Liquid Glass on iOS 26+
    /// and a custom tab strip on earlier versions.
    ///
    /// Segments can display an optional notification badge (dot or count). The visual style of all
    /// badges is controlled via the `badgeType` parameter in `configure(items:selectedIdentifier:badgeType:)`.
    ///
    /// **UIKit usage:**
    /// ```swift
    /// let control = Warp.GlassSegmentedControl()
    /// control.delegate = self
    /// control.configure(
    ///     items: [
    ///         .init(identifier: "tab1", title: "First", badge: 3),
    ///         .init(identifier: "tab2", title: "Second"),
    ///     ],
    ///     selectedIdentifier: "tab1",
    ///     badgeType: .primary
    /// )
    /// ```
    @MainActor
    public final class GlassSegmentedControl: UIView {

    // MARK: - Item

    public struct Item: Hashable {
        public let identifier: String
        public let title: String
        /// `nil` hides the badge. `0` renders a dot indicator. Any positive value renders a numeric
        /// count, capped at "99+" by default.
        public let badge: Int?

        public init(identifier: String, title: String, badge: Int? = nil) {
            self.identifier = identifier
            self.title = title
            self.badge = badge
        }
    }

    // MARK: - Public properties

    public weak var delegate: GlassSegmentedControlDelegate?

    // MARK: - Private properties

    private var items: [Item] = []
    private let usesGlassSegments: Bool
    private var badgeType: Warp.NotificationBadgeType = .default
    private var lastSelectedIdentifier: String?
    private var badgeViewsByIndex: [Int: BadgeView] = [:]
    private var cachedTitleWidths: [CGFloat] = []
    private var naturalSegmentWidths: [CGFloat] = []
    private static let segmentHorizontalPadding: CGFloat = 32
    // Prevents a 1px gap between the glass container border and the system control's background pill.
    private static let glassHeightPadding: CGFloat = 1

    // MARK: - iOS 26+

    private lazy var glassContainer: GlassControlContainer<UIScrollView> = {
        GlassControlContainer(
            content: scrollView,
            cornerRadius: 22,
            borderWidth: 0,
            borderColor: .clear
        )
    }()

    private var scrollObservation: NSKeyValueObservation?

    private lazy var scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.showsHorizontalScrollIndicator = false
        sv.showsVerticalScrollIndicator = false
        sv.alwaysBounceHorizontal = false
        sv.alwaysBounceVertical = false
        sv.backgroundColor = .clear
        sv.contentInsetAdjustmentBehavior = .never
        return sv
    }()

    private lazy var segmentedControl: ScrollableSegmentControl = {
        let control = ScrollableSegmentControl(items: [])
        control.translatesAutoresizingMaskIntoConstraints = false
        control.apportionsSegmentWidthsByContent = true
        let font = Warp.Typography.captionStrong.uiFont
        control.setTitleTextAttributes([.font: font, .foregroundColor: Warp.UIToken.text], for: .normal)
        control.setTitleTextAttributes([.font: font, .foregroundColor: Warp.UIToken.text], for: .selected)
        control.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
        return control
    }()

    // MARK: - Pre-iOS 26

    private lazy var scrollableTabView: ScrollableTabView = {
        let view = ScrollableTabView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.onSelect = { [weak self] identifier in
            guard let self else { return }
            delegate?.glassSegmentedControl(self, didSelectItemWithIdentifier: identifier)
        }
        return view
    }()

    // MARK: - Init

    public init() {
        if #available(iOS 26, *) {
            self.usesGlassSegments = true
        } else {
            self.usesGlassSegments = false
        }
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear
        setupSubviews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public methods

    /// Populates the control with segments and selects the initial segment.
    ///
    /// Call this whenever items or selection changes. Safe to call multiple times.
    ///
    /// - Parameters:
    ///   - items: Ordered list of segments to display.
    ///   - selectedIdentifier: The `identifier` of the segment to select, or `nil` for no selection.
    ///   - badgeType: Visual style applied to all badges on iOS 26+. Defaults to `.default` (red).
    ///     Use `.primary` for blue. Has no effect before iOS 26, where badges are always rendered in red.
    public func configure(
        items: [Item],
        selectedIdentifier: String?,
        badgeType: Warp.NotificationBadgeType = .default
    ) {
        self.items = items
        self.badgeType = badgeType
        self.lastSelectedIdentifier = selectedIdentifier

        if usesGlassSegments {
            configureSegmentedControl(selectedIdentifier: selectedIdentifier)
        } else {
            configureScrollableTabView(selectedIdentifier: selectedIdentifier)
        }
    }

    public func updateShadow(using scrollView: UIScrollView, scrollViewParentView: UIView?) {
        guard !usesGlassSegments else { return }
        scrollableTabView.updateShadow(using: scrollView, scrollViewParentView: scrollViewParentView)
    }

    // MARK: - Layout

    public override var intrinsicContentSize: CGSize {
        usesGlassSegments
            ? CGSize(width: UIView.noIntrinsicMetric, height: segmentedControl.intrinsicContentSize.height + Self.glassHeightPadding)
            : scrollableTabView.intrinsicContentSize
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
        if usesGlassSegments {
            stretchSegmentsIfNeeded()
            glassContainer.layer.cornerRadius = glassContainer.bounds.height / 2
            glassContainer.layoutIfNeeded()
            layoutBadges()
        }
    }

    private func stretchSegmentsIfNeeded() {
        let count = segmentedControl.numberOfSegments
        guard count > 0, naturalSegmentWidths.count == count else { return }

        let availableWidth = glassContainer.bounds.width
        guard availableWidth > 0 else { return }

        let naturalTotal = naturalSegmentWidths.reduce(0, +)

        if naturalTotal < availableWidth {
            let scale = availableWidth / naturalTotal
            var assigned: CGFloat = 0
            for i in 0..<count {
                let w = i == count - 1 ? availableWidth - assigned : floor(naturalSegmentWidths[i] * scale)
                segmentedControl.setWidth(w, forSegmentAt: i)
                assigned += w
            }
        } else {
            for i in 0..<count {
                segmentedControl.setWidth(naturalSegmentWidths[i], forSegmentAt: i)
            }
        }
    }

    // MARK: - Private setup

    private func setupSubviews() {
        if usesGlassSegments {
            setupGlassSegments()
        } else {
            setupScrollableTabView()
        }
    }

    private func setupGlassSegments() {
        addSubview(glassContainer)
        scrollView.addSubview(segmentedControl)
        segmentedControl.scrollView = scrollView

        NSLayoutConstraint.activate([
            glassContainer.topAnchor.constraint(equalTo: topAnchor),
            glassContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            glassContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            glassContainer.bottomAnchor.constraint(equalTo: bottomAnchor),

            segmentedControl.topAnchor.constraint(equalTo: scrollView.frameLayoutGuide.topAnchor),
            segmentedControl.bottomAnchor.constraint(equalTo: scrollView.frameLayoutGuide.bottomAnchor, constant: -Self.glassHeightPadding),
            segmentedControl.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            segmentedControl.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            segmentedControl.widthAnchor.constraint(greaterThanOrEqualTo: scrollView.frameLayoutGuide.widthAnchor),
            scrollView.contentLayoutGuide.heightAnchor.constraint(equalTo: scrollView.frameLayoutGuide.heightAnchor),
        ])

        scrollObservation = scrollView.observe(\.contentOffset, options: [.new]) { [weak self] _, _ in
            MainActor.assumeIsolated {
                self?.layoutBadges()
            }
        }

        registerForTraitChanges([UITraitPreferredContentSizeCategory.self]) { (target: GlassSegmentedControl, _: UITraitCollection) in
            target.configureSegmentedControl(selectedIdentifier: target.lastSelectedIdentifier)
        }
    }

    private func setupScrollableTabView() {
        addSubview(scrollableTabView)
        NSLayoutConstraint.activate([
            scrollableTabView.topAnchor.constraint(equalTo: topAnchor),
            scrollableTabView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollableTabView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollableTabView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

    // MARK: - iOS 26+ configuration

    private func configureSegmentedControl(selectedIdentifier: String?) {
        segmentedControl.removeAllSegments()
        segmentedControl.apportionsSegmentWidthsByContent = false
        let font = Warp.Typography.captionStrong.uiFont
        let textAttributes: [NSAttributedString.Key: Any] = [.font: font]

        cachedTitleWidths = items.map {
            ceil(($0.title as NSString).size(withAttributes: textAttributes).width)
        }

        naturalSegmentWidths = []
        for (index, item) in items.enumerated() {
            segmentedControl.insertSegment(withTitle: item.title, at: index, animated: false)

            let baseWidth = cachedTitleWidths[index] + Self.segmentHorizontalPadding
            if let badge = item.badge {
                let badgeSize = BadgeView.sizeFor(badge: badge)
                let extraSpace = BadgeView.badgeSpacing + badgeSize.width
                let w = baseWidth + extraSpace
                segmentedControl.setWidth(w, forSegmentAt: index)
                segmentedControl.setContentOffset(
                    CGSize(width: -extraSpace / 2, height: 0),
                    forSegmentAt: index
                )
                naturalSegmentWidths.append(w)
            } else {
                segmentedControl.setWidth(baseWidth, forSegmentAt: index)
                naturalSegmentWidths.append(baseWidth)
            }
        }

        for (index, item) in items.enumerated() {
            guard let badge = item.badge, badge > 0 else { continue }
            let badgeText = badge > 99 ? "99+" : "\(badge)"
            if let segmentView = segmentedControl.accessibilityElement(at: index) as? UIView {
                segmentView.accessibilityLabel = "\(item.title), \(badgeText)"
            }
        }

        if let selectedIdentifier,
           let selectedIndex = items.firstIndex(where: { $0.identifier == selectedIdentifier }) {
            segmentedControl.selectedSegmentIndex = selectedIndex
            DispatchQueue.main.async { [weak self] in
                self?.scrollToSegment(at: selectedIndex, animated: false)
            }
        }

        configureBadges()
        invalidateIntrinsicContentSize()
    }

    // MARK: - Pre-iOS 26 configuration

    private func configureScrollableTabView(selectedIdentifier: String?) {
        scrollableTabView.configure(items: items, selectedIdentifier: selectedIdentifier)
    }

    // MARK: - Badge management

    private func configureBadges() {
        badgeViewsByIndex.values.forEach { $0.removeFromSuperview() }
        badgeViewsByIndex.removeAll()

        for (index, item) in items.enumerated() {
            guard let badge = item.badge else { continue }
            let badgeView = BadgeView(badge: badge, badgeType: badgeType)
            badgeView.isUserInteractionEnabled = false
            badgeView.isAccessibilityElement = false
            badgeViewsByIndex[index] = badgeView
            glassContainer.addSubview(badgeView)
        }

        setNeedsLayout()
    }

    private func layoutBadges() {
        let segmentCount = segmentedControl.numberOfSegments
        guard segmentCount > 0, !badgeViewsByIndex.isEmpty else { return }

        let controlHeight = segmentedControl.bounds.height

        var leadingX: CGFloat = 0
        for index in 0..<segmentCount {
            let segWidth = segmentedControl.widthForSegment(at: index)

            guard let badgeView = badgeViewsByIndex[index], index < cachedTitleWidths.count else {
                leadingX += segWidth
                continue
            }

            let segmentCenterX = leadingX + segWidth / 2
            let contentOffset = segmentedControl.contentOffsetForSegment(at: index)
            let titleCenterX = segmentCenterX + contentOffset.width
            let titleTrailingX = titleCenterX + cachedTitleWidths[index] / 2

            let anchorPoint = CGPoint(x: titleTrailingX, y: controlHeight / 2)
            let anchorInSelf = segmentedControl.convert(anchorPoint, to: glassContainer)

            let badgeSize = badgeView.cachedBadgeSize
            badgeView.frame = CGRect(
                x: anchorInSelf.x + BadgeView.badgeSpacing,
                y: anchorInSelf.y - badgeSize.height / 2,
                width: badgeSize.width,
                height: badgeSize.height
            )

            leadingX += segWidth
        }
    }

    // MARK: - Private methods

    private func scrollToSegment(at index: Int, animated: Bool) {
        guard items.count > 1 else { return }
        layoutIfNeeded()

        let totalWidth = segmentedControl.bounds.width
        let visibleWidth = scrollView.bounds.width
        guard totalWidth > visibleWidth else { return }

        var leadingX: CGFloat = 0
        for i in 0..<index { leadingX += segmentedControl.widthForSegment(at: i) }
        let segmentCenter = leadingX + segmentedControl.widthForSegment(at: index) / 2
        let maxOffset = totalWidth - visibleWidth
        let targetOffset = max(0, min(segmentCenter - visibleWidth / 2, maxOffset))

        scrollView.setContentOffset(CGPoint(x: targetOffset, y: 0), animated: animated)
    }

    @objc private func segmentChanged(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        guard index >= 0, index < items.count else { return }

        lastSelectedIdentifier = items[index].identifier
        scrollToSegment(at: index, animated: true)
        delegate?.glassSegmentedControl(self, didSelectItemWithIdentifier: items[index].identifier)
    }
}

    // MARK: - ScrollableSegmentControl

    private final class ScrollableSegmentControl: UISegmentedControl {
        weak var scrollView: UIScrollView?

        override func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
            if scrollView?.gestureRecognizers?.contains(gestureRecognizer) == true {
                return true
            }
            return super.gestureRecognizerShouldBegin(gestureRecognizer)
        }

        override func layoutSubviews() {
            super.layoutSubviews()
            
            // UISegmentedControl renders its background and divider via internal UIImageViews.
            // Hiding them prevents the system gray pill from mixing with GlassControlContainer's background.
            // Relies on UIKit's private view hierarchy — verified on iOS 26 and 27.1.
            let subviews = subviews.filter { $0 is UIImageView }
            subviews.forEach { $0.isHidden = true }
        }
    }

    // MARK: - BadgeView

    private final class BadgeView: UIView {
        static let badgeSpacing: CGFloat = 4
        let cachedBadgeSize: CGSize
        private let hostingController: UIHostingController<Warp.NotificationBadge>?

        static func sizeFor(badge: Int) -> CGSize {
            let metrics = NotificationBadgeStyle.metrics(for: .small)
            if badge == 0 {
                return CGSize(width: metrics.dotDiameter, height: metrics.dotDiameter)
            }
            let text = badge > 99 ? "99+" : "\(badge)"
            let height = metrics.height
            if NotificationBadgeStyle.isCircular(text: text) {
                return CGSize(width: height, height: height)
            }
            let font = Warp.Typography.detailStrong.uiFont
            let textWidth = ceil((text as NSString).size(withAttributes: [.font: font]).width)
            let width = max(height, textWidth + metrics.horizontalPadding * 2)
            return CGSize(width: width, height: height)
        }

        init(badge: Int?, badgeType: Warp.NotificationBadgeType) {
            if let badge {
                cachedBadgeSize = Self.sizeFor(badge: badge)
                let content: Warp.NotificationBadgeContent = badge == 0 ? .dot : .count(badge)
                let vc = UIHostingController(rootView: Warp.NotificationBadge(content, type: badgeType, size: .small))
                vc.view.backgroundColor = .clear
                hostingController = vc
            } else {
                cachedBadgeSize = .zero
                hostingController = nil
            }
            super.init(frame: .zero)
            backgroundColor = .clear
            guard let vc = hostingController else { return }
            addSubview(vc.view)
            vc.view.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                vc.view.leadingAnchor.constraint(equalTo: leadingAnchor),
                vc.view.trailingAnchor.constraint(equalTo: trailingAnchor),
                vc.view.topAnchor.constraint(equalTo: topAnchor),
                vc.view.bottomAnchor.constraint(equalTo: bottomAnchor),
            ])
        }

        @available(*, unavailable)
        required init?(coder: NSCoder) { fatalError() }
    }
}
