//
//  AuthProxy.swift
//  Infrastructure
//
//  Created by CRISTIAN ANAYA on 21/07/23.
//

import Foundation
import Domain
import Combine

struct AuthProxy: AuthRepository {
    
    private let networkVerify: NetworkVerify
    private let dataSourceRepository: AuthDataSourceRepository
    private let remoteRepository: AuthRemoteRepository
    private let temporalRepository: AuthTemporalRepository
    
    public init(
        networkVerify: NetworkVerify,
        dataSourceRepository: AuthDataSourceRepository,
        remoteRepository: AuthRemoteRepository,
        temporalRepository: AuthTemporalRepository
    ) {
        self.networkVerify = networkVerify
        self.dataSourceRepository = dataSourceRepository
        self.remoteRepository = remoteRepository
        self.temporalRepository = temporalRepository
    }
    
    func getOTP(phone: String, country: String) -> AnyPublisher<String, Error> {
        return networkVerify.hasInternetConnection()
            .flatMap { isConnected -> AnyPublisher<String, Error> in
                if isConnected {
                    return dataSourceRepository.getOTP(phone: phone, country: country)
                } else {
                    return Fail(error: TechnicalException.notConnectedToNetwork).eraseToAnyPublisher()
                }
            }
            .eraseToAnyPublisher()
    }
    
    func loginWithOTP(phone: String, code: String, verificationId: String) -> AnyPublisher<Auth, Error> {
        return networkVerify.hasInternetConnection()
            .flatMap { isConnected -> AnyPublisher<Auth, Error> in
                if isConnected {
                    return self.dataSourceRepository.loginWithOTP(phone: phone, code: code, verificationId: verificationId)
                        .flatMap { phone in
                            self.remoteRepository.login(phone: phone)
                        }
                        .flatMap { auth in
                            self.temporalRepository.saveSession(auth: auth)
                                .map { _ in auth }
                        }
                        .eraseToAnyPublisher()
                } else {
                    return Fail(error: TechnicalException.notConnectedToNetwork).eraseToAnyPublisher()
                }
            }
            .eraseToAnyPublisher()
    }

    func register(register: Register) -> AnyPublisher<Auth, Error> {
        return networkVerify.hasInternetConnection()
            .flatMap { isConnected -> AnyPublisher<Auth, Error> in
                if isConnected {
                    // Realizar el registro en el repositorio remoto y obtener el resultado
                    return self.remoteRepository.register(register: register)
                        .flatMap { auth in
                            // Guardar la sesión en el repositorio temporal y luego devolver el resultado
                            self.temporalRepository.saveSession(auth: auth)
                                .map { _ in auth }
                        }
                        .eraseToAnyPublisher()
                } else {
                    return Fail(error: TechnicalException.notConnectedToNetwork).eraseToAnyPublisher()
                }
            }
            .eraseToAnyPublisher()
    }
    
    func getSession() -> AnyPublisher<Auth, Error> {
        return temporalRepository.getSessionData()
    }
    
    func firstTime(status: Bool) -> AnyPublisher<Void, Error> {
        return temporalRepository.firstTime(status: status)
    }
    
    func getFirstTime() -> AnyPublisher<Bool, Error> {
        return temporalRepository.getFirstTime()
    }
    
}
