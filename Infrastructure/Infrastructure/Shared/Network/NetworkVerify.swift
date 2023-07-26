//
//  NetworkVerify.swift
//  Infrastructure
//
//  Created by CRISTIAN ANAYA on 21/07/23.
//

import Foundation
import Alamofire
import Combine

class NetworkVerify {
    private let reachabilityManager = NetworkReachabilityManager()

    func hasInternetConnection() -> AnyPublisher<Bool, Error> {
        let isConnected = reachabilityManager?.isReachable ?? false
        return Just(isConnected)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
