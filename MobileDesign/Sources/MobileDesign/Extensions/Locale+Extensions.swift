import Foundation

extension Locale {
    
    private static var language: String? {
        return Locale.preferredLanguages.first?.lowercased()
    }

    /// True if locale language is French. Otherwise, false.
    public static var isFrench: Bool {
        guard let language = language else { return false }
        return language.contains("fr")
    }

    /// Returns a created locale for either 'fr-CA' or 'en-CA' identifier depending on current locale language.
    public static var userLocale: Locale {
        return isFrench ? Locale(identifier: "fr-CA") : Locale(identifier: "en-CA")
    }
}
