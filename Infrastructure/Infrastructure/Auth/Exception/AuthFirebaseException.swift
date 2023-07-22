//
//  AuthFirebaseRepositoryException.swift
//  Infrastructure
//
//  Created by CRISTIAN ANAYA on 21/07/23.
//

import Foundation

public enum AuthFirebaseException: Error, LocalizedError, Equatable {
    case invalidPhoneNumber
    case invalidVerificationCode
    case userNotFound
    case customError
    
    private static let authFirebaseLocalizable = "AuthFirebaseLocalizable"
    
    public var errorDescription: String? {
        switch self {
        case .invalidPhoneNumber:
            return "invalidPhoneNumberMessage".localized(tableName: AuthFirebaseException.authFirebaseLocalizable)
        case .invalidVerificationCode:
            return "invalidVerificationCodeMessage".localized(tableName: AuthFirebaseException.authFirebaseLocalizable)
        case .userNotFound:
            return "userNotFoundMessage".localized(tableName: AuthFirebaseException.authFirebaseLocalizable)
        case .customError:
            return "customErrorMessage".localized(tableName: AuthFirebaseException.authFirebaseLocalizable)

        }
    }

}

