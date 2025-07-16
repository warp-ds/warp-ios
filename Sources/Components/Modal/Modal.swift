import SwiftUI

extension Warp {
    /// A customizable modal dialog component to display important content, such as alerts, forms, or actions.
    public struct Modal: View {
        // MARK: - Properties
        
        /// The title text to be displayed in the modal's header.
        var title: String
        
        /// An optional subtitle text to provide additional context below the title.
        var subtitle: String?
        
        /// The main body text content of the modal.
        var bodyText: String
        
        public typealias ButtonConstructor = (title: String, action: () -> Void)
        
        /// Provides a title and action for creating a primary button. Passing `nil` will hide the primary button.
        let primaryButtonProvider: ButtonConstructor?
        
        /// Provides a title and action for creating a secondary button. Passing `nil` will hide the secondary button.
        let secondaryButtonProvider: ButtonConstructor?
        
        /// Determines whether the modal should display a close button.
        var hasCloseButton: Bool
        
        /// The action to execute when the modal is dismissed.
        let onDismiss: (() -> Void)?
        
        /// A binding to control the visibility of the modal.
        @Binding var isPresented: Bool
        
        /// Object responsible for providing colors in different environments and variants.
        private let colorProvider: ColorProvider = Warp.Color
        
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
            onDismiss: (() -> Void)? = nil,
            isPresented: Binding<Bool>
        ) {
            self.title = title
            self.subtitle = subtitle
            self.bodyText = bodyText
            self.primaryButtonProvider = primaryButton
            self.secondaryButtonProvider = secondaryButton
            self.hasCloseButton = hasCloseButton
            self.onDismiss = onDismiss
            self._isPresented = isPresented
        }
        
        // MARK: - Body
        
        public var body: some View {
            ZStack {
                backgroundView
                foregroundView
            }
            .fixedSize(horizontal: false, vertical: true)
            .cornerRadius(Warp.Border.borderRadius100)
            .addShadow(.medium)
            .accessibilityElement(children: .combine)
            .padding()
        }
        
        // MARK: - Views
        
        private var titleView: some View {
            Text(title, style: .title3)
                .accessibilityAddTraits(.isHeader)
        }
        
        @ViewBuilder
        private var closeButtonView: some View {
            if hasCloseButton {
                Warp.IconView(.close, size: .small)
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
            }
        }
        
        private var bodyTextView: some View {
            Text(bodyText, style: .body)
                .fixedSize(horizontal: false, vertical: true)
        }
        
        private var backgroundView: some View {
            colorProvider.token.surfaceElevated100
        }
        
        private var foregroundView: some View {
            VStack(alignment: .leading, spacing: Warp.Spacing.spacing200) {
                HStack {
                    titleView
                    Spacer()
                    closeButtonView
                }
                VStack(alignment: .leading, spacing: 0) {
                    subtitleView
                    bodyTextView
                    buttonsView
                        .padding(.top, Warp.Spacing.spacing300)
                }
            }
            .padding()
        }
        
        private var buttonsView: some View {
            ButtonsView(
                primaryButtonProvider: primaryButtonProvider,
                secondaryButtonProvider: secondaryButtonProvider
            )
        }
    }
}

// MARK: - ButtonsView

private struct ButtonsView: View, Hashable {
    let primaryButtonProvider: Warp.Modal.ButtonConstructor?
    let secondaryButtonProvider: Warp.Modal.ButtonConstructor?
    
    static func == (lhs: ButtonsView, rhs: ButtonsView) -> Bool {
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
    
    func hash(into hasher: inout Hasher) {
        if let primaryButtonProvider {
            hasher.combine(primaryButtonProvider.title)
        }
        
        if let secondaryButtonProvider {
            hasher.combine(secondaryButtonProvider.title)
        }
    }
    
    init?(
        primaryButtonProvider: Warp.Alert.ButtonConstructor?,
        secondaryButtonProvider: Warp.Alert.ButtonConstructor?
    ) {
        if primaryButtonProvider == nil, secondaryButtonProvider == nil {
            return nil
        }
        
        self.primaryButtonProvider = primaryButtonProvider
        self.secondaryButtonProvider = secondaryButtonProvider
    }
    
    var body: some View {
        HStack(spacing: Warp.Spacing.spacing200) {
            Spacer()
            if let secondaryButtonProvider {
                Warp.Button(
                    title: secondaryButtonProvider.title,
                    action: secondaryButtonProvider.action,
                    type: .secondary
                )
            }
            
            if let primaryButtonProvider {
                Warp.Button(
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
