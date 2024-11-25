import SwiftUI
import Warp

struct PageIndicatorView: View {
    
    @State private var selectedPage = 0
    @State private var pageCount = 4
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            // Page Indicator display with dynamic page count and selected page
            Warp.PageIndicator(
                pageCount: pageCount,
                selectedPage: $selectedPage
            )
            .padding(.vertical, 20)
            
            // Controls to modify Page Indicator's page count and selected page
            GroupBox(content: {
                // Page Count Input
                HStack {
                    Text("Page Count")
                    Spacer()
                    Button(action: decrementPageCount) {
                        Image(systemName: "minus.circle")
                            .foregroundColor(Warp.Token.iconPrimary)
                    }
                    .padding(.trailing)
                    
                    TextField("Page Count", value: $pageCount, formatter: NumberFormatter())
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 80)
                        .keyboardType(.numberPad)
                        .multilineTextAlignment(.center)
                    
                    Button(action: incrementPageCount) {
                        Image(systemName: "plus.circle")
                            .foregroundColor(Warp.Token.iconPrimary)
                    }
                    .padding(.leading)
                }
                .padding(.top)
            }, label: {
                Text("Modify Page Indicator")
            })
            .padding(.bottom)
        }
        .padding(.horizontal)
        .navigationTitle("Page Indicator")
        .navigationBarTitleDisplayMode(.inline)
        .onTapGesture {
            dismissKeyboard() // Dismiss keyboard when tapping outside
        }
    }
    
    // Function to increment page count
    private func incrementPageCount() {
        if pageCount < 10 { // Limit to avoid too many indicators
            pageCount += 1
        }
    }
    
    // Function to decrement page count
    private func decrementPageCount() {
        if pageCount > 1 {
            pageCount -= 1
            if selectedPage >= pageCount {
                selectedPage = max(pageCount - 1, 0)
            }
        }
    }
    
    // Helper function to dismiss the keyboard
    private func dismissKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

#Preview {
    PageIndicatorView()
}
