//
//  LoginDependencyAssembler.swift
//  Presentation
//
//  Created by CRISTIAN ANAYA on 22/07/23.
//

import Foundation
import Swinject
import Domain

final class LoginDependencyAssembler: Assembly {
    
    func assemble(container: Container) {
        container.register(GetOTPUseCase.self) { resolver in
            GetOTPUseCase(authRepository: resolver.resolve(AuthRepository.self)!)
        }.inObjectScope(.container)
        
        container.register(LoginUseCase.self) { resolver in
            LoginUseCase(authRepository: resolver.resolve(AuthRepository.self)!)
        }.inObjectScope(.container)
        
        container.register(LoginViewModel.self) { resolver in
            LoginViewModel(
                getOTPUseCase: resolver.resolve(GetOTPUseCase.self)!,
                loginUseCase: resolver.resolve(LoginUseCase.self)!
            )
        }
    }
    
}
