//
//  AuthException.swift
//  Domain
//
//  Created by CRISTIAN ANAYA on 21/07/23.
//

import Foundation

enum AuthUseCaseError: Error {
    case emptyPhoneParameter
    case unexpectedError
    
    private static let authLocalizable = "AuthLocalizable"
    
    var errorDescription: String? {
        switch self {
        case .emptyPhoneParameter:
            return "emptyPhoneParameterMessage".localized(tableName: AuthUseCaseError.authLocalizable)
        case .unexpectedError:
            return "unexpectedError".localized(tableName: AuthUseCaseError.authLocalizable)
        }
    }
}
