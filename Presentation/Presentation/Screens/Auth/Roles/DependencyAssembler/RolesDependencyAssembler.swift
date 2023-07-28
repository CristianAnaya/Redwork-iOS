//
//  RolesDependencyAssembler.swift
//  Presentation
//
//  Created by CRISTIAN ANAYA on 27/07/23.
//

import Foundation
import Domain
import Swinject

class RolesDependencyAssembler: Assembly {
    
    func assemble(container: Container) {
        container.register(RolesViewModel.self) { (container, phone: String) in
            RolesViewModel(phone: phone)
        }
    }
    
}
