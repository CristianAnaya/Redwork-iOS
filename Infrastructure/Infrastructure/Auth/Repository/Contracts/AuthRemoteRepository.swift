//
//  AuthRemoteRepository.swift
//  Infrastructure
//
//  Created by CRISTIAN ANAYA on 26/07/23.
//

import Foundation
import Combine
import Domain

protocol AuthRemoteRepository {
    func login(phone: String) -> AnyPublisher<Auth, Error>
}
