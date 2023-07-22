//
//  Auth.swift
//  Domain
//
//  Created by CRISTIAN ANAYA on 20/07/23.
//

import Foundation

public struct Auth: Equatable {
    
    public var user: User?
    public let token: String?
    
    public init(user: User?, token: String?) {
        self.user = user
        self.token = token
    }
    
    public static func == (lhs: Auth, rhs: Auth) -> Bool {
        return lhs.user == rhs.user && lhs.token == rhs.token
    }

}
