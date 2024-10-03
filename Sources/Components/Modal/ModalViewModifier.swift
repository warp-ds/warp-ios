//
//  ModalView.swift
//  Finn
//
//  Created by Milad Ajilianabbasi on 2024-06-05.
//

import SwiftUI
extension Warp {    

    public struct ModalViewModifier: ViewModifier {
        /// Text that will be shown as modal's heading.
        var title: String
        
        /// Text that will be shown after title in the middle of the modal.
        var subtitle: String? = nil
        
        /// Text that will be shown as main content of the modal.
        var bodyText: String
        
        /// Binding to a boolean value that allows the modal to control dismissal
        @Binding var isPresented: Bool
        
        public typealias ButtonConstructor = (title: String, action: () -> Void)

        /// Tuple that will provide a title and an action for creating a primary button view.
        /// Passing `nil` will skip adding primary button view.
        let primaryButtonProvider: ButtonConstructor?
        
        
        
        /// Tuple that will provide a title and an action for creating a secondary button view.
        /// Passing `nil` will skip adding secondary button view.
        let secondaryButtonProvider: ButtonConstructor?
        
        /// boolean show/hide close image view.
        var hasCloseButton: Bool
        
        /// A Boolean value indicating whether the component should be dismissed when the user clicks outside of it.
        let dismissOnClickOutside: Bool
        
        /// Action to be executed when the Modal is dismissed, either by pressing the Close button or by clicking outside the Modal.
        let onDismiss: (() -> Void)?
        
        /// Object responsible for providing colors in different environments and variants.
        private let colorProvider: ColorProvider
        /**
         - Parameter title: The main title text to be displayed.
         - Parameter subtitle: An optional subtitle text to provide additional context or information. Defaults to `nil`.
         - Parameter bodyText: The main body text content of the component.
         - Parameter primaryButton: An optional primary button constructor for defining the primary action. Defaults to `nil`.
         - Parameter secondaryButton: An optional secondary button constructor for defining a secondary action. Defaults to `nil`.
         - Parameter hasCloseButton: A Boolean value indicating whether a close button should be shown. Defaults to `false`.
         - Parameter dismissOnClickOutside: A Boolean value indicating whether the component should be dismissed when the user clicks outside of it. Defaults to `true.
         - Parameter onDismiss: Action to be executed when the Modal is dismissed, either by pressing the Close button or by clicking outside the Modal. Defaults to `nil`.
         - Parameter isPresented: A binding to a Boolean value that controls the visibility of the component.
         - Parameter colorProvider: A provider for the color scheme of the component. Defaults to `Warp.Color`.
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
            isPresented: Binding<Bool>,
            colorProvider: ColorProvider = Warp.Color
        ) {
            self.title = title
            self.subtitle = subtitle
            self.bodyText = bodyText
            self.primaryButtonProvider = primaryButton
            self.secondaryButtonProvider = secondaryButton
            self.hasCloseButton = hasCloseButton
            self.dismissOnClickOutside = dismissOnClickOutside
            self.onDismiss = onDismiss
            self.colorProvider = colorProvider
            self._isPresented = isPresented
        }
        
        public func body(content: Content) -> some View {
            ZStack {
                content
                    .disabled(isPresented)
                    .fullScreenCover(isPresented: $isPresented, content: {
                        warpModalOverlay()
                            .background(TransparentBackground())
                    })
                    .transaction { transaction in
                        transaction.disablesAnimations = true
                    }
            }
        }
        
        @ViewBuilder
        func warpModalOverlay() -> some View {
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
                        isPresented: $isPresented,
                        colorProvider: colorProvider
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
        isPresented: Binding<Bool>,
        colorProvider: ColorProvider = Warp.Color
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
                isPresented: isPresented,
                colorProvider: colorProvider
            )
        )
    }
}
