//
//  DependencyInjectionContainer.swift
//  Presentation
//
//  Created by CRISTIAN ANAYA on 21/07/23.
//

import Foundation
import Swinject
import Infrastructure

final class DependencyInjectionContainer {
    static let shared = DependencyInjectionContainer()

    let assembler: Assembler
    
    init() {
        assembler = Assembler(
            [
                InfrastructureDependencyInjection(),
                AuthDependencyInjection()
            ]
        )
    }
        
    func resolve<Service>(_ serviceType: Service.Type) -> Service? {
        return assembler.resolver.resolve(serviceType)
    }
    
    func resolve<Service>(_ serviceType: Service.Type, argument1 arg1: String) -> Service? {
        return assembler.resolver.resolve(serviceType, argument: arg1)
    }
    
    func resolve<Service>(_ serviceType: Service.Type, argument1 arg1: String, argument2 arg2: String) -> Service? {
        return assembler.resolver.resolve(serviceType, arguments: arg1, arg2)
    }

    
    func resolve<Service>(_ serviceType: Service.Type, arguments arg1: Int, arg2: Bool) -> Service? {
        return assembler.resolver.resolve(serviceType, arguments: arg1, arg2)
    }
}
