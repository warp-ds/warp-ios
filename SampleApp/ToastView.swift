import SwiftUI
import Warp

struct ToastView: View {
    @State var toastIsPresented: Bool = true
    @State var toastStyle: Warp.ToastStyle = .success
    @State var toastEdge: Warp.ToastEdge = .top

    var body: some View {
        ScrollView(showsIndicators: false) {

            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Text("Toast View Demo")
                        .font(.title)

                    Spacer()
                }

                ForEach(Warp.ToastStyle.allCases, id: \.self) { currentStyle in
                    Warp.Toast(
                        style: currentStyle,
                        title: "A toast to you",
                        toastEdge: .top,
                        isPresented: .constant(true)
                    )
                }

                Text("Playground")
                    .font(.title2)
                Text("Experiment with Toast Style and Toast Edge to see the variants")

                VStack(alignment: .leading) {
                    HStack {
                        Text("Right now the toast is ") +
                        Text(toastStatus)
                            .bold()

                        Spacer()
                    }

                    if(toastIsPresented) {
                        Text("You can tap the toast to dismiss it")
                    } else {
                        Button(action: {
                            toastIsPresented = true
                        }, label: {
                            Text("Tap me to show the toast again")
                                .frame(maxWidth: .infinity)
                        })
                        .buttonStyle(.borderedProminent)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.secondary)
                .cornerRadius(8)

                Text("Toast Style")
                    .font(.headline)
                Picker("Toast Style:", selection: $toastStyle) {
                    ForEach(Warp.ToastStyle.allCases, id: \.self) { currentStyle in
                        Text(currentStyle.description)
                    }
                }
                .pickerStyle(.segmented)

                Divider()

                Text("Toast Edge")
                    .font(.headline)

                Picker("Toast Edge:", selection: $toastEdge) {
                    ForEach(Warp.ToastEdge.allCases, id: \.self) { currentEdge in
                        Text(currentEdge.description)
                    }
                }
                .pickerStyle(.segmented)

                Divider()

                Spacer()
            }
        }
        .padding()
        .warpToast(
            style: toastStyle,
            title: "Here's a toast of type \(toastStyle.description) located at the \(toastEdge.description) edge",
            edge: toastEdge,
            isPresented: $toastIsPresented
        )
    }

    private var toastStatus: String {
        toastIsPresented ? "visible" : "not visible"
    }
}

@MainActor
fileprivate extension Warp.ToastStyle {
    var description: String {
        switch self {
        case .error:
            "error"
        case .success:
            "success"
        case .warning:
            "warning"
        }
    }
}

@MainActor
fileprivate extension Warp.ToastEdge {
    var description: String {
        switch self {
        case .top:
            "top"
        case .bottom:
            "bottom"
        }
    }
}

#Preview {
    ToastView()
}
