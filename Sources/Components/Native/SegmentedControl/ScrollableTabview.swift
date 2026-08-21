import UIKit

final class ScrollableTabView: UIView {

    static let maxShadowRadius: CGFloat = 3

    var onSelect: ((String) -> Void)?

    override var intrinsicContentSize: CGSize {
        CGSize(width: UIView.noIntrinsicMetric, height: TabCell.cellHeight)
    }

    private var items: [Warp.GlassSegmentedControl.Item] = []
    private lazy var dataSource = makeDataSource()

    private lazy var collectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: makeLayout())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = Warp.UIToken.background
        cv.delegate = self
        cv.alwaysBounceHorizontal = true
        cv.alwaysBounceVertical = false
        cv.register(TabCell.self, forCellWithReuseIdentifier: TabCell.reuseID)
        return cv
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Warp.UIToken.background
        layer.masksToBounds = false
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 0
        layer.shadowOffset = .zero
        layer.shadowColor = UIColor.black.cgColor

        addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])

        registerForTraitChanges([UITraitPreferredContentSizeCategory.self]) { [weak self] (_: Self, _: UITraitCollection) in
            self?.invalidateIntrinsicContentSize()
        }
    }

    required init?(coder: NSCoder) { fatalError() }

    override func layoutSubviews() {
        super.layoutSubviews()
        let r = Self.maxShadowRadius
        let rect = CGRect(x: 0, y: bounds.maxY - r, width: bounds.width, height: r)
        layer.shadowPath = UIBezierPath(rect: rect).cgPath
    }

    func configure(items: [Warp.GlassSegmentedControl.Item], selectedIdentifier: String?) {
        self.items = items
        var snap = NSDiffableDataSourceSnapshot<Int, Warp.GlassSegmentedControl.Item>()
        snap.appendSections([0])
        snap.appendItems(items, toSection: 0)
        dataSource.apply(snap)

        if let id = selectedIdentifier,
           let idx = items.firstIndex(where: { $0.identifier == id }) {
            collectionView.selectItem(
                at: IndexPath(item: idx, section: 0),
                animated: false,
                scrollPosition: .centeredHorizontally
            )
        }
    }

    func updateShadow(using scrollView: UIScrollView, scrollViewParentView: UIView? = nil) {
        let minY = scrollViewParentView?.frame.minY ?? scrollView.frame.minY
        let contentFrame = CGRect(
            x: -scrollView.contentOffset.x,
            y: minY - scrollView.contentOffset.y - scrollView.contentInset.top,
            width: scrollView.contentSize.width,
            height: scrollView.contentSize.height + scrollView.contentInset.top
        )
        let intersection = contentFrame.intersection(frame)
        layer.shadowRadius = min(intersection.height * 0.2, Self.maxShadowRadius)
    }

    private func makeLayout() -> UICollectionViewLayout {
        UICollectionViewCompositionalLayout { _, _ in
            let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(50), heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)

            let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(50), heightDimension: .estimated(TabCell.cellHeight))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .continuous
            section.interGroupSpacing = Warp.Spacing.spacing400
            section.contentInsets = NSDirectionalEdgeInsets(
                top: 0, leading: Warp.Spacing.spacing200,
                bottom: 0, trailing: Warp.Spacing.spacing200
            )
            return section
        }
    }

    private func makeDataSource() -> UICollectionViewDiffableDataSource<Int, Warp.GlassSegmentedControl.Item> {
        UICollectionViewDiffableDataSource(collectionView: collectionView) { cv, indexPath, item in
            let cell = cv.dequeueReusableCell(withReuseIdentifier: TabCell.reuseID, for: indexPath) as! TabCell
            cell.configure(title: item.title)
            return cell
        }
    }
}

extension ScrollableTabView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard indexPath.item < items.count else { return }
        onSelect?(items[indexPath.item].identifier)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
}

// MARK: - TabCell

private final class TabCell: UICollectionViewCell {
    static let reuseID = "TabCell"

    private static let font = Warp.Typography.captionStrong.uiFont
    private static let indicatorHeight: CGFloat = 4
    private static let verticalPadding = Warp.Spacing.spacing100

    static var cellHeight: CGFloat {
        let labelHeight = ceil(("I" as NSString).boundingRect(
            with: CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude),
            options: .usesLineFragmentOrigin,
            attributes: [.font: font],
            context: nil
        ).height)
        return labelHeight + indicatorHeight + verticalPadding * 2
    }

    override var isSelected: Bool {
        didSet { updateSelection(animated: true) }
    }

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = TabCell.font
        label.textColor = Warp.UIToken.textSubtle
        label.adjustsFontForContentSizeCategory = true
        return label
    }()

    private let indicator: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = Warp.UIToken.backgroundPrimary
        v.alpha = 0
        return v
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        isAccessibilityElement = true
        accessibilityTraits = [.button]

        contentView.addSubview(titleLabel)
        contentView.addSubview(indicator)

        let vp = Self.verticalPadding
        let ih = Self.indicatorHeight
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: vp),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -(vp + ih)),

            indicator.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            indicator.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            indicator.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            indicator.heightAnchor.constraint(equalToConstant: ih),
        ])
    }

    required init?(coder: NSCoder) { fatalError() }

    func configure(title: String) {
        titleLabel.text = title
        accessibilityLabel = title
        updateSelection(animated: false)
    }

    private func updateSelection(animated: Bool) {
        accessibilityTraits = isSelected
            ? [.button, .selected]
            : [.button]

        let duration: TimeInterval = animated ? 0.15 : 0
        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseOut) {
            UIView.transition(with: self.titleLabel, duration: duration, options: .transitionCrossDissolve) {
                self.titleLabel.textColor = self.isSelected ? Warp.UIToken.text : Warp.UIToken.textSubtle
            }
            self.indicator.alpha = self.isSelected ? 1 : 0
        }
    }
}
