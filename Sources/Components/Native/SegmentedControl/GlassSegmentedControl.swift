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

    @MainActor
    public final class GlassSegmentedControl: UIView {

    // MARK: - Item

    public struct Item: Hashable {
        public let identifier: String
        public let title: String
        /// nil = no badge, 0 = dot indicator, >0 = numeric count (capped at 99+)
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
    private var badgeViewsByIndex: [Int: BadgeView] = [:]
    private var cachedTitleWidths: [CGFloat] = []

    // MARK: - iOS 26+

    private lazy var glassContainer: GlassControlContainer<ControlScrollView> = {
        GlassControlContainer(
            content: scrollView,
            cornerRadius: 22,
            borderWidth: 0,
            borderColor: .clear
        )
    }()

    private var scrollObservation: NSKeyValueObservation?

    private lazy var scrollView: ControlScrollView = {
        let sv = ControlScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.showsHorizontalScrollIndicator = false
        sv.showsVerticalScrollIndicator = false
        sv.alwaysBounceHorizontal = true
        sv.alwaysBounceVertical = false
        sv.backgroundColor = .clear
        sv.contentInsetAdjustmentBehavior = .never
        return sv
    }()

    private lazy var segmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: [])
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

    public func configure(items: [Item], selectedIdentifier: String?) {
        self.items = items

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

    private static let pillBottomPadding: CGFloat = 3

    public override var intrinsicContentSize: CGSize {
        usesGlassSegments
            ? CGSize(width: UIView.noIntrinsicMetric, height: segmentedControl.intrinsicContentSize.height + Self.pillBottomPadding)
            : scrollableTabView.intrinsicContentSize
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
        if usesGlassSegments {
            glassContainer.layer.cornerRadius = glassContainer.bounds.height / 2
            layoutBadges()
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

        NSLayoutConstraint.activate([
            glassContainer.topAnchor.constraint(equalTo: topAnchor),
            glassContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            glassContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            glassContainer.bottomAnchor.constraint(equalTo: bottomAnchor),

            segmentedControl.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            segmentedControl.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            segmentedControl.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            segmentedControl.widthAnchor.constraint(greaterThanOrEqualTo: scrollView.frameLayoutGuide.widthAnchor),

            scrollView.contentLayoutGuide.heightAnchor.constraint(equalTo: segmentedControl.heightAnchor),
        ])

        scrollObservation = scrollView.observe(\.contentOffset, options: [.new]) { [weak self] _, _ in
            MainActor.assumeIsolated {
                self?.layoutBadges()
            }
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
        let font = Warp.Typography.captionStrong.uiFont
        let textAttributes: [NSAttributedString.Key: Any] = [.font: font]

        cachedTitleWidths = items.map {
            ceil(($0.title as NSString).size(withAttributes: textAttributes).width)
        }

        for (index, item) in items.enumerated() {
            segmentedControl.insertSegment(withTitle: item.title, at: index, animated: false)

            if let badge = item.badge {
                let badgeSize = BadgeView.sizeFor(badge: badge)
                let extraSpace = BadgeView.badgeSpacing + badgeSize.width
                segmentedControl.setWidth(cachedTitleWidths[index] + extraSpace + 24, forSegmentAt: index)
                segmentedControl.setContentOffset(
                    CGSize(width: -extraSpace / 2, height: 0),
                    forSegmentAt: index
                )
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
            let badgeView = BadgeView(badge: badge)
            badgeViewsByIndex[index] = badgeView
            glassContainer.addSubview(badgeView)
        }

        setNeedsLayout()
    }

    private func resolvedSegmentWidths() -> [CGFloat] {
        let count = segmentedControl.numberOfSegments
        guard count > 0 else { return [] }

        let totalWidth = segmentedControl.bounds.width
        var explicitTotal: CGFloat = 0
        var autoTitleTotal: CGFloat = 0
        var widths = [CGFloat](repeating: 0, count: count)

        for i in 0..<count {
            let w = segmentedControl.widthForSegment(at: i)
            if w > 0 {
                widths[i] = w
                explicitTotal += w
            } else if i < cachedTitleWidths.count {
                autoTitleTotal += cachedTitleWidths[i]
            }
        }

        let remaining = totalWidth - explicitTotal
        if autoTitleTotal > 0 {
            for i in 0..<count where widths[i] == 0 && i < cachedTitleWidths.count {
                widths[i] = remaining * cachedTitleWidths[i] / autoTitleTotal
            }
        }

        return widths
    }

    private func layoutBadges() {
        let segmentCount = segmentedControl.numberOfSegments
        guard segmentCount > 0, !badgeViewsByIndex.isEmpty else { return }

        let controlHeight = segmentedControl.bounds.height
        let widths = resolvedSegmentWidths()

        var leadingX: CGFloat = 0
        for index in 0..<segmentCount {
            let actualWidth = index < widths.count ? widths[index] : 0

            guard let badgeView = badgeViewsByIndex[index], index < cachedTitleWidths.count else {
                leadingX += actualWidth
                continue
            }

            let segmentCenterX = leadingX + actualWidth / 2
            let contentOffset = segmentedControl.contentOffsetForSegment(at: index)
            let titleCenterX = segmentCenterX + contentOffset.width
            let titleTrailingX = titleCenterX + cachedTitleWidths[index] / 2

            let anchorPoint = CGPoint(x: titleTrailingX, y: controlHeight / 2)
            let anchorInSelf = segmentedControl.convert(anchorPoint, to: glassContainer)

            let badgeSize = badgeView.cachedBadgeSize
            let pillExcess = max(0, badgeSize.width - badgeSize.height)
            badgeView.frame = CGRect(
                x: anchorInSelf.x + BadgeView.badgeSpacing - pillExcess / 2,
                y: anchorInSelf.y - badgeSize.height / 2,
                width: badgeSize.width,
                height: badgeSize.height
            )

            leadingX += actualWidth
        }
    }

    // MARK: - Private methods

    private func scrollToSegment(at index: Int, animated: Bool) {
        guard items.count > 1 else { return }
        layoutIfNeeded()

        let totalWidth = segmentedControl.bounds.width
        let visibleWidth = scrollView.bounds.width
        guard totalWidth > visibleWidth else { return }

        let widths = resolvedSegmentWidths()
        let leadingX = widths.prefix(index).reduce(0, +)
        let segmentCenter = leadingX + (index < widths.count ? widths[index] / 2 : 0)
        let maxOffset = totalWidth - visibleWidth
        let targetOffset = max(0, min(segmentCenter - visibleWidth / 2, maxOffset))

        scrollView.setContentOffset(CGPoint(x: targetOffset, y: 0), animated: animated)
    }

    @objc private func segmentChanged(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        guard index >= 0, index < items.count else { return }

        scrollToSegment(at: index, animated: true)
        delegate?.glassSegmentedControl(self, didSelectItemWithIdentifier: items[index].identifier)
    }
}

    // MARK: - ControlScrollView

    private class ControlScrollView: UIScrollView {
        override func touchesShouldCancel(in view: UIView) -> Bool {
            true
        }
    }

    // MARK: - BadgeView

    private final class BadgeView: UIView {
        let badge: Int?

        static let badgeSpacing: CGFloat = 4
        private static let dotSize: CGFloat = 8
        private static let labelFont = UIFont.systemFont(ofSize: 10, weight: .bold)
        private static let labelPaddingH: CGFloat = 4
        private static let labelPaddingV: CGFloat = 2

        let cachedBadgeSize: CGSize

        static func sizeFor(badge: Int) -> CGSize {
            if badge == 0 {
                return CGSize(width: dotSize, height: dotSize)
            }
            let text = badge > 99 ? "99+" : "\(badge)"
            let textSize = (text as NSString).size(withAttributes: [.font: labelFont])
            let width = max(
                ceil(textSize.width) + labelPaddingH * 2,
                ceil(textSize.height) + labelPaddingV * 2
            )
            let height = ceil(textSize.height) + labelPaddingV * 2
            return CGSize(width: width, height: height)
        }

        init(badge: Int?) {
            self.badge = badge
            self.cachedBadgeSize = badge.map { Self.sizeFor(badge: $0) } ?? .zero
            super.init(frame: .zero)
            guard let badge else { return }
            backgroundColor = .systemRed
            clipsToBounds = true

            if badge == 0 {
                layer.cornerRadius = Self.dotSize / 2
            } else {
                let label = UILabel()
                label.font = Self.labelFont
                label.textColor = .white
                label.text = badge > 99 ? "99+" : "\(badge)"
                label.textAlignment = .center
                label.frame = CGRect(
                    x: Self.labelPaddingH,
                    y: Self.labelPaddingV,
                    width: ceil(label.intrinsicContentSize.width),
                    height: ceil(label.intrinsicContentSize.height)
                )
                addSubview(label)
            }
        }

        @available(*, unavailable)
        required init?(coder: NSCoder) { fatalError() }

        override func layoutSubviews() {
            super.layoutSubviews()
            if let badge, badge > 0 {
                layer.cornerRadius = bounds.height / 2
            }
        }
    }
}
