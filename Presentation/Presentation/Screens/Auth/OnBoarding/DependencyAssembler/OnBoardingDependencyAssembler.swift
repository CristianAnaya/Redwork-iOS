//
//  OnBoardingDependencyAssembler.swift
//  Presentation
//
//  Created by CRISTIAN ANAYA on 21/07/23.
//

import Foundation
import Swinject
import Domain

final class OnBoardingDependencyAssembler: Assembly {
    
    func assemble(container: Container) {
        container.register(SaveFirstTimeUseCase.self) { resolver in
            SaveFirstTimeUseCase(authRepository: resolver.resolve(AuthRepository.self)!)
        }.inObjectScope(.container)
        
        container.register(OnBoardingViewModel.self) { resolver in
            OnBoardingViewModel(
                saveFirstTimeUseCase: resolver.resolve(SaveFirstTimeUseCase.self)!
            )
        }
    }
    
}
