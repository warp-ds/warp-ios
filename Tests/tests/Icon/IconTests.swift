import Testing
import UIKit
@testable import Warp

struct IconTests {

    // MARK: - Regular Icons Tests
    @Test
    func testRegularIconsMustNotBeEmpty() {
        let icons = Warp.Icon.allCases

        for icon in icons {
            let iconImage = icon.uiImage
            #expect(iconImage.size != .zero, "RegularIcon: \(icon.rawValue) should not have an empty image")
        }
    }

    @Test
    func testRegularIconsMustHaveLocalization() {
        let icons = Warp.Icon.allCases

        func checkIconsLocalization() {
            for icon in icons {
                let localizationKey = "icon.title.\(icon.rawValue)"
                let localizedName = icon.localization
                #expect(localizedName != localizationKey, "RegularIcon: \(icon.rawValue) should have a localized name")
            }
        }

        // Check all brand languages
        for brand in Warp.Brand.allCases {
            LanguageManager.shared.setLanguage(for: brand)
            checkIconsLocalization()
        }
    }

    // MARK: - Taxonomy Icons Tests
    @Test
    func testTaxonomyIconsMustNotBeEmpty() {
        let icons = Warp.TaxonomyIcon.allCases

        for icon in icons {
            let iconImage = icon.uiImage
            #expect(iconImage.size != .zero, "TaxonomyIcon: \(icon.rawValue) should not have an empty image")
        }
    }

    @Test
    func testTaxonomyIconsMustHaveLocalization() {
        let icons = Warp.TaxonomyIcon.allCases

        func checkIconsLocalization() {
            for icon in icons {
                let localizationKey = "taxonomy.icon.title.\(icon.rawValue)"
                let localizedName = icon.localization
                #expect(localizedName != localizationKey, "TaxonomyIcon: \(icon.rawValue) should have a localized name")
            }
        }

        // Check all brand languages
        for brand in Warp.Brand.allCases {
            LanguageManager.shared.setLanguage(for: brand)
            checkIconsLocalization()
        }
    }

    // MARK: - Brand Icons Tests
    @Test
    func testBrandIconsMustNotBeEmpty() {
        let icons = Warp.BrandIcon.allCases

        for icon in icons {
            let iconImage = icon.uiImage
            #expect(iconImage.size != .zero, "BrandIcon: \(icon.rawValue) should not have an empty image")
        }
    }

    @Test
    func testBrandIconsMustHaveLocalization() {
        let icons = Warp.BrandIcon.allCases

        func checkIconsLocalization() {
            for icon in icons {
                let localizationKey = "brand.icon.title.\(icon.rawValue)"
                let localizedName = icon.localization
                #expect(localizedName != localizationKey, "BrandIcon: \(icon.rawValue) should have a localized name")
            }
        }

        // Check all brand languages
        for brand in Warp.Brand.allCases {
            LanguageManager.shared.setLanguage(for: brand)
            checkIconsLocalization()
        }
    }

    // MARK: - Brand Logo Tests
    @Test
    func testBrandLogosMustNotBeEmpty() {
        let icons = Warp.BrandLogo.allCases

        for icon in icons {
            let iconImage = icon.uiImage
            #expect(iconImage.size != .zero, "BrandLogo: \(icon.assetName) should not have an empty image")
        }
    }

    @Test
    func testBrandLogosMustHaveLocalization() {
        let icons = Warp.BrandLogo.allCases

        func checkIconsLocalization() {
            for icon in icons {
                let localizationKey = "brand.logo.title.\(icon.assetName)"
                let localizedName = icon.localization
                #expect(localizedName != localizationKey, "BrandLogo: \(icon.assetName) should have a localized name")
            }
        }

        // Check all brand languages
        for brand in Warp.Brand.allCases {
            LanguageManager.shared.setLanguage(for: brand)
            checkIconsLocalization()
        }
    }
}


