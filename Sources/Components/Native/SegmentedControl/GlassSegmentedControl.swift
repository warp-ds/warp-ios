import UIKit

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

        public init(identifier: String, title: String) {
            self.identifier = identifier
            self.title = title
        }
    }

    // MARK: - Public properties

    public weak var delegate: GlassSegmentedControlDelegate?

    // MARK: - Private properties

    private var items: [Item] = []
    private let usesGlassSegments: Bool

    // MARK: - iOS 26+

    private lazy var glassContainer: GlassControlContainer<ControlScrollView> = {
        GlassControlContainer(
            content: scrollView,
            cornerRadius: 22,
            borderWidth: 0,
            borderColor: .clear
        )
    }()

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
        control.setTitleTextAttributes([.font: font, .foregroundColor: UIColor.text], for: .normal)
        control.setTitleTextAttributes([.font: font, .foregroundColor: UIColor.text], for: .selected)
        control.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
        return control
    }()

    // MARK: - Pre-iOS 26

    private lazy var scrollableTabView: ScrollableTabView = {
        let view = ScrollableTabView(withAutoLayout: true)
        view.delegate = self
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

    public override func layoutSubviews() {
        super.layoutSubviews()
        if usesGlassSegments {
            glassContainer.layer.cornerRadius = glassContainer.bounds.height / 2
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
            glassContainer.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Warp.Spacing.spacing200),
            glassContainer.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -Warp.Spacing.spacing200),
            glassContainer.bottomAnchor.constraint(equalTo: bottomAnchor),

            segmentedControl.heightAnchor.constraint(equalToConstant: 44),
            segmentedControl.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            segmentedControl.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            segmentedControl.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            segmentedControl.widthAnchor.constraint(greaterThanOrEqualTo: scrollView.frameLayoutGuide.widthAnchor),
            segmentedControl.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),

            scrollView.contentLayoutGuide.heightAnchor.constraint(equalTo: scrollView.frameLayoutGuide.heightAnchor),
        ])
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
        for (index, item) in items.enumerated() {
            segmentedControl.insertSegment(withTitle: item.title, at: index, animated: false)
        }

        if let selectedIdentifier,
           let selectedIndex = items.firstIndex(where: { $0.identifier == selectedIdentifier }) {
            segmentedControl.selectedSegmentIndex = selectedIndex
            DispatchQueue.main.async { [weak self] in
                self?.scrollToSegment(at: selectedIndex, animated: false)
            }
        }
    }

    // MARK: - Pre-iOS 26 configuration

    private func configureScrollableTabView(selectedIdentifier: String?) {
        let tabItems = items.map { ScrollableTabViewModel.Item(identifier: $0.identifier, title: $0.title) }
        let viewModel = ScrollableTabViewModel(selectedIdentifier: selectedIdentifier, items: tabItems)
        scrollableTabView.configure(with: viewModel)
    }

    // MARK: - Private methods

    private func scrollToSegment(at index: Int, animated: Bool) {
        guard items.count > 1 else { return }
        layoutIfNeeded()

        let totalWidth = segmentedControl.bounds.width
        let visibleWidth = scrollView.bounds.width
        guard totalWidth > visibleWidth else { return }

        let segmentCenter = totalWidth * (CGFloat(index) + 0.5) / CGFloat(items.count)
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

// MARK: - ScrollableTabViewDelegate

extension GlassSegmentedControl: ScrollableTabViewDelegate {
    public func scrollableTabViewDidTapItem(_ sidescrollableView: ScrollableTabView, item: ScrollableTabViewModel.Item) {
        delegate?.glassSegmentedControl(self, didSelectItemWithIdentifier: item.identifier)
    }
}

// MARK: - ControlScrollView

private class ControlScrollView: UIScrollView {
    override func touchesShouldCancel(in view: UIView) -> Bool {
        true
    }
}
