//
//  AuthUserDefaultsRepository.swift
//  Infrastructure
//
//  Created by CRISTIAN ANAYA on 21/07/23.
//

import Foundation
import Domain
import Combine

struct AuthUserDefaultsRepository: AuthTemporalRepository {
    
    private let authKey = "AUTH_KEY"
    private let firstTimeKey = "FIRST_TIME_KEY"
    private let userDefaults = UserDefaults.standard
    
    func saveSession(auth: Auth) -> AnyPublisher<Void, Error> {
        do {
            let authData = try JSONEncoder().encode(auth.toAuthDto())
            userDefaults.setValue(authData, forKey: authKey)
            return Just(()).setFailureType(to: Error.self).eraseToAnyPublisher()
        } catch {
            return Fail(error: error).eraseToAnyPublisher()
        }
    }
    
    func firstTime(status: Bool) -> AnyPublisher<Void, Error> {
        userDefaults.setValue(status, forKey: firstTimeKey)
        return Just(()).setFailureType(to: Error.self).eraseToAnyPublisher()
    }
    
    func getSessionData() -> AnyPublisher<Auth, Error> {
        if let authData = userDefaults.data(forKey: authKey) {
             do {
                 let auth = try JSONDecoder().decode(AuthDto.self, from: authData)
                 return Just(auth.toAuth()).setFailureType(to: Error.self).eraseToAnyPublisher()
             } catch {
                 return Fail(error: error).eraseToAnyPublisher()
             }
         } else {
             let emptyAuth = Auth(user: nil, token: nil)
             return Just(emptyAuth).setFailureType(to: Error.self).eraseToAnyPublisher()
         }
    }
    
    func getFirstTime() -> AnyPublisher<Bool, Error> {
        let firstTime = userDefaults.bool(forKey: firstTimeKey)
        return Just(firstTime)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func updateSessionData(user: User) -> AnyPublisher<Void, Error> {
        return getSessionData()
            .tryMap { auth -> Auth in
                var updatedAuth = auth
                updatedAuth.user = user
                return updatedAuth
            }
            .flatMap { updatedAuth -> AnyPublisher<Void, Error> in
                self.saveSession(auth: updatedAuth)
            }
            .eraseToAnyPublisher()
    }
    
    func logout() -> AnyPublisher<Void, Error> {
        userDefaults.removeObject(forKey: authKey)
        return Just(()).setFailureType(to: Error.self).eraseToAnyPublisher()
    }

}
