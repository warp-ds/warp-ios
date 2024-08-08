import UIKit
import SwiftUI
import Warp

class ShadowViewController: UIViewController {
    let shadowView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Warp.UIToken.surfaceSunken
        view.addSubview(shadowView)
        shadowView.layer.cornerRadius = 8
        shadowView.backgroundColor = Warp.UIToken.surfaceElevated100
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        shadowView.widthAnchor.constraint(equalToConstant: 192).isActive = true
        shadowView.heightAnchor.constraint(equalToConstant: 192).isActive = true
        shadowView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        shadowView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        shadowView.dropShadow(.small)
        
        let label = Warp.Text("UIView with surfaceElevated100", style: .caption).uiView
        shadowView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: shadowView.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: shadowView.centerYAnchor).isActive = true
    }
}

struct ShadowViewRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        return ShadowViewController()
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}
