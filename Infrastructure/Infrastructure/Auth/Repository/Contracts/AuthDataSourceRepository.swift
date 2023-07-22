//
//  AuthDataSourceRepository.swift
//  Infrastructure
//
//  Created by CRISTIAN ANAYA on 21/07/23.
//

import Foundation
import Combine

protocol AuthDataSourceRepository {
    func getOTP(phone: String, country: String) -> AnyPublisher<String, Error>
    func loginWithOTP(phone: String, code: String, verificationId: String) -> AnyPublisher<String, Error>
}
