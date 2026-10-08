import SwiftUI
import Warp

struct PrimitiveColorsView: View {
    
    var body: some View {
        switch Warp.Theme {
        case .finn:
            FinnColorsView()
        case .tori:
            ToriColorsView()
        case .dba:
            DbaColorsView()
        case .blocket:
            BlocketColorsView()
        case .vend:
            VendColorsView()
        case .neutral:
            NeutralColorsView()
        }
    }
}

#Preview {
    PrimitiveColorsView()
}
