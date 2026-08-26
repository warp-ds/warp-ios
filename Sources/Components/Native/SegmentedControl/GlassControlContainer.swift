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
        addSubview(effectView)

        NSLayoutConstraint.activate([
            effectView.topAnchor.constraint(equalTo: topAnchor),
            effectView.leadingAnchor.constraint(equalTo: leadingAnchor),
            effectView.trailingAnchor.constraint(equalTo: trailingAnchor),
            effectView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        content.translatesAutoresizingMaskIntoConstraints = false
        effectView.contentView.addSubview(content)

        NSLayoutConstraint.activate([
            content.topAnchor.constraint(equalTo: effectView.contentView.topAnchor),
            content.leadingAnchor.constraint(equalTo: effectView.contentView.leadingAnchor),
            content.trailingAnchor.constraint(equalTo: effectView.contentView.trailingAnchor),
            content.bottomAnchor.constraint(equalTo: effectView.contentView.bottomAnchor)
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

    private static func makeGlassOrBlurEffect() -> UIVisualEffect {
        if #available(iOS 26.0, *) {
            return UIGlassEffect(style: .regular)
        } else {
            return UIBlurEffect(style: .systemUltraThinMaterial)
        }
    }
}