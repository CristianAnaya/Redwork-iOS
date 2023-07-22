//
//  SplashDependencyAssembler.swift
//  Presentation
//
//  Created by CRISTIAN ANAYA on 21/07/23.
//

import Foundation
import Swinject
import Domain
import Infrastructure

final class SplashDependencyAssembler: Assembly {
    
    func assemble(container: Container) {
        container.register(GetSessionUseCase.self) { resolver in
            GetSessionUseCase(authRepository: resolver.resolve(AuthRepository.self)!)
        }.inObjectScope(.container)
        
        container.register(GetfirstTimeUseCase.self) { resolver in
            GetfirstTimeUseCase(authRepository: resolver.resolve(AuthRepository.self)!)
        }.inObjectScope(.container)
        
        container.register(SplashViewModel.self) { resolver in
            SplashViewModel(
                getSessionUseCase: resolver.resolve(GetSessionUseCase.self)!,
                getFirstTimeUseCase: resolver.resolve(GetfirstTimeUseCase.self)!
            )
        }
    }
    
}
