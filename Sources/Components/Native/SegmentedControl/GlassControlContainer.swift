import UIKit

final class GlassControlContainer<Content: UIView>: UIView {

    let content: Content
    private let effectView: UIVisualEffectView
    private let borderColor: UIColor

    init(
        content: Content,
        cornerRadius: CGFloat,
        borderWidth: CGFloat,
        borderColor: UIColor
    ) {
        self.content = content
        self.effectView = UIVisualEffectView(effect: Self.makeGlassOrBlurEffect())
        self.borderColor = borderColor
        super.init(frame: .zero)

        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true

        layer.cornerRadius = cornerRadius
        layer.cornerCurve = .continuous
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor

        effectView.translatesAutoresizingMaskIntoConstraints = false
        effectView.layer.cornerCurve = .continuous
        addSubview(effectView)

        NSLayoutConstraint.activate([
            effectView.topAnchor.constraint(equalTo: topAnchor, constant: -2),
            effectView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -2),
            effectView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 2),
            effectView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 2)
        ])

        content.translatesAutoresizingMaskIntoConstraints = false
        effectView.contentView.addSubview(content)

        NSLayoutConstraint.activate([
            content.topAnchor.constraint(equalTo: effectView.contentView.topAnchor, constant: 2),
            content.leadingAnchor.constraint(equalTo: effectView.contentView.leadingAnchor, constant: 2),
            content.trailingAnchor.constraint(equalTo: effectView.contentView.trailingAnchor, constant: -2),
            content.bottomAnchor.constraint(equalTo: effectView.contentView.bottomAnchor, constant: -2)
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
        effectView.layer.cornerRadius = frame.height / 2
    }

    private static func makeGlassOrBlurEffect() -> UIVisualEffect {
        if #available(iOS 26.0, *) {
            return UIGlassEffect(style: .clear)
        } else {
            return UIBlurEffect(style: .systemUltraThinMaterial)
        }
    }
}