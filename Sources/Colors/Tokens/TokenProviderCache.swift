import Foundation

// Providers hold their colours as stored properties (so variants can override them),
// which makes construction expensive. Build each provider once and hand out copies.
enum TokenProviderCache {
    static let finn = FinnTokenProvider()
    static let tori = ToriTokenProvider()
    static let dba = DbaTokenProvider()
    static let blocket = BlocketTokenProvider()
    static let vend = VendTokenProvider()
    static let neutral = NeutralTokenProvider()

    static let finnUI = FinnUITokenProvider()
    static let toriUI = ToriUITokenProvider()
    static let dbaUI = DbaUITokenProvider()
    static let blocketUI = BlocketUITokenProvider()
    static let vendUI = VendUITokenProvider()
    static let neutralUI = NeutralUITokenProvider()

    static let dataviz = DatavizTokenProvider()
    static let datavizUI = DatavizUITokenProvider()
}
