import SwiftUI

extension Warp {
    /// A customizable label component used to display a title, optional additional information, and an info tooltip.
    ///
    /// The `Warp.Label` component displays a main title with optional additional information. It can also show an info icon which, when tapped, presents custom tooltip content provided by the user.
    ///
    /// **Usage:**
    ///
    /// ```swift
    /// Warp.Label(
    ///     title: "Label Title",
    ///     additionalInformation: "Optional Info",
    ///     showToolTipImage: true,
    ///     tooltipContent: AnyView(Warp.Tooltip(title: "Tooltip text"))
    /// )
    /// ```
    ///
    /// - Parameters:
    ///   - title: The main title text to display.
    ///   - additionalInformation: Optional text to display after the title.
    ///   - showToolTipImage: Indicates whether to show the tooltip icon.
    ///   - tooltipContent: An optional view to display when the tooltip icon is tapped.
    public struct Label: View {

        // MARK: - Properties

        /// Object responsible for providing colors in different environments and variants.
        private let colorProvider: ColorProvider = Warp.Color

        /// State variable to manage the presentation of the tooltip content.
        @State private var isTooltipPresented: Bool = false
        
        /// The main title text to display.
        let title: String

        /// Optional text to display after the title.
        let additionalInformation: String?

        /// Indicates whether to show the tooltip icon.
        let showToolTipImage: Bool

        /// An optional view to display when the tooltip icon is tapped.
        let tooltipContent: AnyView?

        
        // MARK: - Initialization

        /// Creates a new `Label` instance.
        ///
        /// - Parameters:
        ///   - title: The main title text to display.
        ///   - additionalInformation: Optional text to display after the title.
        ///   - showToolTipImage: Indicates whether to show the tooltip icon.
        ///   - tooltipContent: An optional view to display when the tooltip icon is tapped.
        public init(
            title: String,
            additionalInformation: String? = nil,
            showToolTipImage: Bool = false,
            tooltipContent: AnyView? = nil
        ) {
            self.title = title
            self.additionalInformation = additionalInformation
            self.showToolTipImage = showToolTipImage
            self.tooltipContent = tooltipContent
        }

        // MARK: - Body

        public var body: some View {
            HStack(spacing: 4) {
                titleView
                optionalLabelView
                toolTipView
            }
        }

        // MARK: - Subviews

        /// View displaying the main title text.
        @ViewBuilder
        private var titleView: some View {
            Text(title, style: .title5)
        }

        /// View displaying the optional additional information text.
        @ViewBuilder
        private var optionalLabelView: some View {
            if let additionalInformation = additionalInformation {
                Text(
                    additionalInformation,
                    style: .detail,
                    color: colorProvider.token.textSubtle
                )
            }
        }

        /// View displaying the tooltip icon and handling its interaction.
        @ViewBuilder
        private var toolTipView: some View {
            if showToolTipImage {
                Warp.IconView(.info, size: .small, color: colorProvider.token.iconSubtle)
                    .onTapGesture {
                        withAnimation {
                            isTooltipPresented.toggle()
                        }
                    }
                
                if isTooltipPresented, let tooltipContent = tooltipContent {
                    tooltipContent
                        .onTapGesture {
                            withAnimation {
                                isTooltipPresented.toggle()
                            }
                        }
                }
            }
        }
    }
}

#Preview {
    VStack(spacing: 30) {
        HStack(alignment: .firstTextBaseline) {
            Warp.Label(
                title: "Label Title"
            )
            Spacer()
        }
    
        Divider()

        HStack(alignment: .firstTextBaseline) {
            Warp.Label(
                title: "Label Title",
                additionalInformation: "Optional",
                showToolTipImage: true,
                tooltipContent: AnyView(
                    Warp.Tooltip(title: "Test message", arrowEdge: .leading)
                )
            )
            Spacer()
        }
    }
    .padding()
}
