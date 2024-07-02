import Foundation

extension Warp.StepIndicatorItem {
    enum Position {
        case first(nextProgress: Warp.StepIndicatorItem.Progress?)
        case middle(previousProgress: Warp.StepIndicatorItem.Progress, nextProgress: Warp.StepIndicatorItem.Progress)
        case last(previousProgress: Warp.StepIndicatorItem.Progress)
    }
}
