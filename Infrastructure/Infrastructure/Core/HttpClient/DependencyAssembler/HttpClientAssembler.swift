//
//  HttpClientAssembler.swift
//  Infrastructure
//
//  Created by CRISTIAN ANAYA on 21/07/23.
//

import Foundation
import Swinject

public final class HttpClientAssembler: Assembly {
    
    public init() {}
    
    public func assemble(container: Container) {
    
        container.register(HttpClient.self) { _ in
            HttpClient()
        }
        .inObjectScope(.container)
    }
    
}
