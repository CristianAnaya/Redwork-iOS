//
//  GetFirstTimeUseCase.swift
//  Domain
//
//  Created by CRISTIAN ANAYA on 21/07/23.
//

import Foundation
import Combine

public class GetfirstTimeUseCase {
    private let authRepository: AuthRepository
    
    public init(authRepository: AuthRepository) {
        self.authRepository = authRepository
    }
    
    public func invoke() -> AnyPublisher<Bool, Error> {
        return authRepository.getFirstTime()
    }
    
}
