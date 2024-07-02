import SwiftUI
import Warp

struct CalloutView: View {
    @State var showDefault = true
    @State var topPopoverVisible = true
    @State var bottomPopoverVisible = true
    @State var leadingPopoverVisible = true
    @State var trailingPopoverVisible = true

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                Text("Callout Views")
                    .font(.title)

                Toggle("Switch to \(showDefault ? "small" : "default") callout", isOn: $showDefault)
                    .toggleStyle(.button)

                inlineViews

                popoverViews

                Spacer()
            }
        }
        .padding()
        .navigationTitle("Callout")
    }

    private var inlineViews: some View {
        VStack(alignment: .leading) {
            Text("Inline")
                .font(.title2)

            VStack(alignment: .leading) {
                Text("Callout over content")
                    .font(.headline)

                Warp.Callout(
                    size: showDefault ? .default : .small,
                    title: "ArrowEdge: .bottom and then a lot more text so we get this wrapped",
                    arrowEdge: .bottom
                )

                Text("This one sits over the content")

                Divider()
            }

            VStack(alignment: .leading) {
                Text("Callout under content")
                    .font(.headline)


                Text("This one sits under the content")

                Warp.Callout(
                    size: showDefault ? .default : .small,
                    title: "ArrowEdge: .top",
                    arrowEdge: .top
                )

                Divider()
            }

            VStack(alignment: .leading) {
                Text("Callout before content")
                    .font(.headline)

                HStack {
                    Warp.Callout(
                        size: showDefault ? .default : .small,
                        title: "Short",
                        arrowEdge: .trailing
                    )

                    Text("This one sits before the content")
                    Spacer()
                }

                Divider()
            }

            VStack(alignment: .leading) {
                Text("Callout after content")
                    .font(.headline)

                HStack {
                    Text("This one sits after the content")

                    Warp.Callout(
                        size: showDefault ? .default : .small,
                        title: "Short",
                        arrowEdge: .leading
                    )

                    Spacer()
                }
                Divider()
            }
        }
    }

    private var popoverViews: some View {
        VStack(alignment: .leading) {
            Text("Popover - dismissable")
                .font(.title2)

            Button(action: {
                topPopoverVisible = true
                bottomPopoverVisible = true
                leadingPopoverVisible = true
                trailingPopoverVisible = true
            }, label: {
                Text("Reset Popover visibility")
            })

            verticalPopoverView(
                title: "Callout over content",
                description: "This one sits over the content",
                calloutTitle: "ArrowEdge: .bottom",
                calloutEdge: .bottom,
                isVisibleValue: $topPopoverVisible,
                yOffset: -20
            )

            verticalPopoverView(
                title: "Callout under content",
                description: "This one sits under the content",
                calloutTitle: "ArrowEdge: .top",
                calloutEdge: .top,
                isVisibleValue: $bottomPopoverVisible,
                yOffset: 20
            )

            horizontalPopoverView(
                title: "Callout before content",
                description: "This one sits before the content",
                calloutTitle: "ArrowEdge: .trailing",
                calloutEdge: .trailing,
                isVisibleValue: $trailingPopoverVisible,
                xOffset: 0
            )

            horizontalPopoverView(
                title: "Callout after content",
                description: "This one sits after the content",
                calloutTitle: "ArrowEdge: .leading",
                calloutEdge: .leading,
                isVisibleValue: $leadingPopoverVisible,
                xOffset: 150
            )
        }
    }

    func verticalPopoverView(
        title: String,
        description: String,
        calloutTitle: String,
        calloutEdge: Edge,
        isVisibleValue: Binding<Bool>,
        yOffset: Double
    ) -> some View {
        ZStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)

                Text(description)

                Divider()
            }

            if isVisibleValue.wrappedValue {
                Warp.Callout(
                    size: showDefault ? .default : .small,
                    type: .popover(onTapped: {
                        withAnimation {
                            isVisibleValue.wrappedValue = false
                        }
                    }),
                    title: calloutTitle,
                    arrowEdge: calloutEdge
                )
                .offset(y: yOffset)
            }
        }
    }

    func horizontalPopoverView(
        title: String,
        description: String,
        calloutTitle: String,
        calloutEdge: Edge,
        isVisibleValue: Binding<Bool>,
        xOffset: Double
    ) -> some View {
        ZStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)

                Text(description)

                Divider()
            }

            if isVisibleValue.wrappedValue {
                Warp.Callout(
                    size: showDefault ? .default : .small,
                    type: .popover(onTapped: {
                        withAnimation {
                            isVisibleValue.wrappedValue = false
                        }
                    }),
                    title: calloutTitle,
                    arrowEdge: calloutEdge
                )
                .offset(x: xOffset)
            }
        }
    }
}

#Preview {
    CalloutView()
}
