//
//  InfrastructureDependencyInjection.swift
//  Presentation
//
//  Created by CRISTIAN ANAYA on 21/07/23.
//

import Foundation

import Swinject
import Infrastructure

final class InfrastructureDependencyInjection: Assembly {
    
    func assemble(container: Container) {
        let assemblies: [Assembly] = [
            HttpClientAssembler(),
            NetworkVerifyAssembler(),
            AuthModuleDependencyAssembler()
        ]
        
        assemblies.forEach { $0.assemble(container: container) }
    }
}
