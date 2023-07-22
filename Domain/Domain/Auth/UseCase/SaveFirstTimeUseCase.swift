//
//  SaveFirstTimeUseCase.swift
//  Domain
//
//  Created by CRISTIAN ANAYA on 21/07/23.
//

import Foundation
import Combine

public class SaveFirstTimeUseCase {
    private let authRepository: AuthRepository
    
    public init(authRepository: AuthRepository) {
        self.authRepository = authRepository
    }
    
    public func invoke(status: Bool)-> AnyPublisher<Void, Error> {
        return authRepository.firstTime(status: status)
    }
    
}
