//
//  AuthDependencyInjection.swift
//  Presentation
//
//  Created by CRISTIAN ANAYA on 21/07/23.
//

import Foundation
import Swinject

final class AuthDependencyInjection: Assembly {
    func assemble(container: Container) {
        let assemblies: [Assembly] = [
            SplashDependencyAssembler(),
            OnBoardingDependencyAssembler()
        ]
        
        assemblies.forEach { $0.assemble(container: container) }
    }
}

