import XCTest
import SwiftUI
@testable import Warp

/// Not a test of Warp. This exists to pay, once and unbounded, the cost of building the first
/// SwiftUI environment on a simulator that has never done it.
///
/// Measured on freshly `simctl create`d iOS 26 devices: the first `EnvironmentValues()` whose
/// result is actually consumed takes **~19s**, against 0.0001s for the UIKit trait path and 0.002s
/// for reading a token. On the CI runner the same call has exceeded the 180s test allowance. The
/// cost is **per device, not per process** - a second `xcodebuild` against the same device measured
/// 0.021s - and booting the device does not pay it, so the workflow's existing warm-up step cannot
/// cover this.
///
/// Without this step the failure is not a slow run, it is a wedged job. The cold cost lands inside
/// a timed test, `-default-test-execution-time-allowance` kills the process mid-warm-up *before the
/// device cache is written*, xctest restarts and pays the whole cost again, and after three such
/// restarts the swift-testing half blocks the main actor where `.timeLimit` cannot preempt it. The
/// run then has nothing to report and dies on the job timeout as `cancelled`.
final class SimulatorWarmUpTests: XCTestCase {

    func testWarmUpSwiftUIEnvironment() {
        let environment = EnvironmentValues()
        // Consume the environment. An `EnvironmentValues()` that is never read gets elided, which
        // measures 0.047s and warms nothing - that dead-code trap produced one wrong diagnosis
        // before the lifecycle-instrumented probe found the real cost.
        _ = Warp.Brand.finn.token.background.resolve(in: environment)
    }
}
