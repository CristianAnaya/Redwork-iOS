//
//  AuthAlamofireRepository.swift
//  Infrastructure
//
//  Created by CRISTIAN ANAYA on 26/07/23.
//

import Foundation
import Combine
import Domain

final class AuthAlamofireRepository: AuthRemoteRepository {
    
    private let httpClient: HttpClient
    
    init(httpClient: HttpClient) {
        self.httpClient = httpClient
    }
    
    func login(phone: String) -> AnyPublisher<Auth, Error> {
        var request = LoginRequest(object: nil)
        request.params = ["phone": phone]
        print(phone)
        return httpClient.requestGeneric(
            request: request,
            entity: AuthDto.self,
            queue: .global()
        )
        .tryMap { authDto in
            return authDto.toAuth()
        }
        .eraseToAnyPublisher()
    }
    
    func register(register: Register) -> AnyPublisher<Auth, Error> {
        do {
            let encoder = JSONEncoder()
            let jsonData = try encoder.encode(register.toRegisterDto())
            let request = RegisterRequest(object: jsonData)

            return httpClient.requestGeneric(
                request: request,
                entity: AuthDto.self,
                queue: .global()
            )
            .tryMap { authDto in
                return authDto.toAuth()
            }
            .eraseToAnyPublisher()
        } catch {
            return Fail(error: TechnicalException.technicalError).eraseToAnyPublisher()
        }
    }

}
