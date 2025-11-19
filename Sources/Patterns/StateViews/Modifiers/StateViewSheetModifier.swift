import SwiftUI

/// A reusable ViewModifier for presenting any StateView-based view inside a sheet.
@available(iOS 16.0, *)
public struct StateViewSheetModifier<StateViewContent: View>: ViewModifier {

    @Binding var isPresented: Bool
    let stateView: () -> StateViewContent
    var detents: Set<PresentationDetent>
    var showsDragIndicator: Visibility
    var onDismiss: (() -> Void)?

    public init(
        isPresented: Binding<Bool>,
        stateView: @escaping () -> StateViewContent,
        detents: Set<PresentationDetent> = [.medium, .large],
        showsDragIndicator: Visibility = .visible,
        onDismiss: (() -> Void)? = nil
    ) {
        self._isPresented = isPresented
        self.stateView = stateView
        self.detents = detents
        self.showsDragIndicator = showsDragIndicator
        self.onDismiss = onDismiss
    }

    public func body(content: Content) -> some View {
        content
          .sheet(isPresented: $isPresented, onDismiss: { onDismiss?() }, content: {
              stateView()
                .presentationDetents(detents)
                .presentationDragIndicator(showsDragIndicator)
          })
    }
}

@available(iOS 16.0, *)
public extension View {
    func stateViewSheet<StateViewContent: View>(
        isPresented: Binding<Bool>,
        stateView: @escaping () -> StateViewContent,
        detents: Set<PresentationDetent> = [.medium, .large],
        showsDragIndicator: Visibility = .visible,
        onDismiss: (() -> Void)? = nil
    ) -> some View {
        modifier(
            StateViewSheetModifier(
                isPresented: isPresented,
                stateView: stateView,
                detents: detents,
                showsDragIndicator: showsDragIndicator,
                onDismiss: onDismiss
            )
        )
    }
}