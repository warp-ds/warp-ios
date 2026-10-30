import SwiftUI
import Warp

struct StepIndicatorView: View {
    /// Slot content chosen for a single step.
    struct SlotConfig: Equatable {
        var showsTitle = true
        var showsButton = false
        var buttonTitle = "Details"
        var showsAlert = false
    }

    struct StepConfig: Identifiable {
        let id = UUID()
        var title: String
        var description: String
        var progress: Warp.StepIndicatorItem.Progress = .incomplete
        var slot = SlotConfig()

        var item: Warp.StepIndicatorItem {
            .init(title: title, description: description, progress: progress)
        }
    }

    @State private var orientation: Warp.StepIndicator.LayoutOrientation = .horizontal
    @State private var numbered = false
    @State private var isConfigureExpanded = true
    @State private var isAllStatesExpanded = true
    @State private var isUsageExpanded = true
    @State private var isCustomSlotExpanded = true
    @State private var scrollPosition = ScrollPosition(edge: .top)

    @State private var steps: [StepConfig] = [
        .init(title: "Address", description: "Shipping details", progress: .complete),
        .init(title: "Payment", description: "Choose a payment method", progress: .inProgress),
        .init(title: "Review", description: "Check your order", progress: .incomplete)
    ]

    @State private var pushSlotShowsTitle = true
    @State private var pushSlotShowsButton = false
    @State private var pushSlotShowsAlert = false
    @State private var pushSlotButtonTitle = "Details"

    @State private var stepTitle = "Step Title"
    @State private var stepDescription = "Step Description"
    @State private var stepProgress: Warp.StepIndicatorItem.Progress = .incomplete

    @State private var toastIsPresented = false
    @State private var toastMessage: String?
    @State private var lastTappedStep: String?

