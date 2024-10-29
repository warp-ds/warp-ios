import SwiftUI

extension Warp {
    /// A page indicator component used to show the current page in a series.
    ///
    /// The `Warp.PageIndicator` component displays a series of dots to represent pages. The current page is highlighted, and users can tap on any dot to navigate to that page.
    ///
    /// **Usage:**
    /// ```swift
    /// Warp.PageIndicator(
    ///     pageCount: 4,
    ///     selectedPage: .constant(1)
    /// )
    /// ```
    ///
    /// - Parameters:
    ///   - pageCount: The total number of pages.
    ///   - selectedPage: Binding to an integer representing the currently selected page.
    public struct PageIndicator: View {
        
        // MARK: - Properties
        
        /// The total number of pages.
        private let pageCount: Int
        
        /// Binding to an integer representing the currently selected page.
        @Binding private var selectedPage: Int
        
        /// Object responsible for providing colors in different environments and variants.
        private let colorProvider: ColorProvider = Warp.Color
        
        // MARK: - Initialization
        
        /// Creates a new `PageIndicator` instance.
        ///
        /// - Parameters:
        ///   - pageCount: The total number of pages.
        ///   - selectedPage: Binding to an integer representing the currently selected page.
        public init(
            pageCount: Int,
            selectedPage: Binding<Int>
        ) {
            self.pageCount = pageCount
            self._selectedPage = selectedPage
        }
        
        // MARK: - Body
        
        public var body: some View {
            HStack(spacing: Warp.Spacing.spacing100) {
                ForEach(0..<pageCount, id: \..self) { index in
                    Circle()
                        .fill(index == selectedPage ? colorProvider.token.iconSelected : colorProvider.token.backgroundDisabledSubtle)
                        .frame(width: 10, height: 10)
                        .onTapGesture {
                            withAnimation {
                                selectedPage = index
                            }
                        }
                }
            }
            .padding(.vertical, Warp.Spacing.spacing100)
        }
    }
}

#Preview {
    Warp.PageIndicator(pageCount: 5, selectedPage: .constant(3))
}
