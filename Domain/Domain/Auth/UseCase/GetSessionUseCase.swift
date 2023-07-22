//
//  GetSessionUseCase.swift
//  Domain
//
//  Created by CRISTIAN ANAYA on 21/07/23.
//

import Foundation
import Combine

public class GetSessionUseCase {
    private let authRepository: AuthRepository
    
    public init(authRepository: AuthRepository) {
        self.authRepository = authRepository
    }
    
    public func invoke()-> AnyPublisher<Auth, Error> {
        return authRepository.getSession()
    }
    
}
