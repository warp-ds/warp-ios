import SwiftUI

extension Warp {
    /// A view modifier to display a modal on top of the existing content.
    public struct ModalViewModifier: ViewModifier {
        // MARK: - Properties
        
        /// The title text to be displayed in the modal's header.
        var title: String
        
        /// An optional subtitle text to provide additional context below the title.
        var subtitle: String?
        
        /// The main body text content of the modal.
        var bodyText: String
        
        public typealias ButtonConstructor = Warp.Modal.ButtonConstructor
        
        /// Provides a title and action for creating a primary button. Passing `nil` will hide the primary button.
        let primaryButtonProvider: ButtonConstructor?
        
        /// Provides a title and action for creating a secondary button. Passing `nil` will hide the secondary button.
        let secondaryButtonProvider: ButtonConstructor?
        
        /// Determines whether the modal should display a close button.
        var hasCloseButton: Bool
        
        /// Determines whether the component should be dismissed when the user clicks outside of it.
        var dismissOnClickOutside: Bool
        
        /// The action to execute when the modal is dismissed.
        let onDismiss: (() -> Void)?
        
        /// A binding to control the visibility of the modal.
        @Binding var isPresented: Bool
        
        // MARK: - Initializer
        
        /**
         Initializes the Modal view.
         - Parameters:
         - title: The main title text to be displayed.
         - subtitle: An optional subtitle text. Defaults to `nil`.
         - bodyText: The main body text content of the modal.
         - primaryButton: An optional provider for defining the primary button. Defaults to `nil`.
         - secondaryButton: An optional provider for defining the secondary button. Defaults to `nil`.
         - hasCloseButton: Whether the modal should include a close button. Defaults to `false`.
         - dismissOnClickOutside: Determines whether the component should be dismissed when the user clicks outside of it.
         - onDismiss: An optional action to execute when the modal is dismissed.
         - isPresented: A binding to control the visibility of the modal.
         */
        public init(
            title: String,
            subtitle: String? = nil,
            bodyText: String,
            primaryButton: ButtonConstructor? = nil,
            secondaryButton: ButtonConstructor? = nil,
            hasCloseButton: Bool = false,
            dismissOnClickOutside: Bool = true,
            onDismiss: (() -> Void)? = nil,
            isPresented: Binding<Bool>
        ) {
            self.title = title
            self.subtitle = subtitle
            self.bodyText = bodyText
            self.primaryButtonProvider = primaryButton
            self.secondaryButtonProvider = secondaryButton
            self.hasCloseButton = hasCloseButton
            self.dismissOnClickOutside = dismissOnClickOutside
            self.onDismiss = onDismiss
            self._isPresented = isPresented
        }
        
        // MARK: - Body
        
        public func body(content: Content) -> some View {
            ZStack {
                content
                    .disabled(isPresented)
                    .fullScreenCover(isPresented: $isPresented) {
                        warpModalOverlay()
                            .background(TransparentBackground())
                    }
                    .transaction { transaction in
                        transaction.disablesAnimations = true
                    }
            }
        }
        
        @ViewBuilder
        private func warpModalOverlay() -> some View {
            if isPresented {
                ZStack {
                    SwiftUI.Color.black.opacity(0.3)
                        .onTapGesture {
                            guard dismissOnClickOutside else { return }
                            isPresented.toggle()
                            onDismiss?()
                        }
                    Warp.Modal(
                        title: title,
                        subtitle: subtitle,
                        bodyText: bodyText,
                        primaryButton: primaryButtonProvider,
                        secondaryButton: secondaryButtonProvider,
                        hasCloseButton: hasCloseButton,
                        onDismiss: onDismiss,
                        isPresented: $isPresented
                    )
                }
                .edgesIgnoringSafeArea(.all)
                .ignoresSafeArea(edges: .all)
            }
        }
    }
}

struct TransparentBackground: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .clear
        }
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {}
}

public extension View {
    func warpModal(
        title: String,
        subtitle: String? = nil,
        bodyText: String,
        primaryButton: Warp.ModalViewModifier.ButtonConstructor? = nil,
        secondaryButton: Warp.ModalViewModifier.ButtonConstructor? = nil,
        closeButton: Bool = false,
        dismissOnClickOutside: Bool = true,
        onDismiss: (() -> Void)? = nil,
        isPresented: Binding<Bool>
    ) -> some View {
        self.modifier(
            Warp.ModalViewModifier(
                title: title,
                subtitle: subtitle,
                bodyText: bodyText,
                primaryButton: primaryButton,
                secondaryButton: secondaryButton,
                hasCloseButton: closeButton,
                dismissOnClickOutside: dismissOnClickOutside,
                onDismiss: onDismiss,
                isPresented: isPresented
            )
        )
    }
}
