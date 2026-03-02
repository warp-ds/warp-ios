import SwiftUI
import Warp

struct NavigationDemoView: View {

    @State var primaryCounter: UInt = 0
    @State var defaultCounter: UInt = 0

    var body: some View {
        NavigationStack {
            VStack {
                Button("Go to Custom Navigation View") {
                    // Trigger navigation to the new view
                    navigateToCustomView()
                }
                  .buttonStyle(.borderedProminent)
                  .padding()

                HStack {
                    Text("Primary Style")
                      .font(.headline)
                    Spacer()
                    Button(action: {
                        guard primaryCounter > 0 else { return }
                        primaryCounter -= 1
                    }) {
                        Image(systemName: "minus.circle")
                    }
                    Text(String(primaryCounter))
                      .font(.body)
                      .frame(width: 40, alignment: .center)
                    Button(action: {
                        primaryCounter += 1
                    }) {
                        Image(systemName: "plus.circle")
                    }
                }
                  .padding()

                HStack {
                    Text("Default Style")
                      .font(.headline)
                    Spacer()
                    Button(action: {
                        guard defaultCounter > 0 else { return }
                        defaultCounter -= 1
                    }) {
                        Image(systemName: "minus.circle")
                    }
                    Text(String(defaultCounter))
                      .font(.body)
                      .frame(width: 40, alignment: .center)
                    Button(action: {
                        defaultCounter += 1
                    }) {
                        Image(systemName: "plus.circle")
                    }
                }
                  .padding()
            }
              .navigationTitle("Navigation setup")
        }
    }

    private func navigateToCustomView() {
        let customView = CustomNavigationView()
        let navigationWrapper = NavigationControllerWrapper(content: {
            customView
        }, rightBarButtonItems: createPrimaryBarButtonItems())
        if let navigationController = UIApplication.shared.windows.first?.rootViewController {
            navigationController.present(UIHostingController(rootView: navigationWrapper), animated: true)
        }
    }

    private func createPrimaryBarButtonItems() -> [UIBarButtonItem] {
        let primaryButtons = (0..<primaryCounter).map { _ in
            UIBarButtonItem(
                image: Warp.Icon.allCases.randomElement()?.uiImage,
                style: .plain,
                target: self,
                action: nil
            )
              .warpNavigationBarButton(style: .primary)
        }
        return primaryButtons
    }
}

struct CustomNavigationView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(1...50, id: \.self) { index in
                    Text("Lorem ipsum row \(index)")
                      .font(.body)
                      .padding()
                      .frame(maxWidth: .infinity, alignment: .leading)
                      .background(Color(UIColor.systemGray6))
                      .cornerRadius(8)
                }
            }
              .padding()
        }
          .navigationTitle("Custom View")
          .navigationBarItems(leading: Button(action: {
              dismissView()
          }) {
              Image(systemName: "xmark")
          }
            .warpNavigationBarButton()
          )

    }

    private func dismissView() {
        UIApplication.shared.windows.first?.rootViewController?.dismiss(animated: true, completion: nil)
    }
}
