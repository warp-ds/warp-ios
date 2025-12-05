import Testing
import SnapshotTesting
import SwiftUI
@testable import Warp

@Suite @MainActor
struct StateViewSnapshotTests {

    static let userInterfaceStyles: [UIUserInterfaceStyle] = [.light, .dark]
    static let devices: [ViewImageConfig] = [.iPhone13, .iPadPro11]

    @Test(arguments: combine(userInterfaceStyles, devices))
    func snapshotStateView(style: UIUserInterfaceStyle, device: ViewImageConfig) {
        let snapshotName = snapshotName(for: style, device: device)

        Warp.Theme = .finn

        let stateView = StateView(
            image: .icon(.check),
            title: "An unexpected error occured right now please retry",
            description: "Description description description you have to try",
            actionButton: .init(title: "Call To Action") {
                print("Primary Action") // swiftlint:disable:this no_print
            },
            quietButton: .init(title: "Secondary Button") {
                print("Secondary Action") // swiftlint:disable:this no_print
            },
            showLogo: true
        )
          .padding()
          .frame(width: device.size!.width)

        assertSnapshot(of: stateView, as: .warpImage(traits: style.traits, compressionQuality: .high), named: snapshotName)
    }

    @Test(arguments: combine(userInterfaceStyles, devices))
    func snapshotStateViewSizeOverrided(style: UIUserInterfaceStyle, device: ViewImageConfig) {
        let snapshotName = snapshotName(for: style, device: device)

        Warp.Theme = .finn

        let stateView = StateView(
            image: .icon(.check),
            imageWidth: 150,
            title: "An unexpected error occured right now please retry",
            description: "Description description description you have to try",
            actionButton: .init(title: "Call To Action") {
                print("Primary Action") // swiftlint:disable:this no_print
            },
            quietButton: .init(title: "Secondary Button") {
                print("Secondary Action") // swiftlint:disable:this no_print
            },
            showLogo: true
        )
          .padding()
          .frame(width: device.size!.width)

        assertSnapshot(of: stateView, as: .warpImage(traits: style.traits, compressionQuality: .high), named: snapshotName)
    }

    @Test(arguments: combine(userInterfaceStyles, devices))
    func snapshotFailToLoadStateView(style: UIUserInterfaceStyle, device: ViewImageConfig) {
        let snapshotName = snapshotName(for: style, device: device)
        
        Warp.Theme = .finn

        let stateView = FailToLoadStateView(retryAction: {})
          .padding()
          .frame(width: device.size!.width)

        assertSnapshot(of: stateView, as: .warpImage(traits: style.traits, compressionQuality: .high), named: snapshotName)
    }

    @Test(arguments: combine(userInterfaceStyles, devices))
    func snapshotLoadingStateView(style: UIUserInterfaceStyle, device: ViewImageConfig) {
        let snapshotName = snapshotName(for: style, device: device)
        
        Warp.Theme = .finn

        let stateView = LoadingStateView()
          .padding()
          .frame(width: device.size!.width)

        assertSnapshot(of: stateView, as: .warpImage(traits: style.traits, compressionQuality: .high), named: snapshotName)
    }

    @Test(arguments: combine(userInterfaceStyles, devices))
    func snapshotLoginStateView(style: UIUserInterfaceStyle, device: ViewImageConfig) {
        let snapshotName = snapshotName(for: style, device: device)
        
        Warp.Theme = .finn

        let stateView = LoginStateView(loginAction: {}, createAccountAction: {})
          .padding()
          .frame(width: device.size!.width)

        assertSnapshot(of: stateView, as: .warpImage(traits: style.traits, compressionQuality: .high), named: snapshotName)
    }

    @Test(arguments: combine(userInterfaceStyles, devices))
    func snapshotNoNetworkStateView(style: UIUserInterfaceStyle, device: ViewImageConfig) {
        let snapshotName = snapshotName(for: style, device: device)
        
        Warp.Theme = .finn

        let stateView = NoNetworkStateView(retryAction: {})
          .padding()
          .frame(width: device.size!.width)

        assertSnapshot(of: stateView, as: .warpImage(traits: style.traits, compressionQuality: .high), named: snapshotName)
    }

    @Test(arguments: combine(userInterfaceStyles, devices))
    func snapshotNoSearchResultsStateView(style: UIUserInterfaceStyle, device: ViewImageConfig) {
        let snapshotName = snapshotName(for: style, device: device)
        
        Warp.Theme = .finn

        let stateView = NoSearchResultsStateView(saveSearchAction: {}, clearFiltersAction: {})
          .padding()
          .frame(width: device.size!.width)

        assertSnapshot(of: stateView, as: .warpImage(traits: style.traits, compressionQuality: .high), named: snapshotName)
    }

    @Test(arguments: combine(userInterfaceStyles, devices))
    func snapshotVerifyIdentityStateView(style: UIUserInterfaceStyle, device: ViewImageConfig) {
        let snapshotName = snapshotName(for: style, device: device)
        
        Warp.Theme = .finn

        let stateView = VerifyIdentityStateView(eidProvider: "BankID", verifyAction: {})
          .padding()
          .frame(width: device.size!.width)

        assertSnapshot(of: stateView, as: .warpImage(traits: style.traits, compressionQuality: .high), named: snapshotName)
    }

    private func snapshotName(for style: UIUserInterfaceStyle, device: ViewImageConfig) -> String {
        [
            ".\(style.description)",
            "\(device.description)"
        ].compactMap { $0 }.joined(separator: "-")
    }
}

fileprivate extension UIUserInterfaceStyle {

    var traits: UITraitCollection {
        UITraitCollection(userInterfaceStyle: self)
    }
}

fileprivate extension UIUserInterfaceStyle {

    var description: String {
        switch self {
        case .light:
            return "light"
        case .dark:
            return "dark"
        default:
            return "unspecified"
        }
    }
}

extension ViewImageConfig: @retroactive Equatable {

    public static func ==(lhs: ViewImageConfig, rhs: ViewImageConfig) -> Bool {
        lhs.safeArea == rhs.safeArea && lhs.size == rhs.size && lhs.traits == rhs.traits
    }

    var description: String {
        switch self {
        case .iPhone13:
            return "iPhone13"
        case .iPadPro11:
            return "iPadPro11"
        default:
            return "UnknownDevice"
        }
    }
}
