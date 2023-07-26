//
//  AuthModuleDependencyAssembler.swift
//  Infrastructure
//
//  Created by CRISTIAN ANAYA on 21/07/23.
//

import Swinject
import FirebaseAuth
import Domain

public class AuthModuleDependencyAssembler: Assembly {
    
    public init() {}
    
    public func assemble(container: Container) {
        
        container.register(AuthDataSourceRepository.self) { _ in
            AuthFirebaseRepository(firebaseAuth: Auth.auth())
        }
        .inObjectScope(.container)
        
        container.register(AuthRemoteRepository.self) { _ in
            AuthAlamofireRepository(httpClient: container.resolve(HttpClient.self)!)
        }
        .inObjectScope(.container)
        
        container.register(AuthTemporalRepository.self) { _ in
            AuthUserDefaultsRepository()
        }
        .inObjectScope(.container)
        
        container.register(AuthRepository.self) { container in
            return AuthProxy(
                networkVerify: container.resolve(NetworkVerify.self)!,
                dataSourceRepository: container.resolve(AuthDataSourceRepository.self)!,
                remoteRepository: container.resolve(AuthRemoteRepository.self)!,
                temporalRepository: container.resolve(AuthTemporalRepository.self)!
            )
        }
        .inObjectScope(.container)
    }
    
}
