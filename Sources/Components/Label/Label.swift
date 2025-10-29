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
    ///     tooltipContent: AnyView(Warp.Tooltip(title: "Tooltip text"))
    /// )
    /// ```
    ///
    /// - Parameters:
    ///   - title: The main title text to display.
    ///   - additionalInformation: Optional text to display after the title.
    ///   - tooltipContent: An optional view to display when the tooltip icon is tapped.
    struct Label: View {

        // MARK: - Properties

        /// Object responsible for providing colors in different environments and variants.
        private let colorProvider: ColorProvider = Warp.Color

        /// State variable to manage the presentation of the tooltip content.
        @State private var isTooltipPresented: Bool = false
        
        /// The main title text to display.
        private let title: String

        /// Optional text to display after the title.
        private let additionalInformation: String?

        /// An optional view to display when the tooltip icon is tapped.
        private let tooltipContent: AnyView?

        /// An optional action for tooltip info
        private var tooltipInfoAction: (() -> Void)?

        
        // MARK: - Initialization

        /// Creates a new `Label` instance.
        ///
        /// - Parameters:
        ///   - title: The main title text to display.
        ///   - additionalInformation: Optional text to display after the title.
        ///   - tooltipContent: An optional view to display when the tooltip icon is tapped.
        init(
            title: String,
            additionalInformation: String? = nil,
            tooltipContent: AnyView? = nil,
            tooltipInfoAction: (() -> Void)? = nil
        ) {
            self.title = title
            self.additionalInformation = additionalInformation
            self.tooltipContent = tooltipContent
            self.tooltipInfoAction = tooltipInfoAction
        }

        // MARK: - Body

        var body: some View {
            HStack(spacing: Warp.Spacing.spacing50) {
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
            if let tooltipContent {
                Warp.IconView(.info, size: .small, color: colorProvider.token.iconSubtle)
                    .onTapGesture {
                        withAnimation {
                            isTooltipPresented.toggle()
                        }
                    }

                if isTooltipPresented {
                    tooltipContent
                        .onTapGesture {
                            withAnimation {
                                isTooltipPresented.toggle()
                            }
                        }
                }
            } else if let tooltipInfoAction {
                Warp.IconView(.info, size: .small, color: colorProvider.token.iconSubtle)
                    .onTapGesture {
                        tooltipInfoAction()
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
                tooltipContent: AnyView(
                    Warp.Tooltip(title: "Test message", arrowEdge: .leading)
                )
            )
            Spacer()
        }
    }
    .padding()
}
