//
//  GetOTPUseCase.swift
//  Domain
//
//  Created by CRISTIAN ANAYA on 21/07/23.
//

import Foundation
import Combine

public class GetOTPUseCase {
    private let authRepository: AuthRepository
    
    public init(authRepository: AuthRepository) {
        self.authRepository = authRepository
    }
    
    public func invoke(phone: String, country: String) -> AnyPublisher<String, Error> {
        return authRepository.getOTP(phone: phone, country: country).flatMap { verificationId -> AnyPublisher<String, Error> in
            if phone.isEmpty || country.isEmpty {
                return Fail(error: AuthUseCaseError.emptyPhoneParameter).eraseToAnyPublisher()
            }
            
            return Just(verificationId)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
        .eraseToAnyPublisher()
    }
    
}
