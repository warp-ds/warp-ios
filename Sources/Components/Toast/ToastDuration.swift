//
// Created by Łukasz Śliwa on 18/07/2025.
//

import SwiftUI

extension Warp.Toast {

    /// Enum representing defined duration of a toast message.
    public enum Duration {
        /// Short duration, typically used for quick feedback messages.
        /// Default is 5 seconds.
        case short
        /// Long duration, typically used for more significant messages that require user attention.
        /// Default is 10 seconds.
        case long
        /// Infinite duration, typically used for messages that require user interaction to dismiss.
        case infinite
        /// Custom duration time interval
        case custom(interval: TimeInterval)

        var timeInNanoseconds: UInt64 {
            switch self {
            case .short:
                5_000_000_000 // 5 seconds
            case .long:
                10_000_000_000 // 10 seconds
            case .infinite:
                6_000_000_000_000
            case .custom(let interval):
                UInt64(interval * 1_000_000_000) // Convert time interval to nanoseconds
            }
        }
    }
}
