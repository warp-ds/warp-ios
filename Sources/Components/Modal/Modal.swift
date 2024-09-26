//
//  ModalView.swift
//  Finn
//
//  Created by Milad Ajilianabbasi on 2024-06-05.
//

import SwiftUI
extension Warp {
    private static let modalCornerRadius: CGFloat = 12
    
    /// Modal is a component to display dioalog.
    public struct Modal: View {
        /// Text that will be shown as modal's heading.
        var title: String
        
        /// Text that will be shown after title in the middle of the modal.
        var subtitle: String? = nil
        
        /// Text that will be shown as main content of the modal.
        var bodyText: String
        
        public typealias ButtonConstructor = (title: String, action: @Sendable () -> Void)

        /// Tuple that will provide a title and an action for creating a primary button view.
        /// Passing `nil` will skip adding primary button view.
        let primaryButtonProvider: ButtonConstructor?
        
        /// Tuple that will provide a title and an action for creating a secondary button view.
        /// Passing `nil` will skip adding secondary button view.
        let secondaryButtonProvider: ButtonConstructor?
        
        /// Show/Hide close  image view.
        var hasCloseButton: Bool
        
        /// Action to be executed when the Modal is dismissed, either by pressing the Close button or by clicking outside the Modal.
        let onDismiss: (() -> Void)?

        /// Binding to present modal view.
        @Binding var isPresented: Bool
        
        /// Object responsible for providing colors in different environments and variants.
        private let colorProvider: ColorProvider
        
        /**
         - Parameter title: The main title text to be displayed.
         - Parameter subtitle: An optional subtitle text to provide additional context or information. Defaults to `nil`.
         - Parameter bodyText: The main body text content of the component.
         - Parameter primaryButton: An optional primary button constructor for defining the primary action. Defaults to `nil`.
         - Parameter secondaryButton: An optional secondary button constructor for defining a secondary action. Defaults to `nil`.
         - Parameter hasCloseButton: A Boolean value indicating whether a close button should be shown. Defaults to `false`.
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
            self.onDismiss = onDismiss
            self._isPresented = isPresented
            self.colorProvider = colorProvider
        }
        
        public var body: some View {
            ZStack {
                backgroundView

                foregroundView
            }
            .fixedSize(horizontal: false, vertical: true)
            .cornerRadius(modalCornerRadius)
            .addShadow(.small)
            .accessibilityElement(children: .combine)
            .padding()
        }
        private var titleView: some View {
            Text(title, style: .title3)
                .accessibilityAddTraits(.isHeader)
        }
        
        @ViewBuilder
        private var closeButtonView: some View {
            if hasCloseButton {
                Image("icon-close", bundle: .module)
                    .onTapGesture {
                        isPresented.toggle()
                        onDismiss?()
                    }
            }
        }
        
        @ViewBuilder
        private var subtitleView: some View {
            if let subtitle, !subtitle.isEmpty {
                Text(subtitle, style: .title4)
                    .accessibilityRemoveTraits(.isHeader)
            }
        }
        
        private var bodyTextView: some View {
            Text(bodyText, style: .body)
                .fixedSize(horizontal: false, vertical: true)
                .accessibilityRemoveTraits(.isHeader)
        }
        
        private var backgroundView: some View {
            colorProvider.cardBackground
        }
        
        private var foregroundView: some View {
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    titleView
                    Spacer()
                    closeButtonView
                }
                VStack(alignment: .leading, spacing: 0) {
                    subtitleView
                    bodyTextView
                    buttonsView
                        .padding(.top)
                }
            }
            .padding()
        }
        private var buttonsView: some View {
            ButtonsView(
                primaryButtonProvider: primaryButtonProvider,
                secondaryButtonProvider: secondaryButtonProvider,
                colorProvider: colorProvider
            )
        }
    }
}

private struct ButtonsView: View, Hashable {
    let primaryButtonProvider: Warp.Alert.ButtonConstructor?
    
    let secondaryButtonProvider: Warp.Alert.ButtonConstructor?
    
    let colorProvider: ColorProvider
    
    nonisolated static func == (lhs: ButtonsView, rhs: ButtonsView) -> Bool {
        let primaryComparison: Bool
        
        switch (lhs.primaryButtonProvider, rhs.primaryButtonProvider) {
        case let (.some(lhsProvider), .some(rhsProvider)):
            primaryComparison = lhsProvider.title == rhsProvider.title
            
        case (nil, nil):
            primaryComparison = true
            
        case (.some, nil):
            primaryComparison = false
            
        case (nil, .some):
            primaryComparison = false
        }
        
        let secondaryComparison: Bool
        
        switch (lhs.secondaryButtonProvider, rhs.secondaryButtonProvider) {
        case let (.some(lhsProvider), .some(rhsProvider)):
            secondaryComparison = lhsProvider.title == rhsProvider.title
            
        case (nil, nil):
            secondaryComparison = true
            
        case (.some, nil):
            secondaryComparison = false
            
        case (nil, .some):
            secondaryComparison = false
        }
        
        return primaryComparison && secondaryComparison
    }
    
    nonisolated func hash(into hasher: inout Hasher) {
        if let primaryButtonProvider {
            hasher.combine(primaryButtonProvider.title)
        }
        
        if let secondaryButtonProvider {
            hasher.combine(secondaryButtonProvider.title)
        }
    }
    
    init?(
        primaryButtonProvider: Warp.Alert.ButtonConstructor?,
        secondaryButtonProvider: Warp.Alert.ButtonConstructor?,
        colorProvider: ColorProvider
    ) {
        if primaryButtonProvider == nil, secondaryButtonProvider == nil {
            return nil
        }
        
        self.primaryButtonProvider = primaryButtonProvider
        self.secondaryButtonProvider = secondaryButtonProvider
        self.colorProvider = colorProvider
    }
    
    var body: some View {
        HStack {
            Spacer()
            if let secondaryButtonProvider {
                Warp.Button.createSecondary(
                    title: secondaryButtonProvider.title,
                    action: secondaryButtonProvider.action
                )
            }
            
            if let primaryButtonProvider {
                Warp.Button.createPrimary(
                    title: primaryButtonProvider.title,
                    action: primaryButtonProvider.action
                )
            }
        }
    }
}

#Preview {
    Warp.Modal(
        title: "Modal Title",
        subtitle: "Subtitle",
        bodyText: "This is the body of the modal dialog.",
        hasCloseButton: true,
        isPresented: .constant(true)
    )
}
