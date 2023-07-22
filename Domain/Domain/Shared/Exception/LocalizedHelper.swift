//
//  LocalizedHelper.swift
//  Domain
//
//  Created by CRISTIAN ANAYA on 21/07/23.
//

import Foundation

extension String {
    
    func localized(tableName: String) -> String {
        return Bundle.DomainFramework.localizedString(forKey: self,
                                           value: "**\(self)**",
                                           table: tableName)
    }
    
    func localizedFormat(arguments: CVarArg..., tableName: String) -> String {
        return String(format: localized(tableName: tableName), arguments: arguments)
    }
   
}
