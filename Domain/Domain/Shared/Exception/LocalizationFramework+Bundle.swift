//
//  LocalizationFramework+Bundle.swift
//  Domain
//
//  Created by CRISTIAN ANAYA on 21/07/23.
//

import Foundation

extension Bundle {
    static var DomainFramework: Bundle {
        guard let localizationBundle = Bundle(identifier: "com.redwork.Domain") else { return .main }
        
        guard
            let bundlePath = localizationBundle.path(forResource: currentLanguage(of: localizationBundle),
                                                     ofType: "lproj"),
            let bundle = Bundle(path: bundlePath) else { return .main }
        
        return bundle
    }
    
    static func currentLanguage(of bundle: Bundle) -> String {
        var currentLanguage = String(Locale.preferredLanguages[0].prefix(2))
        
        let supportedLanguages = bundle.localizations
        
        if !supportedLanguages.contains(currentLanguage) {
            currentLanguage = bundle.preferredLocalizations[0]
        }
        return currentLanguage
    }
}
