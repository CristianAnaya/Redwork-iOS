//
//  RegisterUseCase.swift
//  Domain
//
//  Created by CRISTIAN ANAYA on 27/07/23.
//

import Foundation
import Combine

public class RegisterUseCase {
    private let repository: AuthRepository
    
    public init(repository: AuthRepository) {
        self.repository = repository
    }
    
    public func invoke(register: Register) -> AnyPublisher<Auth, Error> {
        if register.name.isEmpty || register.lastName.isEmpty || register.email.isEmpty || register.phone.isEmpty {
            return Fail(error: AuthUseCaseError.emptyParam).eraseToAnyPublisher()
        }
        
        if !register.email.contains("@") {
            return Fail(error: AuthUseCaseError.invalidEmail).eraseToAnyPublisher()
        }
        
        return repository.register(register: register)
    }
}
