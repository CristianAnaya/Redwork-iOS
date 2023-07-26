//
//  LoginUseCase.swift
//  Domain
//
//  Created by CRISTIAN ANAYA on 26/07/23.
//

import Foundation
import Combine

public class LoginUseCase {
    private let authRepository: AuthRepository
    
    public init(authRepository: AuthRepository) {
        self.authRepository = authRepository
    }
    
    public func invoke(phone: String, code: String, verificationId: String) -> AnyPublisher<Auth, Error> {
        if phone.isEmpty || code.isEmpty || verificationId.isEmpty {
            return Fail(error: AuthUseCaseError.unexpectedError).eraseToAnyPublisher()
        }
        
        return authRepository.loginWithOTP(phone: phone, code: code, verificationId: verificationId)
    }
}