    /// Shared model for both previews. `nil` when the steps are in an invalid order.
    private var stepModel: Warp.StepIndicatorModel? {
        try? Warp.StepIndicatorModel(from: steps.map(\.item))
    }

    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(spacing: 16, pinnedViews: [.sectionHeaders]) {
                VStack(spacing: 16) {
                // Reference states, one row per example so every state shows at its real size
                GroupBox {
                    DisclosureGroup(isExpanded: $isAllStatesExpanded) {
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
                    .padding(.top, 12)
                    } label: {
                        Text("All States")
                            .font(.headline)
                    }
                }

                // Usage example
                GroupBox {
                    DisclosureGroup(isExpanded: $isUsageExpanded) {
                    exampleIndicator(
                        orientation: .vertical,
                        numbered: true,
                        items: [
                            .init(title: "Address", description: "Shipping details", progress: .complete),
                            .init(title: "Payment", description: "Choose a payment method", progress: .inProgress),
                            .init(title: "Review", description: "Check your order", progress: .incomplete)
                        ]
                    )
                    .padding(.top, 12)
                    } label: {
                        Text("Usage Example")
                            .font(.headline)
                    }
                }

                // Custom title slot: any view can replace the default title + subtitle
                GroupBox {
                    DisclosureGroup(isExpanded: $isCustomSlotExpanded) {
                    VStack(alignment: .leading, spacing: 24) {
                        Text("Horizontal, custom slot")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        customSlotIndicator(orientation: .horizontal)

                        Divider()

                        Text("Vertical, custom slot")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        customSlotIndicator(orientation: .vertical)

                        if let lastTappedStep {
                            Divider()

                            Text("Last tapped: \(lastTappedStep)")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding(.top, 12)
                    } label: {
                        Text("Custom Title Slot")
                            .font(.headline)
                    }
                }
                }

                // Current configuration sits above the controls and sticks to the top while scrolling
                Section {
                GroupBox {
                    DisclosureGroup(isExpanded: $isConfigureExpanded) {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Orientation")
                            Picker("Orientation", selection: $orientation) {
                                Text("Horizontal").tag(Warp.StepIndicator.LayoutOrientation.horizontal)
                                Text("Vertical").tag(Warp.StepIndicator.LayoutOrientation.vertical)
                            }
                            .pickerStyle(.segmented)

                            Toggle("Numbered", isOn: $numbered)

                            Divider()

                            Text("Push / pop step")
                                .font(.caption)
                                .foregroundColor(.secondary)

                            Text("Step slot content")
                            Toggle("Title & subtitle", isOn: $pushSlotShowsTitle)
                            if pushSlotShowsTitle {
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("Step title")
                                    Warp.TextField(text: $stepTitle)
                                        .frame(height: 44)

                                    Text("Step description")
                                    Warp.TextField(text: $stepDescription)
                                        .frame(height: 44)
                                }
                                .padding(.leading, 16)
                            }

                            Toggle("Button", isOn: $pushSlotShowsButton)
                            if pushSlotShowsButton {
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("Button title")
                                    Warp.TextField(text: $pushSlotButtonTitle)
                                        .frame(height: 44)
                                }
                                .padding(.leading, 16)
                            }

                            Toggle("Alert", isOn: $pushSlotShowsAlert)

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

                            Text("Steps: \(steps.count)")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        .padding(.top, 12)
                    } label: {
                        Text("Configure")
                            .font(.headline)
                    }
                }
                } header: {
                    // Scrolls inside a capped height so a big indicator can't cover the controls below it.
                    ScrollView(showsIndicators: false) {
                        currentConfigurationBox
                    }
                    .scrollBounceBehavior(.basedOnSize)
                    .frame(maxHeight: 320)
                        .padding(.top, 8)
                        .padding(.bottom, 16)
                        .background(.background)
                }
            }
            .padding(.horizontal)
        }
        .scrollPosition($scrollPosition)
        .warpToast(
            style: .error,
            title: toastMessage ?? "",
            edge: .top,
            isPresented: $toastIsPresented
        )
        .navigationTitle("StepIndicator")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    toggleAllSections()
                } label: {
                    Image(systemName: allSectionsExpanded ? "chevron.up.circle" : "chevron.down.circle")
                }
                .accessibilityLabel(allSectionsExpanded ? "Collapse all sections" : "Expand all sections")
            }
        }
    }

    private var allSectionsExpanded: Bool {
        isAllStatesExpanded && isUsageExpanded && isCustomSlotExpanded && isConfigureExpanded
    }

    private func toggleAllSections() {
        let newValue = !allSectionsExpanded
        // Collapsing shrinks the content; reset the offset first so the lazy stack never ends up past its end.
        if !newValue { scrollPosition.scrollTo(edge: .top) }
        isAllStatesExpanded = newValue
        isUsageExpanded = newValue
        isCustomSlotExpanded = newValue
        isConfigureExpanded = newValue
    }

    /// Appends a step built from the push fields, rejecting it with a toast if the order becomes invalid.
    private func pushStep() {
        let slot = SlotConfig(
            showsTitle: pushSlotShowsTitle,
            showsButton: pushSlotShowsButton,
            buttonTitle: pushSlotButtonTitle,
            showsAlert: pushSlotShowsAlert
        )
        let newStep = StepConfig(title: stepTitle, description: stepDescription, progress: stepProgress, slot: slot)
        do {
            _ = try Warp.StepIndicatorModel(from: (steps + [newStep]).map(\.item))
            steps.append(newStep)
            toastIsPresented = false
            toastMessage = nil
        } catch {
            toastIsPresented = true
            toastMessage = error.localizedDescription
        }
    }

    private func popStep() {
        guard !steps.isEmpty else { return }
        steps.removeLast()
        toastIsPresented = false
        toastMessage = nil
    }

    /// Pinned to the top of the screen so the current configuration stays visible while scrolling.
    private var currentConfigurationBox: some View {
        GroupBox(content: {
            if let stepModel {
                Warp.StepIndicator(
                    layoutOrientation: orientation,
                    numbered: numbered,
                    stepModel: stepModel
                ) { step in
                    pushStepSlot(for: step, config: slotConfig(for: step))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            } else {
                invalidOrderText
                    .padding()
            }
        }, label: {
            Text("Current Configuration")
        })
    }

    /// Looks up the slot config of the step being rendered. Items get a fresh id on every render,
    /// so the match is by title and description.
    private func slotConfig(for step: Warp.StepIndicatorItem) -> SlotConfig {
        steps.first { $0.title == step.title && $0.description == step.description }?.slot ?? SlotConfig()
    }

    /// Slot built from a step's own options: any combination of title & subtitle, button and alert.
    private func pushStepSlot(for step: Warp.StepIndicatorItem, config: SlotConfig) -> some View {
        VStack(
            alignment: orientation == .horizontal ? .center : .leading,
            spacing: 8
        ) {
            if config.showsTitle {
                Warp.StepIndicator.TitleView(
                    step: step,
                    layoutOrientation: orientation
                )
            }

            if config.showsButton {
                Warp.Button(
                    title: config.buttonTitle,
                    action: { lastTappedStep = step.title }
                )
            }

            if config.showsAlert {
                Warp.Alert(
                    style: .info,
                    title: "Alert for \(step.title)",
                    subtitle: "Shown inside the step slot."
                )
                // Alert expands to fill its container; a horizontal step has no width to fill, so give it one.
                .frame(width: orientation == .horizontal ? 240 : nil)
            }
        }
    }

    private var invalidOrderText: some View {
        Text("Invalid step order")
            .foregroundColor(.secondary)
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
                invalidOrderText
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private func customSlotIndicator(
        orientation: Warp.StepIndicator.LayoutOrientation
    ) -> some View {
        Group {
            if let stepModel {
                Warp.StepIndicator(
                    layoutOrientation: orientation,
                    numbered: true,
                    stepModel: stepModel
                ) { step in
                    VStack(
                        alignment: orientation == .horizontal ? .center : .leading,
                        spacing: 8
                    ) {
                        Warp.StepIndicator.TitleView(
                            step: step,
                            layoutOrientation: orientation
                        )

                        Warp.Button(
                            title: "Details",
                            action: { lastTappedStep = step.title }
                        )
                    }
                }
            } else {
                invalidOrderText
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    StepIndicatorView()
}
