//
//  RegisterWorkerDependencyAssembler.swift
//  Presentation
//
//  Created by CRISTIAN ANAYA on 27/07/23.
//

import Foundation
import Swinject
import Domain

final class RegisterWorkerDependencyAssembler: Assembly {
    
    func assemble(container: Container) {
        container.register(RegisterUseCase.self) { resolver in
            RegisterUseCase(repository: resolver.resolve(AuthRepository.self)!)
        }.inObjectScope(.container)
        
        container.register(RegisterWorkerViewModel.self) { (resolver, phone: String, role: String) in
            RegisterWorkerViewModel(
                registerUseCase: resolver.resolve(RegisterUseCase.self)!,
                phone: phone,
                role: role
            )
        }
    }
    
}
