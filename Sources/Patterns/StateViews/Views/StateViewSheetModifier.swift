import SwiftUI

/// A reusable ViewModifier for presenting a StateView inside a sheet.
@available(iOS 16.0, *)
public struct StateViewSheetModifier: ViewModifier {
    @Binding var isPresented: Bool
    let viewModel: () -> StateViewModel
    var detents: Set<PresentationDetent>
    var showsDragIndicator: Visibility
    var onDismiss: (() -> Void)?

    public init(
        isPresented: Binding<Bool>,
        viewModel: @escaping () -> StateViewModel,
        detents: Set<PresentationDetent> = [.medium, .large],
        showsDragIndicator: Visibility = .visible,
        onDismiss: ( () -> Void)? = nil
    ) {
        self._isPresented = isPresented
        self.viewModel = viewModel
        self.detents = detents
        self.showsDragIndicator = showsDragIndicator
        self.onDismiss = onDismiss
    }

    public func body(content: Content) -> some View {
        content
            .sheet(isPresented: $isPresented, onDismiss: { onDismiss?() }, content: {
                StateView(viewModel: viewModel())
                    .presentationDetents(detents)
                    .presentationDragIndicator(showsDragIndicator)
            })
    }
}

@available(iOS 16.0, *)
public extension View {
    func stateViewSheet(
        isPresented: Binding<Bool>,
        viewModel: @escaping () -> StateViewModel,
        onDismiss: (() -> Void)? = nil
    ) -> some View {
        modifier(
            StateViewSheetModifier(
                isPresented: isPresented,
                viewModel: viewModel,
                detents: [.medium, .large],
                showsDragIndicator: .visible,
                onDismiss: onDismiss
            )
        )
    }
}
