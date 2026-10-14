import UIKit

final class GlassControlContainer<Content: UIView>: UIView {

    let content: Content
    private let containerView: UIView
    private let borderColor: UIColor

    init(
        content: Content,
        cornerRadius: CGFloat,
        borderWidth: CGFloat,
        borderColor: UIColor
    ) {
        self.content = content
        self.containerView = UIView()
        self.borderColor = borderColor
        super.init(frame: .zero)

        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true

        layer.cornerRadius = cornerRadius
        layer.cornerCurve = .continuous
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor

        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.layer.cornerCurve = .continuous
        addSubview(containerView)

        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: -2),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -2),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 2),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 2)
        ])

        content.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(content)

        NSLayoutConstraint.activate([
            content.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 2),
            content.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 2),
            content.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -2),
            content.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -2)
        ])
        
        let segmentedControl = UISegmentedControl(items: [""])
        segmentedControl.isUserInteractionEnabled = false
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        containerView.insertSubview(segmentedControl, at: 0)

        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            segmentedControl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            segmentedControl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            segmentedControl.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])

        registerForTraitChanges(
            [UITraitUserInterfaceStyle.self],
            handler: { (self: Self, previousTraitCollection: UITraitCollection) in
                if previousTraitCollection.userInterfaceStyle != self.traitCollection.userInterfaceStyle {
                    self.layer.borderColor = self.borderColor.cgColor
                }
            }
        )
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        containerView.layer.cornerRadius = frame.height / 2
    }
}
