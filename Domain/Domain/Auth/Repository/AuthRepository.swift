//
//  AuthRepository.swift
//  Domain
//
//  Created by CRISTIAN ANAYA on 20/07/23.
//

import Foundation
import Combine

public protocol AuthRepository {
    func getOTP(phone: String, country: String) -> AnyPublisher<String, Error>
    func loginWithOTP(phone: String, code: String, verificationId: String) -> AnyPublisher<Auth, Error>
    func register(register: Register) -> AnyPublisher<Auth, Error>
    func getSession() -> AnyPublisher<Auth, Error>
    func firstTime(status: Bool) -> AnyPublisher<Void, Error>
    func getFirstTime() -> AnyPublisher<Bool, Error>
}
