import UIKit
import SwiftUI
import Warp

class UIShadowViewController: UIViewController {
    private let segmentedControl: UISegmentedControl = {
        let items = Warp.Shadow.allCases.map { $0.name }
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    
    private let shadowView: UIView = {
        let view = UIView()
        view.backgroundColor = Warp.UIToken.surfaceElevated200
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let label: UIView = {
        let label = Warp.Text("UIView with surfaceElevated200", style: .caption).uiView
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "ShadowUIView"
        navigationController?.navigationBar.prefersLargeTitles = false
        view.backgroundColor = Warp.UIToken.surfaceElevated100
        
        // Add the segmented control to the view
        view.addSubview(segmentedControl)
        view.addSubview(shadowView)
        shadowView.addSubview(label)

        NSLayoutConstraint.activate([
            segmentedControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerXAnchor.constraint(equalTo: shadowView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: shadowView.centerYAnchor),
            shadowView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            shadowView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            shadowView.widthAnchor.constraint(equalToConstant: 200),
            shadowView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        // Set the initial shadow
        applyShadow(type: .small)
        
        // Add target to segmented control
        segmentedControl.addTarget(self, action: #selector(segmentedControlChanged), for: .valueChanged)
    }
    
    @objc private func segmentedControlChanged() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            applyShadow(type: .small)
        case 1:
            applyShadow(type: .medium)
        case 2:
            applyShadow(type: .large)
        case 3:
            applyShadow(type: .xLarge)
        default:
            break
        }
    }
    
    private func applyShadow(type: Warp.Shadow) {
        shadowView.addShadow(type)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // Update shadow layers' frames
        shadowView.layoutShadowLayers()
    }
}

struct ShadowUIView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        return UIShadowViewController()
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}
