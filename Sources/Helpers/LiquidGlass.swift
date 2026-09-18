import Foundation

extension Warp {

    /// Whether the running OS can render Liquid Glass, as a value rather than an availability
    /// gate.
    ///
    /// Most of Warp's iOS 26 branches cannot use this. `if #available` and `guard #available` do
    /// two jobs at once: they test the OS *and* unlock the guarded API for the compiler, so a
    /// site that goes on to call `UIGlassEffect` or `UIBarButtonItem.Style.prominent` has to keep
    /// the syntactic check. This is for the other case - where glass support is an *input* to a
    /// decision rather than a gate around a call.
    ///
    /// Having it as a value is what lets those decisions be tested on any OS, by passing the flag
    /// in instead of reading the host's version. `Warp.SheetBackground.resolvedColor` is the
    /// current caller.
    static var supportsLiquidGlass: Bool {
        if #available(iOS 26.0, *) {
            return true
        }
        return false
    }
}
