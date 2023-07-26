//
//  NetworkVerifyAssembler.swift
//  Infrastructure
//
//  Created by CRISTIAN ANAYA on 21/07/23.
//

import Foundation
import Swinject

public final class NetworkVerifyAssembler: Assembly {
    
    public init(){}
    
    public func assemble(container: Container) {
        container.register(NetworkVerify.self) { _ in
            NetworkVerify()
        }
        .inObjectScope(.container)
    }
}
