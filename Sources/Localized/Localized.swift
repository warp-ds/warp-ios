import Foundation

extension Warp {
    enum LocalizedString: String {
        case activeAds = "Active Ads"
        
        var localized: String {
            self.rawValue.localized
        }
    }
}

public extension String {
    var localized: String {
        return LanguageManager.shared.localizedString(forKey: self)
    }
}

class LanguageManager {
    static let shared = LanguageManager()

    private var bundle: Bundle?

    func setLanguage() {
        var language: String
        switch Warp.Theme {
        case .finn:
            language = "nb"
        case .tori:
            language = "fi"
        case .dba:
            language = "da"
        case .blocket:
            language = "sv"
        case .oikotie:
            language = "fi"
        }
//        language = "en"
        guard let path = Bundle.module.path(forResource: language, ofType: "lproj"),
              let bundle = Bundle(path: path) else {
            self.bundle = .module
            return
        }
        self.bundle = bundle
    }

    func localizedString(forKey key: String) -> String {
        return bundle?.localizedString(forKey: key, value: nil, table: nil) ?? key
    }
}
