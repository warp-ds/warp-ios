import SwiftUI
import Warp

struct StepIndicatorView: View {
    @State private var orientation: Warp.StepIndicator.LayoutOrientation = .horizontal
    @State private var numbered = false
    @State private var isConfigureExpanded = true

    @State private var stepTitle = "Step Title"
    @State private var stepDescription = "Step Description"
    @State private var stepProgress: Warp.StepIndicatorItem.Progress = .incomplete

    @State private var steps: [Warp.StepIndicatorItem] = [
        .init(
            title: "Step 1",
            description: "progress = .complete",
            progress: .complete
        ),
        .init(
            title: "Step 2",
            description: "progress = .inProgress",
            progress: .inProgress
        ),
        .init(
            title: "Step 3",
            description: "progress = .incomplete",
            progress: .incomplete
        )
    ]

    @State private var stepModel: Warp.StepIndicatorModel?
    @State private var toastIsPresented = false
    @State private var toastMessage: String?

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 16) {
                // Reference states, one row per example so every state shows at its real size
                GroupBox(content: {
                    VStack(alignment: .leading, spacing: 24) {
                        Text("Horizontal")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        exampleIndicator(
                            orientation: .horizontal,
                            numbered: false,
                            items: [
                                .init(title: "Complete", description: "progress = .complete", progress: .complete),
                                .init(title: "In Progress", description: "progress = .inProgress", progress: .inProgress),
                                .init(title: "Incomplete", description: "progress = .incomplete", progress: .incomplete)
                            ]
                        )

                        Divider()

                        Text("Horizontal, numbered, with error")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        exampleIndicator(
                            orientation: .horizontal,
                            numbered: true,
                            items: [
                                .init(title: "Complete", description: "progress = .complete", progress: .complete),
                                .init(title: "Error", description: "progress = .error", progress: .error),
                                .init(title: "Incomplete", description: "progress = .incomplete", progress: .incomplete)
                            ]
                        )

                        Divider()

                        Text("Vertical, numbered")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        exampleIndicator(
                            orientation: .vertical,
                            numbered: true,
                            items: [
                                .init(title: "Complete", description: "progress = .complete", progress: .complete),
                                .init(title: "In Progress", description: "progress = .inProgress", progress: .inProgress),
                                .init(title: "Incomplete", description: "progress = .incomplete", progress: .incomplete)
                            ]
                        )
                    }
                    .padding()
                }, label: {
                    Text("All States")
                })

                // Usage example
                GroupBox(content: {
                    exampleIndicator(
                        orientation: .vertical,
                        numbered: true,
                        items: [
                            .init(title: "Address", description: "Shipping details", progress: .complete),
                            .init(title: "Payment", description: "Choose a payment method", progress: .inProgress),
                            .init(title: "Review", description: "Check your order", progress: .incomplete)
                        ]
                    )
                    .padding()
                }, label: {
                    Text("Usage Example")
                })

                // Current indicator, driven by the configure section below
                GroupBox(content: {
                    if let stepModel = stepModel {
                        Warp.StepIndicator(
                            layoutOrientation: orientation,
                            numbered: numbered,
                            stepModel: stepModel
                        )
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    }
                }, label: {
                    Text("Current Configuration")
                })

                // Controls, right under the preview; collapse to see the variants above
                GroupBox {
                    DisclosureGroup(isExpanded: $isConfigureExpanded) {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Orientation")
                            Picker("Orientation", selection: $orientation) {
                                Text("Horizontal").tag(Warp.StepIndicator.LayoutOrientation.horizontal)
                                Text("Vertical").tag(Warp.StepIndicator.LayoutOrientation.vertical)
                            }
                            .pickerStyle(.segmented)

                            Divider()

                            Toggle("Numbered", isOn: $numbered)

                            Divider()

                            Text("Step title")
                            Warp.TextField(text: $stepTitle)
                                .frame(height: 44)

                            Text("Step description")
                            Warp.TextField(text: $stepDescription)
                                .frame(height: 44)

                            Text("Step progress")
                            Picker("Step progress", selection: $stepProgress) {
                                Text("Incomplete").tag(Warp.StepIndicatorItem.Progress.incomplete)
                                Text("In Progress").tag(Warp.StepIndicatorItem.Progress.inProgress)
                                Text("Complete").tag(Warp.StepIndicatorItem.Progress.complete)
                                Text("Error").tag(Warp.StepIndicatorItem.Progress.error)
                            }
                            .pickerStyle(.segmented)

                            HStack {
                                Warp.Button(
                                    title: "Push Step",
                                    action: { pushStep() },
                                    fullWidth: true
                                )

                                Warp.Button(
                                    title: "Pop Step",
                                    action: { popStep() },
                                    type: .critical,
                                    fullWidth: true
                                )
                            }
                        }
                        .padding(.top, 12)
                    } label: {
                        Text("Configure")
                            .font(.headline)
                    }
                }
            }
            .padding(.horizontal)
        }
        .onAppear {
            stepsUpdated()
        }
        .warpToast(
            style: .error,
            title: toastMessage ?? "",
            edge: .top,
            isPresented: $toastIsPresented
        )
        .navigationTitle("StepIndicator")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func exampleIndicator(
        orientation: Warp.StepIndicator.LayoutOrientation,
        numbered: Bool,
        items: [Warp.StepIndicatorItem]
    ) -> some View {
        Group {
            if let model = try? Warp.StepIndicatorModel(from: items) {
                Warp.StepIndicator(
                    layoutOrientation: orientation,
                    numbered: numbered,
                    stepModel: model
                )
            } else {
                Text("Invalid step order")
                    .foregroundColor(.secondary)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private func pushStep() {
        steps.append(
            .init(
                title: stepTitle,
                description: stepDescription,
                progress: stepProgress
            )
        )
        stepsUpdated()
    }

    private func popStep() {
        guard !steps.isEmpty else { return }
        steps.removeLast()
        stepsUpdated()
    }

    private func stepsUpdated() {
        do {
            let newStepModel = try Warp.StepIndicatorModel(from: steps)
            stepModel = newStepModel
            toastIsPresented = false
            toastMessage = nil
        } catch {
            steps.removeLast()
            toastIsPresented = true
            toastMessage = error.localizedDescription
        }
    }
}

#Preview {
    StepIndicatorView()
}
