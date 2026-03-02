import SwiftUI

extension Button {

    public enum WarpBarButtonStyle {
        case `default`
        case primary
    }

    public func warpNavigationBarButton(style: WarpBarButtonStyle = .default) -> some View {
        if #available(iOS 26.0, *) {
            return Group {
                switch style {
                case .default:
                    self
                      .tint(Warp.Color.buttonPrimaryBackground)
                      .font(Warp.Typography.body.font)
                case .primary:
                    self
                      .buttonStyle(.glassProminent)
                      .tint(Warp.Color.buttonPrimaryBackground)
                      .font(Warp.Typography.body.font)
                }
            }
        }
        return self
    }
}
