import SwiftUI
import Warp

struct StepIndicatorView: View {
    @State var orientation: Warp.StepIndicator.LayoutOrientation = .horizontal

    @State var stepTitle: String = "Step Title"
    @State var stepDescription: String = "Step Description"
    @State var stepProgress: Warp.StepIndicatorItem.Progress = .incomplete

    @State var steps: [Warp.StepIndicatorItem] = [
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

    var body: some View {
        VStack(spacing: 32) {
            Picker("Orientation", selection: $orientation) {
                ForEach([Warp.StepIndicator.LayoutOrientation.horizontal, Warp.StepIndicator.LayoutOrientation.vertical], id: \.self) { orientation in
                    Text(orientation.description)
                }
            }
            .pickerStyle(.segmented)

            GroupBox(
                content: {
                    VStack {
                        Warp.TextField(text: $stepTitle)
                            .frame(height: 44)
                        Warp.TextField(text: $stepDescription)
                            .frame(height: 44)

                        Picker(
                            selection: $stepProgress,
                            content: {
                                ForEach(
                                    [Warp.StepIndicatorItem.Progress.incomplete,
                                     Warp.StepIndicatorItem.Progress.inProgress,
                                     Warp.StepIndicatorItem.Progress.complete
                                    ], id: \.self
                                ) { progress in
                                    Text(progress.description)
                                }
                            },
                            label: {
                                Text("Step Progress")
                            }
                        )
                        .pickerStyle(.segmented)

                        HStack {
                            Warp.Button.create(
                                for: .primary,
                                title: "Push Step",
                                action: {
                                    pushStep()
                                },
                                fullWidth: true
                            )

                            Warp.Button.create(
                                for: .critical,
                                title: "Pop Step",
                                action: {
                                    popStep()
                                },
                                fullWidth: true
                            )
                        }
                    }
                },
                label: {
                    Text("Customize Steps")
                }
            )

            if #available(iOS 16.0, *) {
                ScrollView {
                    Warp.StepIndicator(
                        layoutOrientation: orientation,
                        steps: steps
                    )

                    Spacer()
                }
                .scrollDisabled(orientation == .horizontal)
            } else {
                ScrollView {
                    Warp.StepIndicator(
                        layoutOrientation: orientation,
                        steps: steps
                    )

                    Spacer()
                }
            }
        }
        .padding()
    }

    private func pushStep() {
        steps.append(
            .init(
                title: stepTitle,
                description: stepDescription,
                progress: stepProgress
            )
        )
    }

    private func popStep() {
        guard !steps.isEmpty else { return }
        steps.removeLast()
    }
}

fileprivate extension Warp.StepIndicator.LayoutOrientation {
    var description: String {
        switch self {
        case .horizontal:
            "Horizontal"
        case .vertical:
            "Vertical"
        }
    }
}

fileprivate extension Warp.StepIndicatorItem.Progress {
    var description: String {
        switch self {
        case .incomplete:
            "Incomplete"
        case .inProgress:
            "In Progress"
        case .complete:
            "Complete"
        }
    }
}

#Preview {
    StepIndicatorView()
}
