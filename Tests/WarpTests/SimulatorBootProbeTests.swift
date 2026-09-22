import XCTest
import SwiftUI
@testable import Warp

/// Not a test of Warp. This is a probe for a bad simulator boot, run before anything else in CI.
///
/// The iOS 26 leg intermittently wedges: a test that touches SwiftUI starts and never returns, and
/// the job dies on `timeout-minutes` reporting `cancelled`. An earlier diagnosis blamed a cold-cache
/// cost for the first `EnvironmentValues()` on a never-booted device (~19s measured locally). That
/// was falsified on the runner:
///
/// | measurement | run | result |
/// |---|---|---|
/// | this probe, iOS 26, no timeout at all | 35710643887 | never returned in 20m40s |
/// | this probe, iOS 18, same job | 35710643887 | 0.234s |
/// | the same `EnvironmentValues()` call, iOS 26, equally cold runner | 35338773478 | 0.203s |
///
/// A 19s cost does not become a 1240s cost, and the identical call was 0.203s on a fresh iOS 26
/// device four days earlier. The distribution is bimodal - roughly 0.2s, or never - which is a hang,
/// not a cache fill. Nor is the local number a cold-start cost: three consecutive runs against the
/// *same already-booted* device measured 19.96s, 11.99s and 14.97s, so it never warms up and the
/// "per-device, second run is 0.021s" claim behind the original diagnosis does not reproduce.
///
/// ## What `EnvironmentValues()` actually does
///
/// `sample` on the test host during the slow window, 455 of 455 samples in one stack:
///
///     EnvironmentValues.init()                                    SwiftUICore
///      SwiftUIGlue2.configureEmptyEnvironment(_:)                 SwiftUI
///       EnvironmentValues.configureForPlatform(traitCollection:)
///        dispatch_once -> one-time initialization for configuredForPlatform
///         EnvironmentValues._configureForPlatform(traitCollection:)
///          +[UIScreen initialize]                                 UIKitCore
///           -[_UIScreenInitialDisplayConfigurationLoader initialDisplayContext]
///            -[_UIApplicationConfigurationLoader applicationInitializationContext]
///             _dispatch_once_wait -> __ulock_wait                 <- main thread parks here
///
/// and the worker thread it is parked on:
///
///     -[_UIApplicationConfigurationLoader _loadInitializationContext]
///      __UIAPPLICATION_IS_LOADING_INITIALIZATION_INFO_FROM_THE_SYSTEM__
///       -[UISApplicationSupportClient applicationInitializationContextWithParameters:]  UIKitServices
///        -[BSXPCServiceConnectionMessage sendSynchronouslyWithError:]                   BoardServices
///         xpc_connection_send_message_with_reply_sync
///          mach_msg2_trap                                         <- blocked in the kernel
///
/// So the first SwiftUI environment in a process makes a **synchronous, un-timed XPC round trip to
/// the simulator's BoardServices daemon** for the application initialization context. Everything
/// observed follows from that one call:
///
/// - **Bimodal timing.** If the daemon answers you pay the round trip; if it never answers,
///   `xpc_connection_send_message_with_reply_sync` has no timeout and blocks forever.
/// - **Per process, not per device.** It is a `dispatch_once`, so every restarted `xctest` pays it
///   again. That is the real reason the 180s restart loop never made progress - not an unwritten
///   device cache.
/// - **`simctl boot` cannot pre-pay it.** Booting starts the daemon; the round trip still happens
///   once inside each new test process.
/// - **`.timeLimit` cannot preempt it.** The main thread is blocked in the kernel, not suspended at
///   an await point.
/// - **The UIKit trait path is unaffected.** `UIColor.resolvedColor(with:)` never reaches
///   `+[UIScreen initialize]`, which is why it measures 0.0001s.
///
/// A wedge is therefore a property of the *boot*, not the device or the cache - which is what makes
/// "throw the device away and boot another one" the right recovery, and waiting longer the wrong one.
///
/// So the job of this test is to answer one question cheaply: **can this boot build a SwiftUI
/// environment at all?** On a healthy boot it costs ~0.2s. If it overruns, the workflow does not
/// wait it out - it samples the hung process, throws the device away and boots another one.
final class SimulatorBootProbeTests: XCTestCase {

    func testFirstSwiftUIEnvironmentResolves() {
        // SCRATCH BRANCH ONLY - DO NOT MERGE. Simulates the wedge so the workflow's recovery path
        // (sample, kill, erase, create, boot, reinstall) can be exercised on a real runner without
        // waiting for a real wedge to occur. Driven by TEST_RUNNER_WARP_PROBE_FORCE_HANG.
        if ProcessInfo.processInfo.environment["WARP_PROBE_FORCE_HANG"] != nil {
            Thread.sleep(forTimeInterval: 600)
        }

        let environment = EnvironmentValues()
        // Consume the environment. An `EnvironmentValues()` that is never read gets elided, which
        // measures 0.047s and probes nothing - that dead-code trap produced one wrong diagnosis
        // before the lifecycle-instrumented probe found the real shape.
        _ = Warp.Brand.finn.token.background.resolve(in: environment)
    }
}
