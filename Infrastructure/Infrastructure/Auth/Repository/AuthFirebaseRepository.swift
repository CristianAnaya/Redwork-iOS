//
//  AuthFirebaseRepository.swift
//  Infrastructure
//
//  Created by CRISTIAN ANAYA on 21/07/23.
//

import Foundation
import Combine
import FirebaseAuth

struct AuthFirebaseRepository: AuthDataSourceRepository {
    private let firebaseAuth: Auth

    
    public init(firebaseAuth: Auth) {
        self.firebaseAuth = firebaseAuth
    }
    
    func getOTP(phone: String, country: String) -> AnyPublisher<String, Error> {
        return Future<String, Error> { promise in
            PhoneAuthProvider.provider().verifyPhoneNumber("\(country)\(phone)", uiDelegate: nil) { verificationID, error in
                if let nsError = error as NSError? {
                    if let error = nsError as NSError?, let errorCode = AuthErrorCode.Code(rawValue: error.code) {
                        switch errorCode {
                        case .invalidPhoneNumber:
                            promise(.failure(AuthFirebaseException.invalidPhoneNumber))
                        default:
                            print("PROXY 1: \(error)")
                            promise(.failure(AuthFirebaseException.customError))
                        }
                    } else {
                        promise(.failure(AuthFirebaseException.customError))
                    }
                } else if let verificationID = verificationID {
                    promise(.success(verificationID))
                }
            }
        }.eraseToAnyPublisher()
    }
    
    func loginWithOTP(phone: String, code: String, verificationId: String) -> AnyPublisher<String, Error> {
        print("loginWithOTP \(code) \(verificationId)")
        return Future<String, Error> { promise in
            let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationId, verificationCode: code)
            
            firebaseAuth.signIn(with: credential) { authResult, error in
                if let nsError = error as NSError? {
                    if let error = nsError as NSError?, let errorCode = AuthErrorCode.Code(rawValue: error.code) {
                        switch errorCode {
                        case .invalidPhoneNumber:
                            promise(.failure(AuthFirebaseException.invalidPhoneNumber))
                        case .invalidVerificationCode:
                            promise(.failure(AuthFirebaseException.invalidVerificationCode))
                        case .userNotFound:
                            promise(.failure(AuthFirebaseException.userNotFound))
                        default:
                            promise(.failure(AuthFirebaseException.customError))
                        }
                    } else {
                        promise(.failure(AuthFirebaseException.customError))
                    }
                } else {
                    if (authResult?.user.uid) != nil {
                        promise(.success(phone))
                    } else {
                        promise(.failure(AuthFirebaseException.userNotFound))
                    }
                }
            }
        }.eraseToAnyPublisher()
    }

}
