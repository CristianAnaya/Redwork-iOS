//
//  AuthTemporalRepository.swift
//  Infrastructure
//
//  Created by CRISTIAN ANAYA on 21/07/23.
//

import Foundation
import Combine
import Domain

protocol AuthTemporalRepository {
    func saveSession(auth: Auth) -> AnyPublisher<Void, Error>
    func firstTime(status: Bool) -> AnyPublisher<Void, Error>
    func getSessionData() -> AnyPublisher<Auth, Error>
    func getFirstTime() -> AnyPublisher<Bool, Error>
    func updateSessionData(user: User) -> AnyPublisher<Void, Error>
    func logout() -> AnyPublisher<Void, Error>
}
