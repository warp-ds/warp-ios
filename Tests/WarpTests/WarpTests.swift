import Testing
@testable import Warp

//  Current theme is configured as a global variable, so the test suite cannot be easily parallelized
@Suite(.serialized)
struct WarpTests {

    @Test
    func testDefaultThemeInitialization() {
        let defaultBrand = Warp.BrandProvider.finn
        #expect(Warp.Theme == defaultBrand)
    }

    @Test
    func testThemeShouldReturnProperTokenProvider() {
        let expectedProvidersForTheme: [Warp.BrandProvider: TokenProvider] = [
            .finn: FinnTokenProvider(),
            .tori: ToriTokenProvider(),
            .dba: DbaTokenProvider(),
            .blocket: BlocketTokenProvider(),
            .vend: VendTokenProvider(),
            .neutral: NeutralTokenProvider()
        ]

        for (brand, expectedProvider) in expectedProvidersForTheme {
            Warp.Theme = brand
            let actualProvider = Warp.Token
            #expect(type(of: actualProvider) == type(of: expectedProvider))
        }
    }

    @Test
    func testUITokenShouldReturnProperUITokenProvider() {
        let expectedUITokenProvidersForTheme: [Warp.BrandProvider: UITokenProvider] = [
            .finn: FinnUITokenProvider(),
            .tori: ToriUITokenProvider(),
            .dba: DbaUITokenProvider(),
            .blocket: BlocketUITokenProvider(),
            .vend: VendUITokenProvider()
        ]

        for (brand, expectedProvider) in expectedUITokenProvidersForTheme {
            Warp.Theme = brand
            let actualProvider = Warp.UIToken
            #expect(type(of: actualProvider) == type(of: expectedProvider))
        }
    }

    @Test
    func testColorShouldReturnProperColorProvider() {
        let expectedTokenProviderForTheme: [Warp.BrandProvider: TokenProvider] = [
            .finn: FinnTokenProvider(),
            .tori: ToriTokenProvider(),
            .dba: DbaTokenProvider(),
            .blocket: BlocketTokenProvider(),
            .vend: VendTokenProvider(),
            .neutral: NeutralTokenProvider()
        ]

        for (brand, expectedProvider) in expectedTokenProviderForTheme {
            Warp.Theme = brand
            let actualColorProvider = Warp.Color
            #expect(type(of: actualColorProvider.token) == type(of: expectedProvider))
        }
    }

    @Test
    func testUIColorShouldReturnProperUIColorProvider() {
        let expectedUITokenProviderForTheme: [Warp.BrandProvider: UITokenProvider] = [
            .finn: FinnUITokenProvider(),
            .tori: ToriUITokenProvider(),
            .dba: DbaUITokenProvider(),
            .blocket: BlocketUITokenProvider(),
            .vend: VendUITokenProvider(),
            .neutral: NeutralUITokenProvider()
        ]

        for (brand, expectedProvider) in expectedUITokenProviderForTheme {
            Warp.Theme = brand
            let actualUIColorProvider = Warp.UIColor
            #expect(type(of: actualUIColorProvider.token) == type(of: expectedProvider))
        }
    }

    @Test(arguments: Warp.BrandProvider.allCases)
    func testFontsAreRegisteredForTheme(brand: Warp.BrandProvider) throws {
        Warp.Theme = brand
        try brand.registerFonts()
    }
}
