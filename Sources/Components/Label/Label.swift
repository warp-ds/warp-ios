import Foundation
import SwiftUI

extension Warp {
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


        public var body: some View {
            HStack {
                titleView
                optionalLabelView
                toolTipView
            }
        }


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
