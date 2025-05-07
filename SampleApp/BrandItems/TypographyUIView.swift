import UIKit
import SwiftUI
import Warp

class UITypographyViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "TypographyUIView"
        navigationController?.navigationBar.prefersLargeTitles = false
        view.backgroundColor = Warp.UIToken.surfaceElevated100

        setupViews()
    }

    private func setupViews() {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = Warp.Spacing.spacing100
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Warp.Spacing.spacing100),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Warp.Spacing.spacing100),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Warp.Spacing.spacing100),
            stackView.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])

        for item in Warp.Typography.allCases {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.adjustsFontForContentSizeCategory = true
            label.numberOfLines = 0
            label.text = item.name
            label.font = item.typography.uiFont

            stackView.addArrangedSubview(label)
        }
    }
}

struct TypographyUIView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        return UITypographyViewController()
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}
