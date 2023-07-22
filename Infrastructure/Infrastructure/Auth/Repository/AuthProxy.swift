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
    private let temportalRepository: AuthTemporalRepository
    
    public init(
        networkVerify: NetworkVerify,
        dataSourceRepository: AuthDataSourceRepository,
        temporalRepository: AuthTemporalRepository
    ) {
        self.networkVerify = networkVerify
        self.dataSourceRepository = dataSourceRepository
        self.temportalRepository = temporalRepository
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
    
//    func loginWithOTP(phone: String, code: String, verificationId: String) -> AnyPublisher<Auth, Error> {
//        <#code#>
//    }
//
//    func register(register: Register) -> AnyPublisher<Auth, Error> {
//        <#code#>
//    }
    
    func getSession() -> AnyPublisher<Auth, Error> {
        return temportalRepository.getSessionData()
    }
    
    func firstTime(status: Bool) -> AnyPublisher<Void, Error> {
        return temportalRepository.firstTime(status: status)
    }
    
    func getFirstTime() -> AnyPublisher<Bool, Error> {
        return temportalRepository.getFirstTime()
    }
    
    
}
