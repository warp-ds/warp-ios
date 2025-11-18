import Testing
import SnapshotTesting
import SwiftUI
@testable import Warp

@Suite @MainActor
struct StateViewSnapshotTests {

    static let userInterfaceStyles: [UIUserInterfaceStyle] = [.light, .dark]
    static let devices: [ViewImageConfig] = [.iPhone13, .iPadPro11]

    @Test(arguments: combine(userInterfaceStyles, devices))
    func snapshotSimpleStateView(style: UIUserInterfaceStyle, device: ViewImageConfig) {
        let snapshotName = snapshotName(for: style, device: device)

        let viewModel = createViewModel()
        let stateView = StateView(viewModel: viewModel)
          .padding()
          .frame(width: device.size!.width)

        assertSnapshot(of: stateView, as: .warpImage(traits: style.traits, compressionQuality: .high), named: snapshotName)
    }

    @Test(arguments: combine(userInterfaceStyles, devices))
    func snapshotStateViewWithNoIconAndSecondaryButton(style: UIUserInterfaceStyle, device: ViewImageConfig) {
        let snapshotName = snapshotName(for: style, device: device)

        let viewModel = createViewModel()
        viewModel.secondaryButtonTitle = "Secondary"
        let stateView = StateView(viewModel: viewModel)
          .padding()
          .frame(width: device.size!.width)

        assertSnapshot(of: stateView, as: .warpImage(traits: style.traits, compressionQuality: .high), named: snapshotName)
    }

    @Test(arguments: combine(userInterfaceStyles, devices))
    func snapshotSadStateViewWithSecondaryButton(style: UIUserInterfaceStyle, device: ViewImageConfig) {
        let snapshotName = snapshotName(for: style, device: device)

        let viewModel = createViewModel()
        viewModel.icon = Warp.Icon.smileySad
        viewModel.secondaryButtonTitle = "Try again"
        let stateView = StateView(viewModel: viewModel)
          .padding()
          .frame(width: device.size!.width)

        assertSnapshot(of: stateView, as: .warpImage(traits: style.traits, compressionQuality: .high), named: snapshotName)
    }

    @Test(arguments: combine(userInterfaceStyles, devices))
    func snapshotHappyStateViewWithSecondaryButton(style: UIUserInterfaceStyle, device: ViewImageConfig) {
        let snapshotName = snapshotName(for: style, device: device)

        let viewModel = createViewModel()
        viewModel.icon = Warp.Icon.smileyHappy
        viewModel.secondaryButtonTitle = "Secondary"
        let stateView = StateView(viewModel: viewModel)
          .padding()
          .frame(width: device.size!.width)

        assertSnapshot(of: stateView, as: .warpImage(traits: style.traits, compressionQuality: .high), named: snapshotName)
    }

    @Test(arguments: combine(userInterfaceStyles, devices))
    func snapshotStateViewWithIllustration(style: UIUserInterfaceStyle, device: ViewImageConfig) {
        let snapshotName = snapshotName(for: style, device: device)

        let viewModel = createViewModel()
        let empty = UIImage(named: "empty", in: .module, compatibleWith: nil)
        let image = Image(uiImage: empty ?? UIImage())
        viewModel.illustration = image
        viewModel.imageStyle = .illustration
        let stateView = StateView(viewModel: viewModel)
          .padding()
          .frame(width: device.size!.width)

        assertSnapshot(of: stateView, as: .warpImage(traits: style.traits, compressionQuality: .high), named: snapshotName)
    }

    @Test(arguments: combine(userInterfaceStyles, devices))
    func snapshotStateViewWithNewTitle(style: UIUserInterfaceStyle, device: ViewImageConfig) {
        let snapshotName = snapshotName(for: style, device: device)

        let viewModel = createViewModel()
        viewModel.title = "This is a new title"
        let stateView = StateView(viewModel: viewModel)
          .padding()
          .frame(width: device.size!.width)

        assertSnapshot(of: stateView, as: .warpImage(traits: style.traits, compressionQuality: .high), named: snapshotName)
    }

    @Test(arguments: combine(userInterfaceStyles, devices))
    func snapshotLongDescriptionStateView(style: UIUserInterfaceStyle, device: ViewImageConfig) {
        let snapshotName = snapshotName(for: style, device: device)

        let viewModel = StateViewModel(
            icon: Warp.Icon.smileySad,
            tintColor: .blue,
            title: "An unexpected error occurred",
            description: "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s...",
            actionButtonTitle: "Call To Action",
            primaryAction: {},
            secondaryButtonTitle: "Secondary Button",
            secondaryAction: {}
        )
        let stateView = StateView(viewModel: viewModel)
          .padding()
          .frame(width: device.size!.width)

        assertSnapshot(of: stateView, as: .warpImage(traits: style.traits, compressionQuality: .high), named: snapshotName)
    }

    @Test(arguments: combine(userInterfaceStyles, devices))
    func snapshotEmptyView(style: UIUserInterfaceStyle, device: ViewImageConfig) {
        let snapshotName = snapshotName(for: style, device: device)

        let stateView = EmptyStateView(viewModel: createViewModel())
          .padding()
          .frame(width: device.size!.width)

        assertSnapshot(of: stateView, as: .warpImage(traits: style.traits, compressionQuality: .high), named: snapshotName)
    }

    @Test(arguments: combine(userInterfaceStyles, devices))
    func snapshotDefaultEmptyView(style: UIUserInterfaceStyle, device: ViewImageConfig) {
        let snapshotName = snapshotName(for: style, device: device)

        let stateView = EmptyStateView()
          .padding()
          .frame(width: device.size!.width)

        assertSnapshot(of: stateView, as: .warpImage(traits: style.traits, compressionQuality: .high), named: snapshotName)
    }

    @Test(arguments: combine(userInterfaceStyles, devices))
    func snapshotDefaultNoConnectionStateView(style: UIUserInterfaceStyle, device: ViewImageConfig) {
        let snapshotName = snapshotName(for: style, device: device)

        let stateView = NoNetworkConnectionStateView(retryAction: {})
          .padding()
          .frame(width: device.size!.width)

        assertSnapshot(of: stateView, as: .warpImage(traits: style.traits, compressionQuality: .high), named: snapshotName)
    }

    @Test(arguments: combine(userInterfaceStyles, devices))
    func snapshotDefaultErrorStateView(style: UIUserInterfaceStyle, device: ViewImageConfig) {
        let snapshotName = snapshotName(for: style, device: device)

        let stateView = ErrorStateView(retryAction: {})
          .padding()
          .frame(width: device.size!.width)

        assertSnapshot(of: stateView, as: .warpImage(traits: style.traits, compressionQuality: .high), named: snapshotName)
    }

    private func createViewModel() -> StateViewModel {
        StateViewModel(
            tintColor: .blue,
            title: "Test Title",
            description: "Test Description",
            actionButtonTitle: "Primary"
        )
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
