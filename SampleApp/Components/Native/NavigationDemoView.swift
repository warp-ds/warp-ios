import SwiftUI
import Warp

struct NavigationDemoView: View {

    @State var primaryCounter: UInt = 0
    @State var defaultCounter: UInt = 0
    @State var defaultTitleCounter: UInt = 0

    private func counterView(title: String, counter: Binding<UInt>) -> some View {
        HStack {
            Text(title)
              .font(.headline)
            Spacer()
            Button(action: {
                guard counter.wrappedValue > 0 else { return }
                counter.wrappedValue -= 1
            }) {
                Image(systemName: "minus.circle")
            }
            Text(String(counter.wrappedValue))
              .font(.body)
              .frame(width: 40, alignment: .center)
            Button(action: {
                counter.wrappedValue += 1
            }) {
                Image(systemName: "plus.circle")
            }
        }
          .padding()
    }

    var body: some View {
        NavigationStack {
            VStack {
                Button("Go to Custom Navigation View") {
                    navigateToCustomView()
                }
                  .buttonStyle(.borderedProminent)
                  .padding()

                counterView(title: "Primary Style", counter: $primaryCounter)
                counterView(title: "Default Style", counter: $defaultCounter)
                counterView(title: "Default with title Style", counter: $defaultTitleCounter)
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
        let defaultButtons = (0..<defaultCounter).flatMap { _ -> [UIBarButtonItem] in
            if #available(iOS 26.0, *) {
                [UIBarButtonItem(
                    image: Warp.Icon.allCases.randomElement()?.uiImage,
                    style: .plain,
                    target: self,
                    action: nil
                )
                    .warpNavigationBarButton(),
                 UIBarButtonItem.fixedSpace()
                ]
            } else {
                []
            }
        }
        let defaultTitleButtons = (0..<defaultTitleCounter).flatMap { _ -> [UIBarButtonItem] in
            if #available(iOS 26.0, *) {
                [UIBarButtonItem(
                    title: "Foo",
                    style: .plain,
                    target: self,
                    action: nil
                )
                  .warpNavigationBarButton(style: .default),
                    UIBarButtonItem.fixedSpace()
                ]
            } else {
                []
            }
        }

        return  primaryButtons + defaultButtons + defaultTitleButtons
    }
}

struct CustomNavigationView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(1...25, id: \.self) { index in
                    Text("Lorem ipsum row \(index)")
                      .font(.body)
                      .padding()
                      .frame(maxWidth: .infinity, alignment: .leading)
                      .background(Color(UIColor.black))
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
            .warpNavigationBarButton())

    }

    private func dismissView() {
        UIApplication.shared.windows.first?.rootViewController?.dismiss(animated: true, completion: nil)
    }
}
