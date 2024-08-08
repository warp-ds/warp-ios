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
        shadowView.clipsToBounds = true
        shadowView.backgroundColor = Warp.UIToken.surfaceElevated100
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        shadowView.widthAnchor.constraint(equalToConstant: 192).isActive = true
        shadowView.heightAnchor.constraint(equalToConstant: 192).isActive = true
        shadowView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        shadowView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        shadowView.dropShadow(.small)
    }
}

struct ShadowViewRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        return ShadowViewController()
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}
