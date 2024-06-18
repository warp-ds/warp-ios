import SwiftUI

@MainActor extension Warp {
    /**
        Enum describing  which edge the Broadcast view will appear from/disappear to
     */
    public enum BroadcastEdge: CaseIterable, Equatable {
        case top
        case bottom

        public var asAlignment: Alignment {
            switch self {
            case .top:
                .top
            case .bottom:
                .bottom
            }
        }

        public var asEdge: Edge {
            switch self {
            case .top:
                .top
            case .bottom:
                .bottom
            }
        }
    }
}
