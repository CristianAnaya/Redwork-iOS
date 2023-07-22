//
//  Role.swift
//  Domain
//
//  Created by CRISTIAN ANAYA on 20/07/23.
//

import Foundation

public struct Role: Equatable {
    public let id: String
    public let name: String
    
    public init(id: String, name: String) {
        self.id = id
        self.name = name
    }
    
    public static func == (lhs: Role, rhs: Role) -> Bool {
        return lhs.id == rhs.id &&
               lhs.name == rhs.name
    }

}
